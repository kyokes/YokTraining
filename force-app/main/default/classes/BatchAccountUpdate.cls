public with sharing class BatchAccountUpdate implements Database.Batchable<SObject>
{
    public Database.QueryLocator start(Database.BatchableContext context)
    {
        String accountsToUpdate = 'SELECT Id,IsUpdated__c FROM Account Where IsUpdated__c=FALSE';

        return Database.getQueryLocator(accountsToUpdate);
    }
    public void execute(Database.BatchableContext context,List<SObject> accountsToUpdate)
    {
        for(Account accountToUpdate:(List<Account>)accountsToUpdate)
        {
            accountToUpdate.IsUpdated__c=True;
        }
    }
    public void finish(Database.BatchableContext context)
    {
        
    }
}