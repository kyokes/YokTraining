public with sharing class OpportunityHelper extends UtilityHelper
{
    public static void createNewAccount()
    {
        Account newAccountRecord = new Account();
        newAccountRecord.Name = 'Test' + generateRandomString();
        insert newAccountRecord; 
    }
}