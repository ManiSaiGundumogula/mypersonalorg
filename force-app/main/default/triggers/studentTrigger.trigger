trigger studentTrigger on Student__c (after insert) {
List<Id> idsList = new List<Id>();
    if(trigger.isAfter){
        if(trigger.isInsert){
            for(Student__c stdnt: trigger.new){
               idsList.add(stdnt.Id); 
            }
            if(idsList.size()>0){
				studentTriggerClass.updateEndDate(idsList);
            } 
        }
    }
}