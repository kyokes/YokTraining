public with sharing class IntegrationLogTriggerHandler 
{
    public static void updateResponseBodyAndIsSucessful(List<Integration_Log__c> allLogs)
    {
        for(Integration_Log__c currentLog : allLogs)
        {
            System.enqueueJob(new ProcessIntegrationData(currentLog.Id));
        }
    }
}