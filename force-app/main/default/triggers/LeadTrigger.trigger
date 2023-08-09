trigger LeadTrigger on Lead (before insert,after insert,before update) 
{
    switch on Trigger.operationType
    {
        when BEFORE_INSERT
        {
            LeadTriggerHandler.assignSalesRepBasedOnRegion(trigger.new);
        }
        when AFTER_INSERT
        {
            LeadTriggerHandler.insertIntegrationLog(trigger.new);
        }
        when BEFORE_UPDATE
        {
            LeadTriggerHandler.trackFieldHistoryOnLeadName(trigger.new);
        }
    }
}