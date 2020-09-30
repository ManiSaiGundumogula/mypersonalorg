trigger RejectDoubleBooking on Session_Speaker__c (before insert, before update) {
    list<id> speakerids= new list<id>();
    Map<id, DateTime> requested_bookings=new Map<id, DateTime>();
    
    for(Session_Speaker__c inputList: trigger.new){
        requested_bookings.put(inputlist.Session__c, null);
        speakerids.add(inputlist.Speaker__c);
    }
    system.debug(speakerids);
    list<Session__c> related_sessions =[select id, 
                                        Session_Date__c from Session__c where id in : requested_bookings.keySet()];
    system.debug(related_sessions);
    for(Session__c rel:related_sessions){
        requested_bookings.put(rel.Id, rel.Session_Date__c);
    }
    
    list<Session_Speaker__c> relatedspeakers=[select id,
                                              Session__c,
                                              Speaker__c,
                                              Session__r.Session_Date__c from Session_Speaker__c 
                                              where Speaker__c in :speakerids];
    system.debug(relatedspeakers);
    for(Session_Speaker__c input: trigger.new){
        DateTime bookingtime=requested_bookings.get(input.Session__c);
        for(Session_Speaker__c rel:relatedspeakers){
            system.debug(input.Session__c);
            system.debug(rel.Session__c);
            if(input.Speaker__c==rel.Speaker__c && bookingtime==rel.Session__r.Session_Date__c){
               system.debug(input.Session__c);
                input.addError('The speaker is already booked at that time');
            }
        }
    }
}