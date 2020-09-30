/*
Trigger Name: UpdateMarketSegmenetLevel
Purpose: Appending Market Segement Level on Account from Opportunity
Author: Jayaraju Nulakachandanam
Create Date: 24-Oct-2017
Test Class Name:

Modifications History
Date        Changes    Modified By

*/
trigger UpdateMarketSegmenetLevel on Opportunity (after update){

    //Variable Declaration
    Set<Id> AccountIdsList = new Set<Id>();
    
    //Logic to fetch all the Accounts associated with the Closed Won Opportunities
    for(Opportunity Oppty:Trigger.new){
        If(Oppty.AccountId !=null){
            AccountIdsList.add(Oppty.AccountId);
        }
    }      
    
    try{
        Map<Id,Account> AccsMap = new Map<Id,Account>([select Id,Market_Segment_Level__c from Account where Id IN:AccountIdsList]);
            
        List<Account> AccsList =  new List<Account>();
        AccsList = AccsMap.values();
        
       
        for(Account Acc:AccsList){  
        
        
            for(Opportunity Oppty:Trigger.new){
                
                if(Acc.Market_Segment_Level__c == null || Acc.Market_Segment_Level__c == ''){
                Acc.Market_Segment_Level__c  = Oppty.Market_Segment_Level__c;
                }
                else{
                    if(!(Acc.Market_Segment_Level__c.contains(Oppty.Market_Segment_Level__c))){
                        Acc.Market_Segment_Level__c  = Acc.Market_Segment_Level__c + ';'+Oppty.Market_Segment_Level__c;
                    }
                }
            }
        }
        
        update AccsList;
    }
    catch(Exception ex){
    }

}