/*
    Class Name : DmlLogManager
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 19th July 2023
    Description : This is an Apex class named DmlLogManager that implements the LogManager interface.
 */
public with sharing class DmlLogManager implements LogManager
{
    /*
    Class Name : DmlLogManager
    Method Name : createLog
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 19th July 2023
    Description :  This is the createLog() method, which will be executed to demonstrate the DML operations.
    */
    public static void createLog()
    {
        // Create a new Contact record.
        Contact newContactRecord = new Contact();

        // Set the last name of the Contact
        newContactRecord.LastName = 'Test Yok';

        // Perform the insert operation on the Contact record and get the result of the operation.
        Database.SaveResult result = Database.insert(newContactRecord);

        // Display the result of the insert operation in the debug logs.
        System.debug(result);

        // Create a new custom object record of type DML_Log__c to log the outcome of the insert operation.
        DML_Log__c newDmlLogRecord = new DML_Log__c();

        // Check if the insert operation was successful by using the isSuccess() method of the SaveResult object.
        if (result.isSuccess())
        {
            // If the insert was successful, set the SaveResult__c field of the DML_Log__c record accordingly.
            // Include the Id of the newly created Contact in the log message.
            newDmlLogRecord.SaveResult__c = 'Record Created Successfully, Id is ' + result.getId();
        }
        else 
        {
            // If the insert operation failed, set the SaveResult__c field of the DML_Log__c record accordingly.
            // Include the error message received from the result.getErrors() method.
            newDmlLogRecord.SaveResult__c = 'Record is not created, error is ' + result.getErrors();
        }

        // Insert the DML_Log__c record to log the outcome of the insert operation.
        insert newDmlLogRecord;
    }
}
