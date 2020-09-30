trigger CheckDuplicatePositionsInsameLocation on Positions__c (before insert) {
   
    list<Positions__c> PositionList = new List<Positions__c>([select Name, Location__c from Positions__c]);
    
    if(trigger.isInsert){
        for(Positions__c positionObject: trigger.new){
            for(Positions__c refobject : PositionList){
                if(refobject.Name ==positionObject.Name && refobject.Location__c==positionObject.Location__c ){
                    positionObject.addError('same position exists in same location');
                }
            }
        }
    }
}