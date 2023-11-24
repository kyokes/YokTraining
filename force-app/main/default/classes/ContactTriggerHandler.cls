public with sharing class ContactTriggerHandler 
{
    public static void noOfContacts(List<Contact> contacts)
    {
        Set<Id> accountIds = new Set<Id>();

        List<Account> accountListToBeUpdated = new List<Account>();

        for(Contact currentContact:contacts)      
        {
            if(currentContact.AccountId!=Null)
            {
                accountIds.add(currentContact.AccountId);
            }
        }

        List<Account> getNoOfContacts = [SELECT NumberOfEmployees,(SELECT Id FROM Contacts) Id FROM Account WHERE Id IN:accountIds];

        for(Account currentContact : getNoOfContacts)
        {
            if(getNoOfContacts.size()!=null)
            {
                currentContact.NumberOfEmployees = currentContact.contacts.size();
            }
        }

        Update getNoOfContacts;
    }

    public static void noOfContacts(List<Contact> contacts,Map<Id, Contact> oldContactsMap)
    {
        Set<Id> accountIds = new Set<Id>();
        List<Account> accountListToBeUpdated = new List<Account>();
        for(Contact currentContact:contacts)
        {
            if(currentContact.AccountId!=Null)
            {
                accountIds.add(currentContact.AccountId);
            }
            if (oldContactsMap != null && oldContactsMap.containsKey(currentContact.Id) && oldContactsMap.get(currentContact.Id).AccountId != currentContact.AccountId) {
                accountIds.add(oldContactsMap.get(currentContact.Id).AccountId);
            }
        }

        List<Account> getNoOfContacts = [SELECT NumberOfEmployees,(SELECT Id FROM Contacts) Id FROM Account WHERE Id IN:accountIds];

        for(Account currentContact : getNoOfContacts)
        {
            if(getNoOfContacts.size()!=null)
            {
                currentContact.NumberOfEmployees = currentContact.contacts.size();
            }
        }
        Update getNoOfContacts;
    }
    
    public static void sendWelcomeMessage(List<Contact> sendEmailToContacts)
    {
        List<Messaging.SingleEmailMessage> message = 
                                        new List<Messaging.SingleEmailMessage>(); 
        for(Contact currentContact : sendEmailToContacts)
        {
            Messaging.SingleEmailMessage emailToBeSend = 
                                            new Messaging.SingleEmailMessage();
                            
            emailToBeSend.setToAddresses(new List<String>{currentContact.Email});
            emailToBeSend.setSubject('Welcome Message');
            emailToBeSend.plaintextbody='Welcome to 4iApps ';
            message.add(emailToBeSend);
        }
        List<Messaging.SendEmailResult> messageSend = 
                                                Messaging.sendEmail(message);
    }
}
    