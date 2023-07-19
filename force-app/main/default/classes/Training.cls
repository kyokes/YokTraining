 /*
    Class Name : Training
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 17th July 2023
 */
 public with sharing class Training extends UtilityHelper
{
    /*
    Class Name : Training
    Method Name : printNumber
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 17th July 2023
    Summary : Print Prime Number
    Description :  Method to print numbers from 1 to 200 excluding those divisible by 9.
    */ 
    public static void printNumber() 
    {
        for(Integer i=1; i<=200; i++)
        {
            // Check if the current number is not divisible by 9.
            if(Math.mod(i, 9) != 0)   
            {
                // Output the number using system.debug.
                system.debug(i);
            }
        }
    } 

    /*
    Class Name : Training
    Method Name : sumOfTwoNumber
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 17th July 2023
    Summary : It will Sum of Two Numbers
    Description :  Method to calculate the sum of two numbers and return the result.
    */ 
    public static Integer sumOfTwoNumber(Integer num1, Integer num2)
    {
        Integer sum = num1 + num2;
        return sum;
    }

    /*
    Class Name : Training
    Method Name : pyramid
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 17th July 2023
    Summary : Print Number in Pyramid  
    Description :  Method to print a pyramid pattern using numbers.
    */
    public static void pyramid()
    {
        // Define the number of rows in the pyramid.
        Integer rows = 5;
        // Initialize a variable to track the current number.
        Integer no = 1;

        // Loop to construct each row of the pyramid.
        for(Integer i = 1; i <= rows; i++)
        {
            // Inner loop to print numbers in each row.
            for(Integer j = 2; j <= i; j++)
            {
                // Output the current number using system.debug.
                system.debug(no);
                no++;
            }
            // Print an empty line to create the pyramid pattern.
            system.debug('');
        }
    }

    /*
    Class Name : Training
    Method Name : reverseOrder
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 17th July 2023
    Summary : Print the received name in reverse order  
    Description :  Method to reverse the characters of a given string and print the result.
    */
    public static void reverseOrder(String name) 
    {
        // Reverse the given string using the reverse() method.
        String reverseName = name.reverse();
        // Output the reversed string using system.debug.
        system.debug(reverseName);
    }

    /*
    Class Name : Training
    Method Name : createLeadRecord
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 18th July 2023
    Summary : Create New Lead  
    Description :  Method to create a new Lead record and insert it into the database.
    */
    public static Lead createLeadRecord(String lastName, String email, String company)
    {  
        // Create a new Lead object.
        Lead leadRecordToInsert = new Lead();
        // Set the attributes of the Lead object.
        leadRecordToInsert.LastName = lastName;
        leadRecordToInsert.Email = email;
        leadRecordToInsert.Company = company;
        // Insert the Lead record into the database.
        insert leadRecordToInsert;
        // Return the inserted Lead record.
        return leadRecordToInsert;
    }

    /*
    Class Name : Training
    Method Name : createLeadRecordTest
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 18th July 2023
    Summary : Create New Lead if the last name is not equal to 'Test' 
    Description :  Method to create a new Lead record and insert it into the database (with additional validation).
    */
    public static Lead createLeadRecordTest(String lastName, String email, String company)
    {
        // Create a new Lead object.
        Lead leadRecordToInsert = new Lead();
        // Set the attributes of the Lead object.
        leadRecordToInsert.LastName = lastName;
        leadRecordToInsert.Email = email;
        leadRecordToInsert.Company = company;

        // Check if the last name contains the word 'test' (case-insensitive).
        if (lastName.containsIgnoreCase('test') == true) 
        {
            // Output a debug message if the last name contains 'test' and return null.
            system.debug('Cannot insert lead with last name containing "test".');
            return null;
        }
        else 
        {
            // Insert the Lead record into the database if the last name is valid.
            insert leadRecordToInsert;
        }
        // Return the inserted Lead record or null based on validation.
        return leadRecordToInsert;
    }

    /*
    Class Name : Training
    Method Name : addDefaultBirthDate
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 18th July 2023
    Summary : If the birthdate is not there default value should be inserted.
    Description :  Method to add a default birth date to a Lead record and insert it into the database.
    */
    public static void addDefaultBirthDate(String lastName, Date birthDate, String company)
    {
        // Check if the birth date is null.
        if (birthDate == null)
        {
            // If birth date is null, set it to a default date (January 1, 1990).
            Date myDate = Date.newInstance(1990, 01, 01);   
            birthDate = myDate;
        }

        // Create a new Lead object.
        Lead newLeadToBeInserted = new Lead();
        // Set the attributes of the Lead object.
        newLeadToBeInserted.LastName = lastName;
        newLeadToBeInserted.Birthday__c = birthDate; 
        newLeadToBeInserted.Company = company;
        // Insert the Lead record into the database.
        insert newLeadToBeInserted;
    }

    /*
    Class Name : Training
    Method Name : insertContactWheneverAccountIsCreated
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 18th July 2023
    Summary : Whenever a account is created , create new contact assiociated with account
    Description :  Method to create an Account record and a related Contact record when an Account is created.
    */
    public static void insertContactWheneverAccountIsCreated(String lastName)
    {
        // Create a new Account record after receiving Name
        Account newAccountRecord = new Account();
        // Set the Name attribute of the Account.
        newAccountRecord.Name = lastName;
        // Insert the Account record into the salesforce.  
        insert newAccountRecord;

        // Create a new Contact record associated with the Account.
        Contact newContactRecordAssociatedWithAccount = new Contact();
        // Set the AccountId and LastName attributes of the Contact.
        newContactRecordAssociatedWithAccount.AccountId = newAccountRecord.Id;
        newContactRecordAssociatedWithAccount.LastName = lastName;
        // Insert the Contact record into the database.
        insert newContactRecordAssociatedWithAccount;
    }

    /*
    Class Name : Training
    Method Name : createLeadsInBulk
    Author Name  : Yokesh.K@4iapps.com
    Date Added : 18th July 2023
    Summary : Create lead in Bulk
    Description :  Method to create multiple Lead records in bulk and insert them into the database.
    */
    public static void createLeadsInBulk()
    {
        // Create a list to store multiple Lead records.
        List<Lead> listOfLeadThatCreatedInBulk = new List<Lead>();
        
        // Loop to create the specified number of Lead records.
        for (Integer i = 1; i <= 3; i++)
        {
            // Create a new Lead record.
            Lead newLeadRecord = new Lead();
            // Set the FirstName,LastName,Email and Company attributes of the Lead.
            newLeadRecord.FirstName='Test';
            newLeadRecord.LastName = 'Test' + generateRandomString();
            newLeadRecord.Company = '4iapps';
            newLeadRecord.Email='test.test'+generateRandomString()+'@4iapps.com';
            // Add the Lead record to the list.
            listOfLeadThatCreatedInBulk.add(newLeadRecord);
        }

        // Output the list of Lead records to the debug log.
        system.debug(listOfLeadThatCreatedInBulk);

        for(Lead l:listOfLeadThatCreatedInBulk)
        {
            system.debug(l);
        }

        // Insert all the Lead records in the list into the database.
        insert listOfLeadThatCreatedInBulk;
    }
}
