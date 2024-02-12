public with sharing class ContactTriggerHandlerNew 
{
    public static void sendEmail(List<Contact> listOfContacts)
    {
        List<String> emailIds = new List<String>();

        for(Contact currentContact: listOfContacts)
        {
            emailIds.add(currentContact.Email);
        }

        EmailTemplate getEmailTemplateId = [SELECT Id, Name, Subject FROM EmailTemplate WHERE Name = 'Sales: New Customer Email'];

        for(Contact currentContact:listOfContacts)
        {
            if(currentContact.Email !=Null)
            {
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.setToAddresses(emailIds);
                System.debug(emailIds);
                message.setTemplateId(getEmailTemplateId.Id);
                message.setSaveAsActivity(false);
                message.setTargetObjectId(currentContact.OwnerId);
                
                try 
                {
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { message });    
                } 
                catch (Exception e) 
                {
                    System.debug(e.getMessage());
                }
            }
        }
    }

    public static void preventDuplicates(List<Contact> contactsList)
    {
        Set<String> emailIds = new Set<String>();
        Set<String> phoneNos = new Set<String>();

        for(Contact currentContact:contactsList)
        {
            emailIds.add(currentContact.Email);
            phoneNos.add(currentContact.Phone);
        }

        List<Contact> findDuplicates = [SELECT Id,
                                               Name,
                                               Phone,
                                               Email 
                                        FROM 
                                            Contact 
                                        WHERE 
                                            Email =:emailIds 
                                        AND Phone =:phoneNos];

        for(Contact currentContact:contactsList)
        {
            if(findDuplicates.size()!=0)
            {
                currentContact.addError('Duplicate Found');
            }
        }
    }
}