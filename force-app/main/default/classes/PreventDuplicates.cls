public with sharing class PreventDuplicates {
    @AuraEnabled(cacheable=true)
    public static List<Contact> findDuplicates(String email) {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE Email = :email];
    }

    @AuraEnabled(cacheable=true)
    public static Contact createContact(String fName, String lName, String email, String phone) {
        Contact newContact = new Contact();
        newContact.FirstName = fName;
        newContact.LastName = lName;
        newContact.Email = email;
        newContact.Phone = phone;

        insert newContact;

        return newContact;
    }
}
