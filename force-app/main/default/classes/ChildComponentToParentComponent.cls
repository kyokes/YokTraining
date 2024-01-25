public with sharing class ChildComponentToParentComponent 
{
    @AuraEnabled(Cacheable = true)
    public static List<Account> retrieveListOfAccounts()
    {
        return [SELECT Name FROM Account LIMIT 5];
    }

    public static void getFiveAccounts()
    {
        List<Account> fiveAccounts = [SELECT Id, Name FROM Account LIMIT 5];

        Set<Id> accountIds = new Set<Id>();

        Map<Id,Account> mapOfAccount = new Map<Id,Account>();

        for(Account oneAccount : fiveAccounts)
        {
            accountIds.add(oneAccount.Id);
            mapOfAccount.put(oneAccount.Id, oneAccount);
        }

        for(Id ids:accountIds)
        {
            System.debug(ids);
            for(Id accountMapIds:mapOfAccount.keySet())
            {
                System.debug(accountMapIds);
            }
        }
    }
}