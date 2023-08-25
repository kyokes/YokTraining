public with sharing class GetContactsWithAccount 
{
    @AuraEnabled(cacheable=true)
    public static List<Account> getRelatedContacts()
    {
        List<Account> getAccounts = [SELECT Name,
                                            (SELECT Id, 
                                                    Name, 
                                                    Email, 
                                                    Phone 
                                             FROM 
                                                 Contacts) 
                                    FROM 
                                        Account 
                                    // WHERE 
                                    //     Name =:'Salesforce Team'
                                    LIMIT 5];

        return getAccounts;
    }
}