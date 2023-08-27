public with sharing class NumberToWordsOpportunityQueueable implements Queueable, Database.AllowsCallouts
{
    Id oppId;
    
    public NumberToWordsOpportunityQueueable(Id oppId) 
    {
        this.oppId=oppId;
    }

    public void execute(QueueableContext context)
    {
        Opportunity currentOpportunity = [SELECT Id, Amount, Name,Amount_In_Words__c,LastModifiedById FROM Opportunity WHERE Id =: oppId];

        Long totalAmount = (Long)currentOpportunity.Amount;
        System.debug(totalAmount);

        NumberToWordsClass.NumberConversionSoap numToWords = new NumberToWordsClass.NumberConversionSoap();
        String numberWords = numToWords.NumberToWords(totalAmount);
        System.debug(numberWords);

        currentOpportunity.Amount_In_Words__c = numberWords;

        Update currentOpportunity;

        String amount = (String.valueOf(currentOpportunity.Amount));

        Integration_Log_For_Opportunity__c insertLog = new Integration_Log_For_Opportunity__c();
        insertLog.RelatedOpportunity__c = currentOpportunity.Id;
        insertLog.InvokedBy__c = currentOpportunity.LastModifiedById;
        insertLog.Request_Body__c = amount;

        insertLog.Response_Body__c = numberWords;
        insertLog.IsSuccessful__c = true;

        Insert insertLog;

    }
}