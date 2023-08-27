public class HttpMockCalloutGenerator implements HttpCalloutMock 
{
    private String mockResponse;
    
    public void setMockResponse(String response) 
    {
        mockResponse = response;
    }
    
    public HTTPResponse respond(HTTPRequest req) 
    {
        HttpResponse responseReceived = new HttpResponse();
        responseReceived.setHeader('Content-Type', 'application/json');
        responseReceived.setBody(mockResponse);
        responseReceived.setStatusCode(200);
        return responseReceived;
    }
}