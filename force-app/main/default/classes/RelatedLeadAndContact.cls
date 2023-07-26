public with sharing class RelatedLeadAndContact 
{
    public static String emailId;
    public static Id leadId;

    public static void leadContactRelate(Id contactId)
    {
        System.debug('Asynchoronous');
        List<Contact> getContacts = [SELECT     Id,
                                                Email 
                                        FROM Contact 
                                        WHERE Id =:contactId];

        for(Contact con : getContacts)
        {
            emailId=con.Email;
        }
        List<Lead> getLeads = [SELECT   Id, 
                                        Email 
                                    FROM Lead 
                                    WHERE Email =:emailId];

        for(Lead le : getLeads)
        {
            leadId=le.Id;
        }
        for(Contact con:getContacts)
        {
                con.Lead__c=leadId;
        }
        try 
            {
                update getContacts;
            }
            catch (DmlException errorMsg) 
            {
              system.debug(errorMsg.getMessage());
            }
    }
}