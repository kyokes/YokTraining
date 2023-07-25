/*
    Class Name : OpportunityHelper
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 19th July 2023
    Summary : This is an Apex class named OpportunityHelper that extends the UtilityHelper class.
    Description : It contains a method to create a new Account record and checks if the logged-in user has create access to Account.
 */
public with sharing class OpportunityHelper extends UtilityHelper
{
    // This method creates a new Account record and inserts it into the database.
    // It first creates an instance of the Account SObject and sets its Name field with a string concatenated with a random number.
    // The random number is generated using the generateRandomString() method from the parent UtilityHelper class.
    // Then, it calls the validateLoggedInUserHasCreateAccessToObject() method to check if the logged-in user has create access to Account.
    // If the check returns true, it inserts the new Account record into the database.
    public static void createNewAccount()
    {
        // Create a new Account record.
        Account newAccountRecord = new Account();
        
        // Set the Name field of the Account with a string concatenated with a random number.
        newAccountRecord.Name = 'Test' + generateRandomString();

        // Check if the logged-in user has create access to the Account object.
        Boolean checking = validateLoggedInUserHasCreateAccessToObject('Account');

        // If the user has create access, insert the new Account record into the database.
        if (checking == true)
        {
            insert newAccountRecord; 
        }
    }
}
