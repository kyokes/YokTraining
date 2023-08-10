trigger AccountTrigger on Account (after insert,after update,before insert) 
{
    switch on Trigger.operationType
    {
        when AFTER_UPDATE
        {
           // AccountTriggerHandler.getAllOpportunitiesRelatedToAccount(trigger.new);
        
        }
        when AFTER_INSERT
        {
           AccountTriggerHandler.validateAddress(trigger.new);
        }
        when BEFORE_INSERT
        {
           AccountTriggerHandler.populateCountryName(trigger.new);
        }
    }
    
}
