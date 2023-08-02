public with sharing class ContactTriggerHandler 
{
    public static void NoOfContacts(List<Contact> contacts)
    {
        Set<Id> contactIds = new Set<Id>();
        List<Account> accountListToBeUpdated = new List<Account>();
        for(Contact currentContact:contacts)
        {
            if(currentContact.AccountId!=Null)
            {
                contactIds.add(currentContact.AccountId);
            }
        }

        List<Account> getNoOfContacts = [SELECT NumberOfEmployees,(SELECT Id FROM Contacts) Id FROM Account WHERE Id IN:contactIds];

        for(Account currentContact : getNoOfContacts)
        {
            if(getNoOfContacts.size()!=null)
            {
                currentContact.NumberOfEmployees = currentContact.contacts.size();
            }
        }
        Update getNoOfContacts;
    }
}