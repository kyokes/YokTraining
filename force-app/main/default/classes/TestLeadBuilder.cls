@IsTest
public with sharing class TestLeadBuilder 
{
    String leadName='';
    String companyName='';
    String status='';
    String countryName='';

    public TestLeadBuilder setLeadName(String leadName)
    {
        this.leadName=leadName;
        return this;
    }
    public TestLeadBuilder setCompanyName(String companyName)
    {
        this.companyName=companyName;
        return this;
    }
    public TestLeadBuilder setstatus(String status)
    {
        this.status=status;
        return this;
    }
    public TestLeadBuilder setcountryName(String countryName)
    {
        this.countryName=countryName;
        return this;
    }
    public Lead build()
    {
        Lead newLead = new Lead();
        newLead.LastName=leadName;
        newLead.Company=companyName;
        newLead.Status=status;
        newLead.Country=countryName;

        return newLead;
    }
    public Lead buildAndSave()
    {
        Lead recordsToInsert = build();
        Insert recordsToInsert;
        return recordsToInsert;
    }
}