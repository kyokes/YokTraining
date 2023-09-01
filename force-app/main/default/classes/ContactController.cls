public with sharing class ContactController 
{
    @AuraEnabled
    public static Boolean doesContactExist(String email) 
    {
        // Check if a contact with the given email already exists
        List<Contact> existingContacts = [SELECT Id FROM Contact WHERE Email = :email LIMIT 1];
        return !existingContacts.isEmpty();
    }

    @AuraEnabled
    public static void createContactRecord(String firstName, String lastName, String email, String phone) 
    {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        newContact.Phone = phone;
        insert newContact;
    }
}
