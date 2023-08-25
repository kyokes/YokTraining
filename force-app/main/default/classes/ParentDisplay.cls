public with sharing class ParentDisplay 
{   
    @AuraEnabled
    public static List<Contact> getContacts()
    {
        List<Contact> getTenContacts = [SELECT Name, Phone FROM Contact LIMIT 5];

        return getTenContacts;
    }
}