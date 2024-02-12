public with sharing class OpportunityTriggerHandlerNew 
{
    public static void insertOpportunityLineItems(List<Opportunity> listOfOpportunities) 
    {
        // Declare a list to hold the OpportunityLineItem records to be inserted
        List<OpportunityLineItem> lineItemsToBeInserted = new List<OpportunityLineItem>();
    
        // Query the default product and price book entry outside of the loop
        Product2 defaultProduct = [SELECT Id FROM Product2 WHERE Name = 'Service Charge' LIMIT 1];
        PricebookEntry pricebookEntry = [SELECT Id FROM PricebookEntry WHERE Name = 'Service Charge' LIMIT 1];
    
        // Check if the default product and price book entry are found
        if (defaultProduct != null && pricebookEntry != null) 
        {
            // Iterate through each Opportunity in the list
            for (Opportunity opp : listOfOpportunities) {
                // Create a new OpportunityLineItem object for each Opportunity
                OpportunityLineItem lineItem = new OpportunityLineItem();
                lineItem.OpportunityId = opp.Id;
                lineItem.Product2Id = defaultProduct.Id;
                lineItem.Quantity = 1;
                lineItem.UnitPrice = 1000; // Assuming a fixed unit price of 1000
                lineItem.PricebookEntryId = pricebookEntry.Id;
    
                // Add the OpportunityLineItem to the list
                lineItemsToBeInserted.add(lineItem);
            }
    
            // Insert all OpportunityLineItem records in one DML operation
            if (!lineItemsToBeInserted.isEmpty()) 
            {
                insert lineItemsToBeInserted;
            }
        } else 
        {
            // Handle the case where the default product or price book entry is not found
            System.debug('Default product or price book entry not found. Unable to insert OpportunityLineItems.');
        }
    }   
}