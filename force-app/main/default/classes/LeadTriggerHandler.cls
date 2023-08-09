/*
    Class Name : LeadTriggerHandler
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 06th August 2023
    Description : This Class Contains all the trigger functionalities, all methods here are invoked by the LeadTrigger
 */
public with sharing class LeadTriggerHandler 
{
    /*
    Class Name : LeadTriggerHandler
    Method Name : assignSalesRepBasedOnRegion
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 06th August 2023
    Description : This method used to assign sales rep by region in round robin assignment , from a lead record Country
    */   
    public static void assignSalesRepBasedOnRegion(List<Lead> leadsThatNeedsToAssigned)
    {
        Integer index = 0;
        String countryName;
        String regionId;
        String regionName;

        List<Round_Robin_Member_Region__c> updateRoundRobinMembersRegion = new List<Round_Robin_Member_Region__c>();

        for(Lead newLead:leadsThatNeedsToAssigned)
        {
            countryName=newLead.Country; 
        }

        List<Country_Region__mdt> getRegionNames= [ SELECT Label,
                                                           Region__c,
                                                           Region__r.Label 
                                                    FROM 
                                                           Country_Region__mdt 
                                                    WHERE  
                                                           Label =:countryName];

        for(Country_Region__mdt getRegionName:getRegionNames)
        {
            regionName=getRegionName.Region__r.Label;
            System.debug(regionName);
        }
        
        List<Round_Robin_Member_Region__c> getMembers= [ SELECT 
                                                                Round_Robin_Config__r.Region__c, 
                                                                Round_Robin_Member__r.User__c, 
                                                                IsActive__c 
                                                         FROM 
                                                                Round_Robin_Member_Region__c 
                                                         WHERE 
                                                                Round_Robin_Config__r.Region__c =:regionName 
                                                         AND 
                                                                IsActive__c =TRUE 
                                                         Order By 
                                                                Last_Assigned_Date_And_Time__c ASC ];

        System.debug(getMembers);   
        
        for(Lead assignLeadOwner:leadsThatNeedsToAssigned)
        {
            if(getMembers.size()>0)
            {
                Round_Robin_Member_Region__c assigneeUpdate = getMembers.get(Math.mod(index,getMembers.size()));
                System.debug(assigneeUpdate);
                assignLeadOwner.OwnerId=assigneeUpdate.Round_Robin_Member__r.User__c;
                assigneeUpdate.Last_Assigned_Date_And_Time__c=System.now();
                index++;
                updateRoundRobinMembersRegion.add(assigneeUpdate);
            }
        }                                   
       Update updateRoundRobinMembersRegion;
    }

    /*
    Class Name : LeadTriggerHandler
    Method Name : insertIntegrationLog
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 09th August 2023
    Description : This method used to create a Integration Log Record when ever a Lead Is Inserted
    */ 
    public static void insertIntegrationLog(List<Lead> currentLeads)
    {
       List<Integration_Log__c> integrationLogToBeInserted = new List<Integration_Log__c>();
       for(Lead oneLead:currentLeads)
       {
              Integration_Log__c newLog = new Integration_Log__c();
              newLog.Request_Body__c=oneLead.LastName;
              newLog.Related_Lead__c=oneLead.Id;
              integrationLogToBeInserted.add(newLog);
       }
       Insert integrationLogToBeInserted;
    }
    /*
    Class Name : LeadTriggerHandler
    Method Name : trackFieldHistoryOnLeadName
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 09th August 2023
    Description : This method used to track a Field tracking and it is going call Queueable method 
    */
    public static void trackFieldHistoryOnLeadName(List<Lead> leadsThatAreUpdating)
    {
       for(Lead currentLead : leadsThatAreUpdating)
       {
              System.enqueueJob(new TrackChangesOnLead(currentLead.Id));
       }
    }
}