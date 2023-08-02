// This is a trigger that executes before Opportunity records are inserted.
trigger OpportunityTrigger on Opportunity (before insert,after insert,after update) 
{
    // Using a switch statement to handle different trigger operation types.
    switch on Trigger.operationType
    {
        // When the trigger operates before insertion of records.
        when BEFORE_INSERT
        {
            // Call the static method from OpportunityTriggerHandler class to update Opportunity names.
            // Pass in the list of new Opportunity records that are being inserted.
            OpportunityTriggerHandler.updateOpportunityName(Trigger.new);
        }
        when AFTER_INSERT
        {
            OpportunityTriggerHandler.addServiceCharges(Trigger.new);
            OpportunityTriggerHandler.getAllOpportunitiesAmount(Trigger.new);
        }
        when AFTER_UPDATE
        {
            OpportunityTriggerHandler.getAllOpportunitiesAmount(Trigger.new);
        }
    }
}
