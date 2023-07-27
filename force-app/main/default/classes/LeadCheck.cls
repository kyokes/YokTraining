public with sharing class LeadCheck 
{
    public static Boolean identifyTestLeads()
    {
        Boolean isTrue=False;
        List<Lead> getAllLeads = [SELECT Id,Name,Is_Test_Record__c 
                                        FROM Lead 
                                        WHERE Name Like '%Test%'];
        system.debug(getAllLeads);
        if(getAllLeads.size()!=null)
        {
            for(Lead oneLead: getAllLeads)
            {
                oneLead.Is_Test_Record__c=True;
                isTrue=True;
            }
            try 
            {
                update getAllLeads;   
            } catch (DmlException errorMsg) 
            {
               system.debug(errorMsg.getMessage()); 
            }
        }                               
        return isTrue;
    }
}