public with sharing class ContactDetailComponent 
{
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(String conId)
    {
        List<Contact> thatContact = [SELECT Id,
                                      FirstName,
                                      LastName,
                                      Phone,
                                      Email,
                                      MailingStreet, 
                                      MailingCity, 
                                      MailingState, 
                                      MailingPostalCode, 
                                      MailingCountry
                                FROM
                                     Contact
                                WHERE 
                                     Id=:conId];
        
        return thatContact;
    }
}