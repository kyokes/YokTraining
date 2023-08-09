public with sharing class UpdateAccountWithRandomNumber implements Database.Batchable<SObject> 
{
    Integer randomNumber;
    /*public UpdateAccountWithRandomNumber()
    {
        randomNumber = Integer.valueOf(Math.random() * 1000);
    }*/

    public static Integer generateRandomNumber()
    {
        return Integer.valueOf(Math.random() * 1000);
    }
    public Database.QueryLocator start(Database.BatchableContext context)
    {
        String query = 'SELECT Id,RandomNumber__c,(SELECT Id,RandomNumber__c FROM Contacts) FROM Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext context, List<Account> accountsNeedsToBeUpdatedWithRandomNumber)
    {
        List<Contact> contactsNeedsToBeUpdated = new List<Contact>();
        for(Account accountToBeUpdated :accountsNeedsToBeUpdatedWithRandomNumber)
        {
            randomNumber=generateRandomNumber();
            accountToBeUpdated.RandomNumber__c = randomNumber;

            for(Contact contactToBeUpdated : accountToBeUpdated.Contacts)
            {
                contactToBeUpdated.RandomNumber__c= randomNumber;
                contactsNeedsToBeUpdated.add(contactToBeUpdated);
            }
        }
        Update accountsNeedsToBeUpdatedWithRandomNumber;
        Update contactsNeedsToBeUpdated;

    }
    public void finish(Database.BatchableContext context)
    {
        AsyncApexJob job= [SELECT Id, JobType, Status, MethodName, TotalJobItems FROM AsyncApexJob WHERE Id = : context.getJobId()];
        System.debug(job);
    }
}