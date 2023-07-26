/*
    class Name : CityState
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 26th July 2023
    Description : 
 */
public with sharing class CityState 
{
 public static String getCountry(string captialName)
 {
    Map<String,String> cityToState = new Map<String,String>();
    Map<String,String> stateToCountry = new Map<String,String>();
    List<State__c> getCityAndState = [SELECT Id , 
                                            State_Name__c,Captial__c 
                                            FROM State__c];
    List<Country__c> getStateAndCountry = [SELECT Id , 
                                                CountryName__c,State_Name__c 
                                                FROM Country__c];
                                                 
    for(State__c state:getCityAndState)
    {
        cityToState.put(state.Captial__c, state.State_Name__c);
    }
    for(Country__c country:getStateAndCountry)
    {
        stateToCountry.put(country.State_Name__c,country.CountryName__c);
    }
    string relatedState = cityToState.get(captialName);
    string relatedCountry = stateToCountry.get(relatedState);

    return relatedCountry;

 }   
}