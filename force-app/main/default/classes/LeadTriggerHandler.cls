public with sharing class LeadTriggerHandler 
{
    public static void assignSalesRepBasedOnRegion(List<Lead> leadsThatNeedsToAssigned)
    {
        String countryName;
        String regionId;
        String regionName;
        String roundRobinConfigId;
        String roundRobinMemberId;
        String userId;
        Map<String, Integer> regionAssignmentCounter = new Map<String, Integer>();
        for(Lead newLead:leadsThatNeedsToAssigned)
        {
            countryName=newLead.Country; 
        }
        List<Country_Region__mdt> countryNames=[SELECT 
                                                        Label,Region__c 
                                                FROM Country_Region__mdt 
                                                WHERE Label=:countryName];

        for(Country_Region__mdt getRegionId:countryNames)
        {
            regionId=getRegionId.Region__c;
        }
        system.debug(countryNames);
        List<Region__mdt> regionNames =[SELECT 
                                                Label 
                                        FROM Region__mdt 
                                        WHERE Id =: regionId];
        for(Region__mdt getRegionName:regionNames)
        {
            regionName=getRegionName.Label;
        }
        System.debug(regionName);

        List<Round_Robin_Config__c> getRoundRobinCofigRecords = [SELECT 
                                                                        Id,Region__c, IsActive__c 
                                                                 FROM Round_Robin_Config__c 
                                                                 WHERE Region__c=:regionName AND IsActive__c=TRUE];
        for(Round_Robin_Config__c getRoundRobinConfigId:getRoundRobinCofigRecords)
        {
            roundRobinConfigId=getRoundRobinConfigId.Id;
        }
        system.debug(roundRobinConfigId);
        List<Round_Robin_Member_Region__c> getMembers=[SELECT 
                                                            Name, Round_Robin_Config__c, 
                                                            Round_Robin_Member__c, IsActive__c, Id 
                                                        FROM Round_Robin_Member_Region__c 
                                                        WHERE Round_Robin_Config__c=:roundRobinConfigId];
        for(Round_Robin_Member_Region__c assignUser:getMembers)
        {
            roundRobinMemberId=assignUser.Round_Robin_Member__c;
        }

        //Integer lastIndex = RoundRobinSettings__c.getInstance().LastAssingedIndex__c;
        List<Round_Robin_Member__c> getRoundRobinMembers=[SELECT 
                                                                User__c, CreatedDate, 
                                                                Name, Id 
                                                            FROM Round_Robin_Member__c
                                                            WHERE Id =:roundRobinMemberId];
        
        //Integer nextIndex = (lastIndex + 1)%getRoundRobinMembers.size();
        for(Round_Robin_Member__c getUserId :getRoundRobinMembers)  
        {
            userId=getUserId.User__c;
        }
        for(Lead assignLeadOwner:leadsThatNeedsToAssigned)
        {
            assignLeadOwner.OwnerId=userId;
        }                                    
        System.debug(getMembers);
    }
}