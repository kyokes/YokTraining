public with sharing class AsynchronousApexDemo 
{
    @future
    public static void countNumberOfContacts(List<Id> accountIds)
    {
        List<Account> accountHasContacts = [SELECT
                                                Id,
                                                Name,
                                                (SELECT
                                                      Id,
                                                      LastName
                                                FROM 
                                                    Contacts)
                                            FROM 
                                                Account
                                            WHERE
                                                Id =: accountIds];

        for(Account currentAccount : accountHasContacts)
        {
            if(currentAccount.Contacts!=Null)
            {
                System.debug('Account Name :: '+currentAccount.Name+' Has No of Contact :: '+currentAccount.Contacts.Size());
            }
        }                                        
    }

    @future
    public static void countNoOfCaseThroughOrigin()
    {
        List<AggregateResult> countNumberOfCase = [ SELECT 
                                                        Count(Id),
                                                        Origin 
                                                    FROM 
                                                        Case 
                                                    GROUP BY 
                                                            Origin ];

        for(AggregateResult countOrigin:countNumberOfCase)
        {
            System.debug(countOrigin);
        }
    }
}