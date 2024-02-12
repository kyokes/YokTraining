public with sharing class OpenWeatherApiCallout 
{
    final static string API_KEY = '5cd6a0c54c5777dca412a2b766e663ef';

    public static void makeCallout(String cityName)
    {
        String BaseEndPoint= 'http://api.openweathermap.org/geo/1.0/direct?';

        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();

        String endPoint = BaseEndPoint+'q='+cityName+'&appid='+API_KEY;
        System.debug(endPoint);

        request.setEndpoint(endPoint);
        request.setMethod('GET');

        response = httpConnection.send(request);

        System.debug(response.getBody());
        System.debug(response.getStatusCode());
    }
}