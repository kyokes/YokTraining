public with sharing class TaskTriggerHandler 
{
    public static void onlySysAdminCanDelete(List<Task> listOfTasks)
    {
        String getCurrentUserProfileId = Userinfo.getProfileId();
        Profile getProfileName = [SELECT Id,Name FROM Profile Where Id =:getCurrentUserProfileId];
        String profileName = getProfileName.Name;

        for(Task currentTask : listOfTasks)
        {
            if(profileName != 'System Administrator')
            {
                currentTask.addError('You dont have access to delete this record');
            }
        }

        
    }
}