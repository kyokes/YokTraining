trigger ContactTrigger on Contact (after insert,after update,after delete) 
{
    switch on Trigger.operationType
    {

        when AFTER_INSERT
        {
            ContactTriggerHandler.NoOfContacts(trigger.new);
        }
        when AFTER_UPDATE        
        {
            ContactTriggerHandler.NoOfContacts(trigger.new);
        }
        when AFTER_DELETE
        {
            ContactTriggerHandler.NoOfContacts(trigger.old);
        }

    }
}