public with sharing class NumberToWordsController 
{
    @AuraEnabled(cacheable=true)
    public static String convertNumberIntoWords(Integer enteredNumber)
    {
        Long numberEntered = (Long)enteredNumber;
        NumberToWordsClass.NumberConversionSoap numToWords = new NumberToWordsClass.NumberConversionSoap();

        String numberWords = numToWords.NumberToWords(numberEntered);

        return numberWords;
    }
}