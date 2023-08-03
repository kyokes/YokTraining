trigger LeadTrigger on Lead (before insert) 
{
    switch on Trigger.operationType
    {
        when BEFORE_INSERT
        {
            LeadTriggerHandler.assignSalesRepBasedOnRegion(trigger.new);
        }
    }
}