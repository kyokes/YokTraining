public with sharing class LeadTriggerHandlerNew 
{
    // public static void createDuplicateLead(List<Lead> listOfLeads)
    // {
    //     List<Lead> duplicateLeadCreation = new List<Lead>();
    //     for(Lead currentLead : listOfLeads)
    //     {
    //         Lead insertDuplicateLead = new Lead();
    //         insertDuplicateLead.LastName = currentLead.LastName;
    //         insertDuplicateLead.Company = currentLead.Company;
    //         duplicateLeadCreation.add(insertDuplicateLead);
    //     }
    //     Insert duplicateLeadCreation;
    // }
    public static void createDuplicateLead(List<Lead> listOfLeads) {
        List<Lead> duplicateLeadCreation = new List<Lead>();
            for(Lead currentLead : listOfLeads) {
                // Check if required fields are populated
                if (currentLead.LastName != null && currentLead.Company != null) {
                    Lead insertDuplicateLead = new Lead();
                    insertDuplicateLead.LastName = currentLead.LastName;
                    insertDuplicateLead.Company = currentLead.Company;
                    duplicateLeadCreation.add(insertDuplicateLead);
                } else {
                    // Log an error or handle the case where required fields are missing
                    System.debug('Skipping lead creation. Missing required fields.');
                }
            }
            try{
                if (!duplicateLeadCreation.isEmpty()) 
                {
                    Insert duplicateLeadCreation;
                    System.debug('Duplicate leads created successfully.');
                } else {
                    System.debug('No duplicate leads to create.');
                }
            }
        catch(Exception e) {
            // Log the exception or handle it appropriately
            System.debug('Error occurred: ' + e.getMessage());
        }
    }
    
}