public with sharing class GenerateRandomOTP 
{
    public static Integer generateRandomNumber() 
    {
        return Integer.valueOf(Math.random() * 1000).intValue();
    }

    public static void sendEmailToManagerWithOTP(List<Opportunity> listOfOpportunity) 
    {
        Set<Id> opportunityIds = new Set<Id>();
        for(Opportunity currentOpportunity : listOfOpportunity) {
            if(currentOpportunity.StageName == 'Needs Analysis') {
                currentOpportunity.OTP__c = generateRandomNumber();
                opportunityIds.add(currentOpportunity.Id);
            }
        }
        Update listOfOpportunity;

        List<OpportunityContactRole> opportunityContactRoles = [SELECT Id, ContactId FROM OpportunityContactRole WHERE OpportunityId IN :opportunityIds];
        Set<Id> contactIds = new Set<Id>();
        for(OpportunityContactRole ocr : opportunityContactRoles) {
            contactIds.add(ocr.ContactId);
        }
        
        Map<Id, Contact> contactMap = new Map<Id, Contact>([SELECT Id, Email FROM Contact WHERE Id IN :contactIds]);

        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(OpportunityContactRole ocr : opportunityContactRoles) {
            if(contactMap.containsKey(ocr.ContactId)) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{contactMap.get(ocr.ContactId).Email});
                email.setPlainTextBody('Hi, please find the OTP: ' + currentOpportunity.OTP__c);
                emailList.add(email);
            }
        }
        
        if(!emailList.isEmpty()) {
            Messaging.sendEmail(emailList);
        }
    }
}
