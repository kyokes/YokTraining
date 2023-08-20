global with sharing class SfWebService 
{
    
    webservice static List<Account> getAccount(String accountName)
    {
        accountName = '%'+accountName+'%';
        List<Account> getAllAccounts = [ SELECT 
                                               Id,
                                               Name 
                                         FROM 
                                            Account 
                                        WHERE 
                                            Name LIKE :accountName
                                        LIMIT 100];

        return  getAllAccounts;
  }
}