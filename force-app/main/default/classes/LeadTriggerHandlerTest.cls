@IsTest
public with sharing class LeadTriggerHandlerTest 
{
    public static List<Lead> leadsToBeInserted = new List<Lead>();

    static void makeData()
    {
        Lead firstLead = new TestLeadBuilder()
                                            .setLeadName('Alpha')
                                            .setCompanyName('Tescct')
                                            .setcountryName('India')
                                            .setstatus('Open - Not Contacted')
                                            .build();
           
        Lead secondLead = new TestLeadBuilder()
                                            .setLeadName('Beta')
                                            .setCompanyName('Tescct')
                                            .setcountryName('India')
                                            .setstatus('Open - Not Contacted')
                                            .build();

        Lead thirdLead = new TestLeadBuilder()
                                            .setLeadName('Omega')
                                            .setCompanyName('Test')
                                            .setcountryName('UAE')
                                            .setstatus('Open - Not Contacted')
                                            .build();
        leadsToBeInserted.add(firstLead);                                       
        leadsToBeInserted.add(secondLead);
        leadsToBeInserted.add(thirdLead);
        Insert leadsToBeInserted;
    }
    @IsTest
    static void methodName(){
        
        //Test.startTest();
        makeData();
        //Test.stopTest();
        
    }
                                    
}