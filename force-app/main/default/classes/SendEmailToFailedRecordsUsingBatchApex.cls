public with sharing class SendEmailToFailedRecordsUsingBatchApex implements Database.Batchable<SObject>
{
    public Database.QueryLocator start(Database.BatchableContext context)
    {
        String query = 'SELECT Id, Name,Industry FROM Account LIMIT 5';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext context,List<Account> scope)
    {
        for(Account currentAccount : scope)
        {
            if(currentAccount.Industry == NULL)
            {
                currentAccount.Industry = 'Agriculture';
            }
        }
        Update scope;
    }
    public void finish(Database.BatchableContext context)
    {
        List<AsyncApexJob> getJobStatus = [SELECT Id, JobType, ApexClassId, CreatedDate, MethodName, 
                                            LastProcessed, LastProcessedOffset, Status, CreatedById, NumberOfErrors, 
                                            CompletedDate, JobItemsProcessed 
                                            FROM AsyncApexJob];

        System.debug(getJobStatus);
    }
}