public with sharing class GetJokeAPI {
    
    @AuraEnabled(cacheable=true)
    public static List<WrapperClass> getJokeCall() {
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setMethod('GET');
        request.setEndpoint('https://official-joke-api.appspot.com/random_joke');
        request.setHeader('Accept', 'application/json');
        response = httpConnection.send(request);
        
        List<WrapperClass> resultParsed = new List<WrapperClass>();
        if(response.getStatusCode() == 200) {
            String body = response.getBody();
            WrapperClass joke = (WrapperClass) JSON.deserialize(body, WrapperClass.class);
            resultParsed.add(joke); // Add the deserialized joke to the list
        }
        return resultParsed;
    }

    public class WrapperClass {
        @AuraEnabled
        public String type { get; set; }
        @AuraEnabled
        public String setup { get; set; }
        @AuraEnabled
        public String punchline { get; set; }
        @AuraEnabled
        public Integer id { get; set; }
    }
}
