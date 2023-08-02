public with sharing class OpportunityTriggerHandler 
{
    // This method updates the Opportunity Name field based on specific logic.
    public static void updateOpportunityName(List<Opportunity> opportunities) 
    {
        // Define a map to convert integer month values to month names.
        Map<Integer,String> getMonthName = new Map<Integer,String> {
            1=>'Jan', 2=>'Feb', 3=>'Mar', 4=>'Apr', 5=>'May', 6=>'Jun',
            7=>'Jul', 8=>'Aug', 9=>'Sep', 10=>'Oct', 11=>'Nov', 12=>'Dec'
        };
        
        // Create a set to store unique Account IDs associated with the Opportunities.
        Set<Id> accountIds = new Set<Id>();
        
        // Collect unique Account IDs from the Opportunities.
        for(Opportunity insertOpportunity : opportunities)
        {
            accountIds.add(insertOpportunity.AccountId);
        }
        
        // Query for Account records based on the collected IDs.
        Map<Id,Account> getAccountName = new Map<Id,Account>([
            SELECT Id, Name 
            FROM Account 
            WHERE Id IN :accountIds
        ]);
        
        // Iterate through the provided Opportunities to update their names.
        for (Opportunity assignOpportunityName : opportunities) 
        {
            // Retrieve the associated Account's name.
            String accountName = getAccountName.get(assignOpportunityName.AccountId).Name;
            
            // Extract the month from the CloseDate and get its corresponding name.
            Integer closeDateMonth = assignOpportunityName.CloseDate.month();
            String monthName = getMonthName.get(closeDateMonth);
            
            // Get the Opportunity's current stage name.
            String stageName = assignOpportunityName.StageName;
            
            // Construct the new Opportunity name using the gathered information.
            assignOpportunityName.Name = accountName + '-' + monthName + '-' + stageName;
        }
    }
    public static void addServiceCharges(List<Opportunity> opportunities) 
    {  
        // Create a list to hold OpportunityLineItem records to be inserted
        List<OpportunityLineItem> lineItemsToBeInserted = new List<OpportunityLineItem>();
    
        // Specify the product and price book entry IDs
        Id ProductId = '01t5i000008uijgAAA';
        Id priceBookEntryId = '01u5i000004Cgm3AAC';
    
        // Loop through each Opportunity in the provided list
        for (Opportunity insertOpportunityProduct : opportunities) 
        {
            // Create a new OpportunityLineItem record
            OpportunityLineItem newLineItemRecord = new OpportunityLineItem();
            newLineItemRecord.OpportunityId = insertOpportunityProduct.Id;
            newLineItemRecord.Product2Id = ProductId;
            newLineItemRecord.PricebookEntryId = priceBookEntryId;
            newLineItemRecord.Quantity = 1;
            newLineItemRecord.UnitPrice = 10;
            lineItemsToBeInserted.add(newLineItemRecord);
        }
    
        // Insert the OpportunityLineItem records
        Insert lineItemsToBeInserted;
    }
    
    public static void getAllOpportunitiesAmount(List<Opportunity> opportunityRecord) 
    {
        // Create a list to hold Account records to be updated
        List<Account> updateAccountRecord = new List<Account>();
    
        // Initialize variables
        Integer totalAmount;
        Set<Id> accountIds = new Set<Id>();
    
        // Loop through each Opportunity in the provided list
        for (Opportunity currentOpportunity : opportunityRecord) 
        {
            // Add the Account IDs associated with the Opportunities to the set
            accountIds.add(currentOpportunity.AccountId);
        }
    
        // Query for the total amount of Closed Won Opportunities for each Account
        List<AggregateResult> getOpportunityTotalAmount = [SELECT SUM(Amount) TotalAmount
                                                           FROM Opportunity
                                                           WHERE StageName = 'Closed Won'
                                                           AND AccountId IN :accountIds];
    
        // Loop through the aggregate results and calculate total amount
        for (AggregateResult ar : getOpportunityTotalAmount) 
        {
            totalAmount = Integer.valueOf(ar.get('TotalAmount'));
            system.debug(ar.get('TotalAmount'));
        }
    
        // Update each Account's OpportunityWonTotal__c field with the total amount
        for (Opportunity currentOpportunity : opportunityRecord) 
        {
            Account insertTotalAmountInAccount = new Account();
            insertTotalAmountInAccount.Id = currentOpportunity.AccountId;
            insertTotalAmountInAccount.OpportunityWonTotal__c = totalAmount;
            updateAccountRecord.add(insertTotalAmountInAccount);
        }
    
        // Update the Account records
        Update updateAccountRecord;
    }
    
}
