@isTest
public class TestClassForDupPositionsInSameLoc {

    @isTest static void DuplicatePositionSuccess(){
       test.startTest();
        Positions__c obj1 = new Positions__c(Name='Associate Trainee', Location__c='Tokyo, Japan');
        insert(obj1);
 		 Positions__c obj2 = new Positions__c(Name='Graduate Trainee', Location__c='Sydney, Australia');
        insert(obj2);   
        
        list<Positions__c> poslist =new list<Positions__c>([select Name, Location__c from Positions__c]);
       Positions__c obj = new Positions__c(Name='Graduate Trainee', Location__c='Sydney, Australia'); 
        for(Positions__c a: poslist){
            if(a.Name==obj.Name && a.Location__c==obj.Location__c){
                obj.addError('same position exists in same location');
            } 
           
        }
        
     test.stopTest();
    }
}