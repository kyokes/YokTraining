public with sharing class ContactComponent 
{
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId)
    {
        List<Contact> getFiveContacts = [SELECT Name,Phone,Email FROM Contact WHERE AccountId =:accId];
        System.debug(getFiveContacts);
        return getFiveContacts;
    }
}