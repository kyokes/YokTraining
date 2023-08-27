public with sharing class PreventDuplicates 
{
    @AuraEnabled(cacheable=true)
    public static List<Contact> findDuplicates(String email)
    {
        List<Contact> getDuplicateContact = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE Email =:email];

        return getDuplicateContact;
    }
}