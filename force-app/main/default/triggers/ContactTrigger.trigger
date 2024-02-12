trigger ContactTrigger on Contact (after insert,after update,after delete,before update,before insert) 
{
    switch on Trigger.operationType
    {
        when BEFORE_INSERT
        {
            ContactTriggerHandlerNew.sendEmail(trigger.new);
            ContactTriggerHandlerNew.preventDuplicates(trigger.new);
        }
        when AFTER_INSERT
        {
            ContactTriggerHandler.NoOfContacts(trigger.new);
            //ContactTriggerHandler.sendWelcomeMessage(trigger.new);
        }
        /*when BEFORE_UPDATE
        {
            ContactHelperExtension.updateDescription(trigger.new);
        }*/
        when AFTER_UPDATE        
        {
            ContactTriggerHandler.NoOfContacts(trigger.new);
            //ContactTriggerHandler.NoOfContacts(trigger.new, trigger.oldMap);
        }
        when AFTER_DELETE
        {
            ContactTriggerHandler.NoOfContacts(trigger.old);
        }

    }
}