public with sharing class AccountDetailsCustom {
    public Account accountRecord{get;set;}

    public AccountDetailsCustom() 
    {
        accountRecord = [SELECT Id, Name FROM Account LIMIT 1];
    }

    public void saveAccount()
    {
        System.debug(accountRecord);
    }
}