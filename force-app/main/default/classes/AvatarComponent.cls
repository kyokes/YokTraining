public with sharing class AvatarComponent 
{
    @AuraEnabled(cacheable = true)
    public static List<Product2> getListOfProducts()
    {
        List<Product2> getProducts = [ SELECT Id, 
                                              Name
                                       FROM 
                                            Product2
                                       LIMIT 5
                                     ];
        return getProducts;
    }

    @AuraEnabled(cacheable = true)
    public static PricebookEntry getPriceOfTheSelectedProduct(Id productId)
    {
        PricebookEntry getPrice = [SELECT Id, 
                                          Pricebook2Id, 
                                          UnitPrice 
                                    FROM 
                                          PricebookEntry 
                                    WHERE 
                                          Product2Id =: productId
                                    AND   Pricebook2.Name ='Standard'];
        return getPrice;
    }
}