@isTest
public class ContactTriggerHandlerTest 
{
    public static List<Contact> insertNewContactRecord = new   List<Contact>();
    static void makeData()
    {
        // Contact firstContact = new Contact();
        // firstContact.LastName='Alpha';
        // firstContact.Email='yokeshkaruppiah@gmail.com';
        // insertNewContactRecord.add(firstContact); 
        // Contact secondContact = new Contact();
        // secondContact.LastName='Beta';
        // secondContact.Email='reghostephen@gmail.com';
        // insertNewContactRecord.add(secondContact);
        // Insert insertNewContactRecord;

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
         insertNewContactRecord.add(firstContact);
         insertNewContactRecord.add(secondContact);
         Insert insertNewContactRecord; 
    }
    @IsTest
    static void methodName()
    { 
        //Test.startTest();
        system.assertEquals(0, Limits.getEmailInvocations(),'No Emails Should be Sent');
        makeData();
        //ContactTriggerHandler.sendWelcomeMessage(insertNewContactRecord);
        system.assertEquals(1, Limits.getEmailInvocations(),'Emails Should be Sent');
        //Test.stopTest();
        
    }
}