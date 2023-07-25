/*
    Interface Name : LogManager
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 19th July 2023
    Summary :  This is an Apex interface named LogManager.
    Description : It defines a contract for classes that want to implement log creation functionality.
 */
public interface LogManager 
{
    // This is a method signature for creating logs.
    // Classes that implement this interface must provide their own implementation of this method.
    // The method signature indicates that the method does not have a return type (void) and does not take any parameters.
    void createLog();
}