public with sharing class AccountComponent 
{
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts()
    {   
        List<Account> getTenAccounts = [SELECT Id,Name,Website FROM Account LIMIT 5];
        return getTenAccounts;
    }
}