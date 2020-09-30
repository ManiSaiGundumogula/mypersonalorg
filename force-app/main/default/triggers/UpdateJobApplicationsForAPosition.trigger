trigger UpdateJobApplicationsForAPosition on Job_Application__c (after insert, after delete, after update, after undelete) {
    
    set<Id> PositionsIdSet = new set<Id>();  
    
    if(trigger.isInsert){
        for( Job_Application__c PosId:trigger.new){
          PositionsIdSet.add(PosId.Position__c);
        }
    }
  /*  else if(trigger.IsDelete){
        
    }
    else if(trigger.isUpdate){
        
    }
    else if(trigger.isUndelete){
        
    }
*/
   AggregateResult[] groupedResults = [select count(id), Position__c from Job_Application__c where id in : PositionsIdSet  group by Position__c]; 
    
    
    
}