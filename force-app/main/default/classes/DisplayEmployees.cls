public with sharing class DisplayEmployees 
{
    @AuraEnabled
    public static Contact createContact(String fName,String lName,String email, String phone)
    {
        Contact createNewContact = new Contact();
        createNewContact.FirstName=fName;
        createNewContact.LastName=lName;
        createNewContact.Email=email;
        createNewContact.Phone=phone;
        Insert createNewContact;

        return createNewContact;
    }
}