public with sharing class RandomJokeApiCallOut implements Queueable, Database.AllowsCallouts
{
    public void execute(QueueableContext context)
    {
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setMethod('GET');
        request.setEndpoint('https://official-joke-api.appspot.com/random_joke');
        request.setHeader('Accept', 'application/json');
        response = httpConnection.send(request);

        if(response.getStatusCode()==200)
        {
            String body = response.getBody();
            WrapperClass resultParsed = (WrapperClass)JSON.deserialize(body, RandomJokeApiCallOut.WrapperClass.class);

            System.debug(resultParsed.setup);
            System.debug(resultParsed.punchline);
        }
    }

    public class WrapperClass
    {
        public String type;
        public String setup;
        public String punchline;
        public Integer id;
    }
}