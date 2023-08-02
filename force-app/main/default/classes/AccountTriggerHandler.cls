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
}