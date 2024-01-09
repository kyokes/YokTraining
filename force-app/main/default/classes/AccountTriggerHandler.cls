public with sharing class AccountTriggerHandler 
{
    public static void getAllOpportunitiesRelatedToAccount(List<Account> accountRecord)
    {
        Set<Id> accountIds= new Set<Id>();
        for(Account currentAccount:accountRecord)
        {
            accountIds.add(currentAccount.Id);
        }

        List<AggregateResult> getOpportunityTotalAmount =[SELECT SUM(Amount)
                                                                    FROM 
                                                                        Opportunity
                                                                    WHERE StageName =:'Closed Won' AND AccountId IN: accountIds];

        for(AggregateResult ar:getOpportunityTotalAmount)
        {
            system.debug(ar);
        }
    }


    public static void populateCountryName(List<Account> accountRecord)
     {
        for(Account currentAccount:accountRecord){
            if(currentAccount.BillingCountry == null) 
            {
                currentAccount.BillingCountry = 'USA';
            }
        
        }
     }

     public static void validateAddress(List<Account> accountRecords)
     {
        for(Account currentAccount : accountRecords)
        {
            if(currentAccount.ByPassAddressValidation__c==False)
            {
                System.enqueueJob(new validateAddressOnAccount(currentAccount.Id));
            }
        }
     }

     public static void countNumberOfContacts(List<Account> listOfAccounts)
	{
		Set<Id> accountIds = new Set<Id>();
		
		for(Account currentAccount : listOfAccounts)
		{
			accountIds.add(currentAccount.Id);	
		}
		
		List<Contact> noOfContacts = [SELECT Id,LastName FROM Contact WHERE AccountId =:accountIds];
		
		for(Account currentAccount : listOfAccounts)
		{
			currentAccount.NumberOfEmployees = noOfContacts.Size();
		}
		Update listOfAccounts;		
	}

    public static void main()
    {
        List<Account> getAllAccounts = [SELECT Id, Name,(SELECT Name FROM Contacts) FROM Account];

        for(Account ac : getAllAccounts)
        {
            system.debug('Account Name is : '+ac.Name);
            for(Contact con:ac.Contacts)
            {
                System.debug('Contact Name is : '+con.Name);
            }
        }
    }
}


