public with sharing class CheckISBNValidOrNot 
{
    @AuraEnabled(cacheable=true)
    public static Boolean checkValidOrNot(String ISBNNumber)
    {
        ISBNValidOrNot.ISBNServiceSoap validOrNot = new ISBNValidOrNot.ISBNServiceSoap();
        Boolean result = validOrNot.IsValidISBN10(ISBNNumber);

        return result;
    }
}