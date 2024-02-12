public with sharing class AccountTriggerHandlerNew 
{
    public static void populateShippingAddress(List<Account> accountsList)
    {
        for(Account currentAccount:accountsList)
        {
            if(currentAccount.ShippingStreet == Null || currentAccount.ShippingCity == Null ||
            currentAccount.ShippingState == Null || currentAccount.ShippingPostalCode == Null ||
            currentAccount.ShippingCountry == Null)
            {
                currentAccount.ShippingStreet = currentAccount.BillingStreet;
                currentAccount.ShippingCity = currentAccount.BillingCity;
                currentAccount.ShippingState = currentAccount.BillingState;
                currentAccount.ShippingPostalCode = currentAccount.BillingPostalCode;
                currentAccount.ShippingCountry = currentAccount.BillingCountry;
            }
        }
    }
}