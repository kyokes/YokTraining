public with sharing class TemperatureConversion 
{
    @AuraEnabled(Cacheable=true)
    public static String convertFahrenheitToCelsius(String degreeValue)
    {
        TemperatureConvertor.TempConvertSoap farToCel = new TemperatureConvertor.TempConvertSoap();
        String result = farToCel.FahrenheitToCelsius(degreeValue);
        return result;
    }
    @AuraEnabled(Cacheable=true)
    public static String convertCelsiusToFahrenheit(String degreeValue)
    {
        TemperatureConvertor.TempConvertSoap celToFar = new TemperatureConvertor.TempConvertSoap();
        String result = celToFar.CelsiusToFahrenheit(degreeValue);
        return result;
    }
}