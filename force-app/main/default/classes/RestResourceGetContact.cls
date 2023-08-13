@RestResource(URLMapping='/v1/gettencontact')
global with sharing class RestResourceGetContact 
{
    @HTTPGET
    global static String gettencontact()
    {
        List<Contact> getContacts = [SELECT Id, LastName FROM Contact LIMIT 10 ];
        return JSON.serialize(getContacts);
    }


    @HTTPPOST
    global static void createAccountContactAndOpportunity()
    {
        RestRequest currentRequestContext = RestContext.request;
        RestResponse currentResponseContext = RestContext.response;


        AccountContactsAndOpportunityList createAccountContactOpportunityData = 
                                                (AccountContactsAndOpportunityList) JSON.deserialize(currentRequestContext.requestBody.toString()
                                                ,RestResourceGetContact.AccountContactsAndOpportunityList.class);
                                                

        for(WrapperToCreateAccountContactOpportunity accountContactOppdata : createAccountContactOpportunityData.listOfAccountsContactsOpportunities)
        {
            Account createAccount = new Account();
            createAccount.Name =  accountContactOppdata.accountName;
            Insert createAccount;
            
            Contact createContact = new Contact();
            createContact.FirstName = accountContactOppdata.contactFirstName;
            createContact.LastName = accountContactOppdata.contactLastName;
            createContact.Email = accountContactOppdata.email;
            createContact.AccountId = createAccount.Id;
            Insert createContact;
    
            Opportunity createOpportunity = new Opportunity();
            createOpportunity.Name = accountContactOppdata.opportunityName;
            createOpportunity.CloseDate =  accountContactOppdata.opportunityCloseDate;
            createOpportunity.StageName =  accountContactOppdata.opportunityStage;
            createOpportunity.AccountId = createAccount.Id;
            Insert createOpportunity;
        }

        currentResponseContext.responseBody = Blob.valueOf('{"isSuccess" : true}');
    }


    public class AccountContactsAndOpportunityList
    {
        List<WrapperToCreateAccountContactOpportunity> listOfAccountsContactsOpportunities {get;set;}
    }

    public class WrapperToCreateAccountContactOpportunity
    {
        public String accountName{get;set;}
        public String contactFirstName{get;set;}
        public String contactLastName{get;set;}
        public String email{get;set;}
        public String opportunityName{get;set;}
        public Date opportunityCloseDate{get;set;}
        public String opportunityStage{get;set;}
    }
}