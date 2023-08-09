public with sharing class ScheduleToDeleteLeadWithNameTest implements Schedulable
{
    Database.DeleteResult[] deleteResult;
    public void execute(SchedulableContext context)
    {
        List<Lead> leadsToBeDeleted = [SELECT Id, Name FROM Lead WHERE Name LIKE '%Test%'];

        List<User> getAllUsers = [SELECT Id,Email FROM User WHERE Profile.Name ='System Administrator'];

        List<String> emailIds = new List<String>();

        List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();

        for(User getEmailId: getAllUsers)
        {
            emailIds.add(getEmailId.Email);
        }

        if(leadsToBeDeleted!=Null)
        {
            deleteResult = Database.delete(leadsToBeDeleted,false);
        }
        for(Database.DeleteResult dr : deleteResult)
        {
            if(dr.isSuccess()==True)
            {
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.setToAddresses(emailIds);
                message.setSubject('Sucessfully Deleted');
                message.setPlainTextBody('Successfully deleted Lead with Id: ' + dr.getId());
                messages.add(message);
            }
            else
            {
                for(Database.Error err:dr.getErrors())
                {
                    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                    message.setToAddresses(emailIds);
                    message.setSubject('Error While Deleting');
                    message.setPlainTextBody('The following error has occurred.');
                    message.setPlainTextBody(err.getStatusCode() + ': ' + err.getMessage());
                    messages.add(message);
                }
            }
        }
        List<Messaging.SendEmailResult> messageSend =  Messaging.sendEmail(messages);
    }
}