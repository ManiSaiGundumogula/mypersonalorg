public class studentTriggerClass {
    @InvocableMethod(label='Get Account Names' description='Returns the list of account names corresponding to the specified account IDs.')
    public static void updateEndDate(List<Id> childIds){
        List<Id> parentIdsList = new List<Id>();
        Map<Id, Student__c> classMap= new Map<Id, Student__c>();
        //Map of all records that we have created
        Map<Id, Student__c> studentMap= new Map<Id, Student__c>([select id, 
                                                                 End_Date__c, Class__c from Student__c 
                                                                 where id in :childIds]);
        for(Student__c stdnt: studentMap.values()){
            parentIdsList.add(stdnt.Class__c);  
        }
        
        //Map of all related sibling records
        Map<Id, Student__c> getsiblings =new Map<Id,Student__c >([select id, End_Date__c, Class__c from Student__c 
                                                                  where Class__c in :parentIdsList and End_Date__c=NULL]);
        
        for(Student__c sc: getsiblings.values()){
            if(studentMap.containsKey(sc.id)){
                classMap.put(sc.Class__c, sc);
                getsiblings.remove(sc.Id);
                
            }
        }
        
        for(Student__c sc: getsiblings.values()){
            if(classMap.containsKey(sc.Class__c)){
                sc.End_Date__c=system.today();
                //sc.End_Date__c=classMap.get(sc.Class__c).startDate;
                getsiblings.put(sc.Id, sc);
            }
            
        }
        update getsiblings.values();
    }
}