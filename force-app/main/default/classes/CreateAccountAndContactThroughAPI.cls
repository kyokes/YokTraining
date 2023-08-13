public with sharing class CreateAccountAndContactThroughAPI implements Queueable, Database.AllowsCallouts
{
    public void execute(QueueableContext context)
    {
        String clientId = '3MVG9wt4IL4O5wvIr5E5jsIv_wwiiK15z2u0o0fGsUj6KpWZjo_7ApOTSVsvwc6i9PhiM8bKzeKbL4M5hQa1C';
        String clientSecret = '0C914841D11E2ED7C7E2A669F6FDF7AA3F0144D13AB455700608CCFEA7274D5D';
        String userName = 'yokesh.k@4iapps.com';
        String password = 'Appa@1964u6CSsfMQGpT2q6Mj99dtZC1QF';

        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        String endPoint = 'https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=' + clientId + '&client_secret=' + clientSecret + '&username=' + userName + '&password=' + password;

        request.setEndpoint(endpoint);
        request.setMethod('POST');
        response = httpConnection.send(request);

        if (response.getStatusCode() == 200)
        {
            WrapperToGetAccessToken resultParsed = (WrapperToGetAccessToken) JSON.deserialize(response.getBody(), WrapperToGetAccessToken.class);
            String accessToken = resultParsed.access_token;
            String instanceUrl = resultParsed.instance_url;

            String accessTokenEncoded=EncodingUtil.urlEncode(resultParsed.access_token, 'UTF-8');
            System.debug(accessTokenEncoded);

            String bearer = 'Bearer ' + accessToken;
            System.debug(bearer);
  
            httpConnection = new Http();
            request = new HttpRequest();
            response = new HttpResponse();

            request.setMethod('POST');
            request.setEndpoint(instanceUrl + '/services/data/v58.0/sobjects/Account/');
            request.setHeader('Authorization', bearer);
            request.setHeader('Accept', 'application/json');
            request.setHeader('Content-Type', 'application/json');

            WrapperToCreateAccount createAccount = new WrapperToCreateAccount();
            createAccount.Name = 'Testing Account Api Call 1234567';
            String jsonBody = JSON.serialize(createAccount);

            request.setBody(jsonBody);

            response = httpConnection.send(request);

            System.debug(response.getStatusCode());
            if (response.getStatusCode() == 201)
            {
                WrapperToGetAccountId getAccountId = (WrapperToGetAccountId)JSON.deserialize(response.getBody(), CreateAccountAndContactThroughAPI.WrapperToGetAccountId.class);
                System.debug(getAccountId.id);

                httpConnection = new Http();
                request = new HttpRequest();
                response = new HttpResponse();

                request.setMethod('POST');
                request.setEndpoint(instanceUrl + '/services/data/v58.0/sobjects/Contact/');
                request.setHeader('Authorization', bearer);
                request.setHeader('Accept', 'application/json');
                request.setHeader('Content-Type', 'application/json');

                WrapperToCreateContactRelatedToAccount createContact = new WrapperToCreateContactRelatedToAccount();
                createContact.LastName='Test Contact Api Call 1234567';
                createContact.Email='test@test.com';
                createContact.AccountId=getAccountId.id; 

                String jsonBodyContact= JSON.serialize(createContact);

                System.debug(jsonBodyContact);
                request.setBody(jsonBodyContact);

                response = httpConnection.send(request);

                System.debug(response.getStatusCode());
                if(response.getStatusCode() == 201)
                {
                    System.debug(response.getBody());
                }
            }
        }
    }
    public class WrapperToGetAccessToken
    {
        public String access_token{get;set;}
        public String instance_url{get;set;}
        public String id{get;set;}
        public String token_type{get;set;}
        public String issued_at{get;set;}
        public String signature{get;set;}
    }

    public class WrapperToCreateAccount 
    {
        public String Name{get;set;}
    }
    public class WrapperToCreateContactRelatedToAccount
    {
        public String LastName{get;set;}
        public String AccountId{get;set;}
        public String Email{get;set;}
    }

    public class WrapperToGetAccountId
    {
        //public class Errors {
        //}
    
        public String id{get;set;}
        public Boolean success{get;set;}
        //public List<Errors> errors{get;set;}
     
    }
}