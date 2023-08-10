public with sharing class validateAddressOnAccount implements Queueable, Database.AllowsCallouts
{
    Id accountId;
    public validateAddressOnAccount(Id accountId) 
    {
        this.accountId=accountId;
    }

    public void execute(QueueableContext context)
    {

        Account currentAccount = [SELECT 
                                        BillingStreet,BillingCity,BillingPostalCode,
                                        BillingState,BillingCountry,ByPassAddressValidation__c
                                    FROM Account
                                    WHERE Id=:accountId];

        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyC4SOeANsk58rU8e5iVcp4CGx5RvolFLlY&input='+currentAccount.BillingStreet+'&inputtype=textquery&fields=formatted_address');
        request.setHeader('Accept','application/JSON');
        request.setHeader('Content-Length','0');
        request.setMethod('POST');
        //request.setBody();
        response = httpConnection.send(request);
            if (response.getStatusCode()==200)
            {
                String body = response.getBody();
                GoogleMapsWrapperData resultsParsed = (GoogleMapsWrapperData) Json.deserialize(body,ValidateAddressOnAccount.GoogleMapsWrapperData.class);
                currentAccount.BillingStreet = resultsParsed.candidates.get(0).formatted_address;
            }
            currentAccount.ByPassAddressValidation__c=true;
            Update currentAccount;
    }
    public class GoogleMapsWrapperData
    {
        public List<FormattedAddress> candidates{get;set;}
        public String status{get;set;}
    }
    public class FormattedAddress
    {
        public string formatted_address{get;set;}
    }
}