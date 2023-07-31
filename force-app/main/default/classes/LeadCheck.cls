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
    public static void queryTest()
    {
        List<Opportunity> getRelatedAccountsAndProducts = [SELECT 
                                                                 StageName, 
                                                                 Name, 
                                                                 CloseDate,
                                                                 Account.Name,
                                                                 (SELECT 
                                                                        Name 
                                                                        FROM OpportunityLineItems)
                                                                FROM Opportunity];
        system.debug(getRelatedAccountsAndProducts);

        List<Contact> getAllContactsWhichAreNotRelatedToAccount =[SELECT
                                                                        Id,
                                                                        LastName
                                                                FROM 
                                                                    Contact
                                                                WHERE AccountId=Null];
        system.debug(getAllContactsWhichAreNotRelatedToAccount);

        List<Account> getAllAccountsWhichAreNotRelatedToContact =[SELECT 
                                                                        Name 
                                                                  FROM 
                                                                        Account 
                                                                  WHERE 
                                                                        Id NOT IN (SELECT 
                                                                                        AccountId 
                                                                                    FROM 
                                                                                        Contact)];
        system.debug(getAllAccountsWhichAreNotRelatedToContact);
    }
    public static void dynamicQuery()
    {
        String queryToExecute='SELECT Id , Name FROM Account';

        String dayOfToday = Datetime.now().format('E');

        Set<String> lastWeek = new Set<String>{'Mon','Tue','Wed'};
        Set<String> thisWeek = new Set<String>{'Thu','Fri','Sat'};
        
        if(lastWeek.contains(dayOfToday))
        {
            queryToExecute+= ' WHERE CreatedDate >= LAST_WEEK';
        }
        else if(thisWeek.contains(dayOfToday))
        {
            queryToExecute+= ' WHERE CreatedDate >= THIS_WEEK';
        }
        List<SObject> result =Database.query(queryToExecute);
        System.debug(queryToExecute);
        System.debug(result);
    }
}