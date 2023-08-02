trigger AccountTrigger on Account (after insert,after update) 
{
    /*switch on Trigger.operationType
    {
        when AFTER_UPDATE
        {
            AccountTriggerHandler.getAllOpportunitiesRelatedToAccount(trigger.new);
        }
    }*/
}