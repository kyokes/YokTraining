/*
    Class Name : TrackChangesOnLead
    Author Name  : Yokesh.k@4iapps.com
    Date Added : 09th August 2023
    Description : Implements Queueable Apex
 */
public with sharing class TrackChangesOnLead implements Queueable 
{  
    //Declaring class Level Variable Id
    Id leadId;

    //From Constructor storing the leadId in class variable , this constructor is invoked by Trigger-Before Update
    public TrackChangesOnLead(Id leadId) 
    {
        this.leadId=leadId;
    }

    // This method is used to get the all lead history on a particular field LeadName, so whenever a change is occured this method going capture who intiated the change ,
    // at what time , what is the new value , what is the old value 
    public void execute(QueueableContext context)
    {
        //Created a List because 'n' no of change can occur on a single lead record , so we are quering and storing in a collection
        List<LeadHistory> updatedLead = [ SELECT 
                                                CreatedById, 
                                                CreatedDate,  
                                                LeadId,
                                                NewValue, 
                                                OldValue,
                                                CreatedBy.Name 
                                          FROM 
                                                LeadHistory
                                          WHERE   
                                                LeadId=:leadId ];
        for(LeadHistory currentLead:updatedLead)
        {
            System.debug('Old Value Of The Lead Record Is '+currentLead.OldValue);  
            System.debug('New Value Of The Lead Record Is '+currentLead.NewValue);
            System.debug('Date And Time Of The Lead Record When Change Introduced '+currentLead.CreatedDate);
            System.debug('User Who Intiated The Change '+currentLead.CreatedBy.Name);
        }
                                                    
    }
}