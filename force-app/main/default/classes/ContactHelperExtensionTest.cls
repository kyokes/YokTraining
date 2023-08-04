@isTest
public with sharing class ContactHelperExtensionTest 
{
    public static List<Contact> contactsToBeInserted = new List<Contact>();
    @TestSetup
    static void makeData()
    {   
        // Contact firstContact = new Contact();
        // firstContact.LastName='Alpha';
        // firstContact.Email='yokeshkaruppiah@gmail.com';
        // firstContact.Phone=9840987123;
        // contactsToBeInserted.add(firstContact); 
        // Contact secondContact = new Contact();
        // secondContact.LastName='Beta';
        // secondContact.Email='reghostephen@gmail.com';
        // secondContact.Phone=9840987143;
        // contactsToBeInserted.add(secondContact);
        // Insert contactsToBeInserted;
        Contact firstContact = new TestContact()
                                                .setFirstName('Devadharshini')
                                                .setLastName('P')
                                                .setEmail('devadharshini062003@gmail.com')
                                                .build();
         Contact secondContact = new TestContact()
                                                .setFirstName('Beta')
                                                .setLastName('P')
                                                .setEmail('reghostephen@gmail.com')
                                                .setPhone('')
                                                .build();
         contactsToBeInserted.add(firstContact);
         contactsToBeInserted.add(secondContact);
         Insert contactsToBeInserted;                                         
                                        

    }
    @IsTest
    static void methodName()
    {
        List<Contact> updateContacts = [SELECT Id,Description FROM Contact LIMIT 2];
        system.assertEquals(null, updateContacts.get(0).Description, 'Description Is not Null');
        Update updateContacts;
        system.assertEquals('Contacts Updated', updateContacts.get(0).Description, 'Description Does not Match');
    }
}