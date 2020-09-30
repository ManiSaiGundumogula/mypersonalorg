trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
    
    List<Messaging.SingleEmailMessage> sendemails=new List<Messaging.SingleEmailMessage>();
    list<Session_Speaker__c> inputList = new list<Session_Speaker__c>();
    for(Session_Speaker__c newitem :trigger.new){
        inputlist.add(newitem);
    }
    
    list<Session_Speaker__c> sessionSpeakers=[select Session__r.Name,
                                              Session__r.Session_Date__c,
                                              Speaker__r.First_Name__c,
                                              Speaker__r.Last_Name__c,
                                              Speaker__r.Email__c from Session_Speaker__c where id in :inputList];
    if(sessionSpeakers.size()>0){
        for(Session_Speaker__c obj:sessionSpeakers){
            if(obj.Speaker__r.Email__c!=NULL){
                String address=obj.Speaker__r.Email__c;
                String subject='Speaker Confirmation';
                String message='Dear '+obj.Speaker__r.First_Name__c+',\n Your Session '+obj.Session__r.Name+' on '
                               +obj.Session__r.Session_Date__c+ ' is confirmed.';
                sendemails.add(EmailManager.sendMail(address, subject, message));
                
            }
        }
        if(sendemails.size()>0){
           Messaging.sendEmail(sendemails);
        }
    }
    
}