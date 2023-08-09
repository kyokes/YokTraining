public with sharing class ProcessIntegrationData implements Queueable, Database.AllowsCallouts
{
    Id logId;
    public ProcessIntegrationData(Id logId) 
    {
        this.logId=logId;
    }

    public void execute(QueueableContext context)
    {
        System.debug(logId);
        Integration_Log__c logRecord = [SELECT 
                                            Id,
                                            Request_Body__c,
                                            Response_Body__c,
                                            Related_Lead__c,
                                            IsSuccessful__c 
                                        FROM 
                                            Integration_Log__c 
                                        WHERE 
                                            Id =:logId];


            Http httpConnection = new Http();
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            request.setMethod('POST');
            request.setEndpoint('https://enuhi9r1irnq.x.pipedream.net');
            request.setBody(logRecord.Request_Body__c);
            response = httpConnection.send(request);

            if(response.getStatusCode()==200)
            {
                logRecord.Response_Body__c=response.getBody();
                logRecord.IsSuccessful__c=True;
            }
            Update logRecord;
    }
}