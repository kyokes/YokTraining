@isTest
public with sharing class AccountTriggerHandlerTest {
   @isTest
    static void makeData()
   {
    Account testAccount = new TestAccountBuilder()
                                             .setBillingCountry(null)
                                             .buildAndSave();
                                             
                                           }
                                           
   
   
}