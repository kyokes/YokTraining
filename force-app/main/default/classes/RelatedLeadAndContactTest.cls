@isTest
public with sharing class RelatedLeadAndContactTest 
{
   @TestSetup
    static void makeData()
    {
        Contact newContactRecord = new Contact();
        newContactRecord.LastName ='Test';
        newContactRecord.Email='test@test.com';
        Insert newContactRecord;
        Lead newLeadRecord = new Lead();
        newLeadRecord.LastName='TestLead';
        newLeadRecord.Email='test@test.com';
        newLeadRecord.Company='4i Apps';
        Insert newLeadRecord;   
    }
    @IsTest
    static void methodName() 
    {
        RelatedLeadAndContact.leadContactRelate([SELECT Id FROM Contact LIMIT 1].Id);   
    }
}