trigger IntegrationLogTrigger on Integration_Log__c (after insert) 
{
    switch on Trigger.operationType
    {
        when AFTER_INSERT
        {
            IntegrationLogTriggerHandler.updateResponseBodyAndIsSucessful(trigger.new);
        }
    }
}