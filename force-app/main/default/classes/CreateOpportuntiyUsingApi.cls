lpublic with sharing class CreateOpportuntiyUsingApi 
{
    private static final String CLIENT_ID = '3MVG9wt4IL4O5wvIr5E5jsIv_wwiiK15z2u0o0fGsUj6KpWZjo_7ApOTSVsvwc6i9PhiM8bKzeKbL4M5hQa1C';
    private static final String CLIENT_SECRET = '0C914841D11E2ED7C7E2A669F6FDF7AA3F0144D13AB455700608CCFEA7274D5D';
    private static final String USER_NAME = 'yokesh.k@4iapps.com';
    private static final String PASSWORD = 'Appa@1964u6CSsfMQGpT2q6Mj99dtZC1QF';
    private static final String BASE_END_POINT = 'https://login.salesforce.com/services/oauth2/token';

    public static WrapperToGetAccessToken getAccessToken()
    {
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();

        string endPoint = '?grant_type=password&client_id=' + CLIENT_ID + '&client_secret=' + CLIENT_SECRET + '&username=' + USER_NAME + '&password=' + PASSWORD;

        request.setEndpoint(BASE_END_POINT+endPoint);
        request.setMethod('POST');

        try 
        {
            response=httpConnection.send(request);
        } 
        catch (Exception exceptions) 
        {
            System.debug(exceptions.getMessage());
        }    
        
        WrapperToGetAccessToken getToken = new WrapperToGetAccessToken();

        if(response.getStatusCode()==200)
        {
            getToken = (WrapperToGetAccessToken)JSON.deserialize(response.getBody(), CreateOpportuntiyUsingApi.WrapperToGetAccessToken.class);
        }

        return getToken;
    }

    public static String createOpportunity()
    {
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        
        string baseEndPoint = getAccessToken().instance_url;
        string endPoint = baseEndPoint+'/services/data/v58.0/sobjects/Opportunity/';

        string bearer = 'Bearer '+getAccessToken().access_token;

        request.setMethod('POST');
        request.setEndpoint(endPoint);
        request.setHeader('Authorization', bearer);
        request.setHeader('Accept', 'application/json');
        request.setHeader('Content-Type', 'application/json');

        OpportunityRecordCreation createNewOpportunity = new OpportunityRecordCreation();
        createNewOpportunity.Name = 'Test Opportunity Api call';
        createNewOpportunity.CloseDate = Date.today();
        createNewOpportunity.StageName = 'Prospecting';

        String jsonBody = JSON.serialize(createNewOpportunity);

        request.setBody(jsonBody);

        try 
        {
            response=httpConnection.send(request); 
        } 
        catch (Exception exceptions) 
        {
            System.debug(exceptions.getMessage());   
        }

        GetOpportunityId oppId = new GetOpportunityId();
        if(response.getStatusCode()==201 || response.getStatusCode()==200)
        {
            oppId = (GetOpportunityId)JSON.deserialize(response.getBody(), CreateOpportuntiyUsingApi.GetOpportunityId.class);
            System.debug(oppId.id);
        }
        return oppId.id;

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
    
    public class OpportunityRecordCreation
    {
        public String Name{get;set;}
        public String StageName{get;set;}
        public Date CloseDate{get;set;}
    }

    public class GetOpportunityId
    {
        public String id{get;set;}
        public Boolean success{get;set;}
        //public List<errors> errors{get;set;}
    }
}