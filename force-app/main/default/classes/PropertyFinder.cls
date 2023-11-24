public with sharing class PropertyFinder 
{
    @AuraEnabled
    public static List<City_Props__Property__c> getProperty()
    {
        List<City_Props__Property__c> propertyToFind = [ SELECT City_Props__Property_Type__c,Name FROM City_Props__Property__c ];
        return propertyToFind;
    }

    @AuraEnabled
    public static List<City_Props__Property__c> findProperty(Id propertyId)
    {
        List<City_Props__Property__c> findProperty = [ SELECT 
                                                            City_Props__Property_Type__c, 
                                                            Name, 
                                                            ( SELECT 
                                                                    Name, 
                                                                    City_Props__Unit_Short_Code__c, 
                                                                    City_Props__Active__c,
                                                                    City_Props__Unit_Type__c,
                                                                    City_Props__Status__c,
                                                                    City_Props__Saleable__c, 
                                                                    City_Props__Leaseable__c, 
                                                                    City_Props__Accessibility__c  
                                                              FROM 
                                                                    City_Props__Properties__r
                                                              WHERE City_Props__Status__c = 'Available'),
                                                            ( SELECT Id, 
                                                                     City_Props__Status__c, 
                                                                     City_Props__Building_Type__c, 
                                                                     City_Props__Building_short_code__c 
                                                              FROM City_Props__Sub_Projects__r )
                                                        FROM 
                                                             City_Props__Property__c
                                                        WHERE 
                                                             Id =:propertyId ];
                                                     
        return findProperty;
    }
}