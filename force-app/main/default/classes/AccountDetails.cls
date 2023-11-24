public with sharing class AccountDetails 
{
    public AccountDetails(ApexPages.StandardController stdController) 
    {        
        Account acct = (Account)stdController.getRecord(); 
        System.debug(acct);   
    }
}