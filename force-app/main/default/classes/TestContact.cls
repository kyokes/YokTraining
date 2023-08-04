@isTest
public with sharing class TestContact {
    String firstName = '';
    String lastName = '';
    String email = '';
    String phone = '1234567891';

    
    public TestContact setFirstName(String firstName){
        this.firstName = firstName;
        return this;
     }

     public TestContact setLastName(String lastName){
        this.lastName = lastName;
        return this;
     }

     public TestContact setEmail(String email){
        this.email = email;
        return this;
     }

     public TestContact setPhone(String phone ){
        this.phone = phone;
        return this;
     }


     public Contact build() {
        Contact insertContact = new Contact();
        insertContact.FirstName = firstName;
        insertContact.LastName = lastName;
        insertContact.Email = email;
        insertContact.Phone = phone;

        return insertContact;
        
     }

     public Contact buildAndSave() {
        Contact recordsToInsert = build();
        Insert recordsToInsert;
        return recordsToInsert;
     }

}