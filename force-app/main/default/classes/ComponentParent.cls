public with sharing class ComponentParent 
{
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        try {
            List<Account> getTenAccounts = [ SELECT Id, 
                                                    Name 
                                             FROM Account 
                                                  WITH_SECURITY_ENFORCED 
                                             LIMIT 10 ];
            return getTenAccounts;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable= true)
    public static Account getAccountDetails(Id accountId)
    {
            Account getDetailsOfAccount = [SELECT Id,
                                                  Name,
                                                  Phone
                                            FROM 
                                                Account
                                            WHERE 
                                                Id =:accountId];

            return getDetailsOfAccount;
    }

    // @AuraEnabled
    // public static Account updateAccountInformation(){
    //     try {
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
}