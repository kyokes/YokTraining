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
        /*Integer index = 0;
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
       Update updateRoundRobinMembersRegion;*/
       Set<String> countryNames = new Set<String>();
       Map<String, String> leadCountryMap = new Map<String, String>();
          
       for (Lead newLead : leadsThatNeedsToAssigned) 
       {
              countryNames.add(newLead.Country);
              leadCountryMap.put(newLead.Id, newLead.Country);
       }
          
       Map<String, String> countryToRegionMap = new Map<String, String>();
       for (Country_Region__mdt region : [SELECT Label, Region__c, Region__r.Label 
                                                 FROM Country_Region__mdt 
                                                 WHERE Label IN :countryNames]) 
       {
                  countryToRegionMap.put(region.Label, region.Region__r.Label);
       }
          
       Map<String, List<Round_Robin_Member_Region__c>> regionToMembersMap = new Map<String, List<Round_Robin_Member_Region__c>>();
          
       for (Round_Robin_Member_Region__c member : [SELECT Round_Robin_Config__r.Region__c, 
                                                                   Round_Robin_Member__r.User__c, 
                                                                   IsActive__c 
                                                            FROM Round_Robin_Member_Region__c 
                                                            WHERE Round_Robin_Config__r.Region__c IN :countryToRegionMap.values() 
                                                                  AND IsActive__c = TRUE 
                                                            ORDER BY Last_Assigned_Date_And_Time__c ASC]) 
       {
              if (!regionToMembersMap.containsKey(member.Round_Robin_Config__r.Region__c)) 
              {
                     regionToMembersMap.put(member.Round_Robin_Config__r.Region__c, new List<Round_Robin_Member_Region__c>());
              }
              regionToMembersMap.get(member.Round_Robin_Config__r.Region__c).add(member);
       }
          
       List<Round_Robin_Member_Region__c> updateRoundRobinMembersRegion = new List<Round_Robin_Member_Region__c>();
          
       for (Lead assignLeadOwner : leadsThatNeedsToAssigned) 
       {
              String regionName = countryToRegionMap.get(leadCountryMap.get(assignLeadOwner.Id));
              List<Round_Robin_Member_Region__c> membersForRegion = regionToMembersMap.get(regionName);
          
              if (membersForRegion != null && !membersForRegion.isEmpty()) 
              {
                     Round_Robin_Member_Region__c assigneeUpdate = membersForRegion.get(0);
                     assignLeadOwner.OwnerId = assigneeUpdate.Round_Robin_Member__r.User__c;
                     assigneeUpdate.Last_Assigned_Date_And_Time__c = System.now();
                     membersForRegion.remove(0);
                     updateRoundRobinMembersRegion.add(assigneeUpdate);
              }
       }
              update updateRoundRobinMembersRegion;
          
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

//     public static void automaticConversion(List<Lead> leadsAutomaticConversion)
//     {
//        List<Database.LeadConvert> listOfConvertedLeads = new List<Database.LeadConvert>();
//        Database.LeadConvert convertLead = new Database.LeadConvert();

//        for(Lead currentLead:leadsAutomaticConversion)
//        {
//               convertLead.setLeadId(currentLead.Id);
//               convertLead.setConvertedStatus('Closed - Converted');
//               Database.LeadConvertResult lcr = Database.convertLead(convertLead);
//               system.debug(lcr.getAccountId());
//               system.debug(lcr.getContactId());
//               system.debug(lcr.getOpportunityId());       
//        }
//     }

    public static void convertLeads(List<Lead> leadsToConvert) 
    {
       List<Database.LeadConvert> leadConvertList = new List<Database.LeadConvert>();
   
       for (Lead currentLead : leadsToConvert) 
       {
           Database.LeadConvert convertLead = new Database.LeadConvert();
           convertLead.setLeadId(currentLead.Id);
           convertLead.setConvertedStatus('Closed - Converted');
   
           leadConvertList.add(convertLead);
       }
   
       if (!leadConvertList.isEmpty()) 
       {
           List<Database.LeadConvertResult> convertResults = Database.convertLead(leadConvertList);
   
           for (Database.LeadConvertResult lcr : convertResults) 
           {
               System.debug('Converted Account ID: ' + lcr.getAccountId());
               System.debug('Converted Contact ID: ' + lcr.getContactId());
               System.debug('Converted Opportunity ID: ' + lcr.getOpportunityId());
           }
       }
   }
   
}