/*
    Class Name : UtilityHelper
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 19th July 2023
    Description : This is a virtual Apex class named UtilityHelper that contains utility methods for generating a random 
    integer and validating if the logged-in user has create access to a specific SObject.
 */
public virtual with sharing class UtilityHelper 
{
    // This method generates a random integer between 0 and 999 (inclusive).
    // It utilizes the Math.random() method to generate a random decimal between 0 and 1,
    // then multiplies it by 1000 and converts the result to an Integer.
    // The generated random number is then logged using the System.debug() method and returned.
    public static Integer generateRandomString()
    {
        Integer num = Integer.valueOf(Math.random() * 1000);
        System.debug(num);
        return num;
    }
    
    // This method takes an SObject's API name as input and checks whether the logged-in user has create access to that object.
    // The method first obtains the Schema.SObjectType for the given objectName using Schema.getGlobalDescribe().
    // Then, it checks if the object is accessible and createable by the current user
    // using objectType.getDescribe().isAccessible() and objectType.getDescribe().isCreateable().
    // If the user has both access permissions, the method returns true; otherwise, it returns false.
    public static Boolean validateLoggedInUserHasCreateAccessToObject(String objectName) 
    {
        // Get the SObject in which you want to check if the user has create access.
        Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectName);

        // Check if the object is accessible and createable by the current user.
        Boolean hasAccess = objectType.getDescribe().isAccessible() && objectType.getDescribe().isCreateable();

        return hasAccess;
    }
}
