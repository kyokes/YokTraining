@isTest
public with sharing class TestAccountBuilder {
        String name = 'Test Account';
        String website = 'testaccount.com';
        String billingStreet = 'test street';
        String billingState = 'test state';
        String billingCity = 'test city';
        String billingCountry = 'test country';
        String billingZipcode = '4568';
        String phone = '1234567891';
       

        public TestAccountBuilder setName(String name){
            this.name = name;
            return this;
         }

        public TestAccountBuilder setWebsite(String website){
            this.website = website;
            return this;
         }

        public TestAccountBuilder setBillingStreet(String billingStreet){
            this.billingStreet = billingStreet;
            return this;
         }

        public TestAccountBuilder setBillingState(String billingState){
            this.billingState = billingState;
            return this;
         }

        public TestAccountBuilder setBillingCity(String billingCity){
            this.billingCity = billingCity;
            return this;
         }
        
        
        public TestAccountBuilder setBillingCountry(String billingCountry){
            this.billingCountry = billingCountry;
            return this;
        }
        
        public TestAccountBuilder setBillingZipcode(String billingZipcode){
            this.billingZipcode = billingZipcode;
            return this;
        }
        
        public TestAccountBuilder setPhone(String phone){
            this.phone = phone;
            return this;
        }

        public Account build() {
            Account insertAccount = new Account();
            insertAccount.Name = name;
            insertAccount.Website = website;
            insertAccount.BillingStreet = billingStreet;
            insertAccount.BillingState = billingState;
            insertAccount.BillingCity = billingCity;
            insertAccount.BillingCountry = billingCountry;
            insertAccount.BillingPostalCode = billingZipcode;
            insertAccount.Phone = phone;
    
            return insertAccount;
            
         }
    
         public Account buildAndSave() {
            Account recordsToInsert = build();
            Insert recordsToInsert;
            return recordsToInsert;
         }
    

    }
