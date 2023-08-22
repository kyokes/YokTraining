public with sharing class EmployeeMasterPage 
{
    @AuraEnabled(cacheable=true)
    public static List<Contact> returnTenContacts()
    {
        List<Contact> tenContacts = [SELECT Name, Email, Phone FROM Contact LIMIT 10];

        return tenContacts;
    }
}