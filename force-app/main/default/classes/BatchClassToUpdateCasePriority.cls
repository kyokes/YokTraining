public with sharing class BatchClassToUpdateCasePriority implements Database.Batchable<SObject>
{
    public Database.QueryLocator start(Database.BatchableContext context)
    {
        String casesToUpdate = 'SELECT Id, Priority, Subject FROM Case WHERE Priority = Null';

        return Database.getQueryLocator(casesToUpdate);
    }
    public void execute(Database.BatchableContext context,List<SObject> caseList)
    {
        for(Case currentCase : (List<Case>)caseList)
        {
            if(currentCase.Priority == Null)
            {
                currentCase.Priority = 'Low';
            }
        }
        Update caseList;
    }
    public void finish(Database.BatchableContext context)
    {
        System.debug('Batch Job Finished');
        //Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage(); 
    }
}