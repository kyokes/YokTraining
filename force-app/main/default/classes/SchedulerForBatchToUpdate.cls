public with sharing class SchedulerForBatchToUpdate implements Schedulable{
    public SchedulerForBatchToUpdate() {
        
    }
    public void execute(SchedulableContext context)
    {
        Database.executeBatch(new UpdateAccountWithRandomNumber());
    }
}