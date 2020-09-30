public class WebsiteController {
    public boolean sec1{get;set;}
    public boolean sec2{get;set;}
    public boolean sec3{get;set;}
    public boolean sec4{get;set;}
    public Long IMEINo{get;set;}
    public Lost_Phone__c searchLostPhone{get;set;}
    public Custom_Users__c LoggedInUser{get;set;}
    public Lost_Phone__c addLostPhone{get;set;}
    public list<Lost_Phone__c> getLostMobileDetails{get;set;}
    public Id recId;
    public WebsiteController(ApexPages.StandardController controller){
        LoggedInUser=[select id,
                      Name,
                      Date_of_Birth__c,
                      Gender__c,Country__c,
                      Pin_Code__c,
                      Mobile_No__c from Custom_Users__c where id =: Controller.getId()];
        addLostPhone = new Lost_Phone__c();
        searchLostPhone = new Lost_Phone__c();
        addLostPhone.Custom_Users__c= Controller.getId();
        recId=Controller.getId();
        system.debug('recId'+recId);
        sec1=true;
        sec2=false;
        sec3=false;
        sec4=false; 
    }
    public void updateProfileDetails(){
        try{
            update LoggedInUser;
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '       Profile has been updated Successfully');
            ApexPages.addMessage(msg);
        }
        catch(Exception excp){
            ApexPages.AddMessage(new   ApexPages.Message(ApexPages.Severity.ERROR,'         Error in updating Profile Details'));
        }
    }
    public void addLostDetails(){
        try{
            
            system.debug('addLostPhone'+addLostPhone + LoggedInUser.Id);
            insert addLostPhone;
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '       Lost Mobile has been added Successfully. Check in Mobiles added');
            ApexPages.addMessage(msg);
            addLostPhone.clear();
        }
        catch(Exception excp){
            ApexPages.AddMessage(new   ApexPages.Message(ApexPages.Severity.ERROR,excp.getMessage() + excp.getLineNumber() + excp.getCause()));
        }
    }
    public void search(){
        sec1=true;
        sec2=false;
        sec3=false;
        sec4=false;
        system.debug('sec1'+sec1+sec2+sec3+sec4);
    }
    public void SearchIMEI(){
        system.debug('IMEINo'+IMEINo);
        Integer num=123;
        try{
        searchLostPhone=[select IMEI_No__c,
                              Mobile_Brand__c,
                              Mobile_Model__c,
                              Lost_Phone_Mobile_No__c,
                              Lost_Place__c,
                              Pincode__c,
                              Contact_No__c,
                              Status__c from Lost_Phone__c where IMEI_No__c=:IMEINo];
        }
        catch(Exception excp){
         ApexPages.AddMessage(new   ApexPages.Message(ApexPages.Severity.ERROR,excp.getMessage() + excp.getLineNumber() + excp.getCause()));   
        }
        system.debug('searchLostPhone '+searchLostPhone);
    }
    public void addLostMobiles(){
        sec1=false;
        sec2=true;
        sec3=false;
        sec4=false;
        system.debug('sec2'+sec1+sec2+sec3+sec4);
    }
    public void getmobilesAdded(){
        sec1=false;
        sec2=false;
        sec3=true;
        sec4=false;
         getLostMobileDetails=[select id,
                              IMEI_No__c,
                              Mobile_Brand__c,
                              Mobile_Model__c,
                              Lost_Phone_Mobile_No__c,
                              Lost_Place__c,
                              Pincode__c,
                              Contact_No__c,
                              Status__c from Lost_Phone__c where Custom_Users__r.id=: recId];
        system.debug('recId'+recId);
       system.debug('getLostMobileDetails'+getLostMobileDetails);
        system.debug('sec3'+sec1+sec2+sec3+sec4);
    }
    public void getProfile(){
        sec1=false;
        sec2=false;
        sec3=false;
        sec4=true;
        system.debug('sec4'+sec1+sec2+sec3+sec4);
    }
}