trigger TaskTrigger on Task (before delete) 
{
    switch on Trigger.operationType
    {
        when BEFORE_DELETE
        {
            TaskTriggerHandler.onlySysAdminCanDelete(Trigger.old);
        }
    }
}