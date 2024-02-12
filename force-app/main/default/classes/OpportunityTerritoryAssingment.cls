public with sharing class OpportunityTerritoryAssingment 
{
    public static void assignTerritory(List<Opportunity> listOfOpportunities)
    {
        Set<String> cityNames = new Set<String>();

        for(Opportunity currentOpportunity : listOfOpportunities)
        {
            cityNames.add(currentOpportunity.Account.BillingCity);
        }

        Map<String,String> cityToTerritory = new Map<String,String>{
            'Abu Dhabi' => 'Al Bahia City',
            'Al Ain' => 'Al Bahia City',
            'Baniyas' => 'Khalifa City',
            'Liwa' => 'Khalifa City',
            'Madinat Zayed' => 'Khalifa City'};
                
        Map<String, Id> territoryNameToId = new Map<String, Id>();

        for (Territory2 territory : [SELECT Id, Name FROM Territory2 WHERE Name IN :cityToTerritory.values()]) 
        {
            territoryNameToId.put(territory.Name, territory.Id);
        }
        
        for(Opportunity currentOpportunity : listOfOpportunities)
        {
            String cityName = currentOpportunity.Account.BillingCity;
            
            if(cityToTerritory.containsKey(cityName))
            {
                currentOpportunity.Territory2Id = territoryNameToId.get(cityToTerritory.get(cityName));
                System.debug(territoryNameToId.get(cityToTerritory.get(cityName)));
            }
        }
        Update listOfOpportunities;
    }
}