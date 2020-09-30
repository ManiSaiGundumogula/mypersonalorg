/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    Trigger for the OpportunityLineItem object
Test Class:     TestOpportunityLineItem

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
FEB/19/2018     Mani Sai Gundumogula        	 Initail Creation

------------------------------------------------------------*/
trigger OpportunityTrigger on Opportunity (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    
  
    
    
    if (Trigger.isBefore ) {
        if (Trigger.isInsert) {}  
        if (Trigger.isUpdate) {}
        if (Trigger.isDelete) {
             
        }
        if (Trigger.isUndelete) {}
    }
    
    if (Trigger.isAfter ) {
        if (Trigger.isInsert) {
           
        }
        if (Trigger.isUpdate) {
            OpportunityApprovalEmail.sendEmail(trigger.new[0].Id);
            
        }
        if (Trigger.isDelete) {
            
        }
        if (Trigger.isUndelete) {}
    }
}