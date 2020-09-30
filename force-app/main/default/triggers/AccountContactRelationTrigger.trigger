trigger AccountContactRelationTrigger on AccountContactRelation (after insert) {

    if(trigger.isAfter){
       /* if(trigger.isInsert){
            list<Contact> conList = new List<Contact>();
            for(AccountContactRelation  acr: trigger.new){
                Contact con = new Contact();
                con.Id=acr.ContactId;
                con.accountId=acr.AccountId;
                conList.add(con);
            }
            if(conList.size()>0){
                update conList;
            }
        }*/
    }
}