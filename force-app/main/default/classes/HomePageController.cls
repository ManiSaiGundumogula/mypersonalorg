public class HomePageController {
    public String uemail{get; set;}
    public String upassword{get; set;}
    Public Custom_Users__c con;
    Public Boolean RegisterFlag{get;set;}
    Public Boolean LoginFlag{get;set;}
    public Custom_Users__c newUser{get;set;}
    public HomePageController(ApexPages.StandardController controller){
        newUser = new Custom_Users__c();
        RegisterFlag=false;
        LoginFlag=false;
        
    } 
    public pageReference Search() { 
        RegisterFlag=false;
        LoginFlag=true;
        pageReference pageRefObj;
        system.debug('uemail'+uemail);
        System.debug('upassword'+upassword);
        if(uemail==NULL || uemail=='' || upassword==NULL){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.severity.WARNING, 'Enter Details...');
            ApexPages.addMessage(msg);
            return null;
        }
        
        try{
            con=[select id, name,Email_ID__c,Password__c from Custom_Users__c where Email_ID__c=:uemail];
        }
        catch(Exception e){
            
        }
        system.debug(con);
        if(con!=NULL){
            system.debug('innerloop'+con);
            if(con.Email_ID__c==uemail && con.Password__c==upassword ){
                pageRefObj = new pageReference('/apex/website?id='+con.id);
                pageRefObj.setredirect(true);
                return pageRefObj;
            }
            else if(con.Email_ID__c==NULL){
                ApexPages.Message msg = new ApexPages.Message(ApexPages.severity.WARNING, 'Email not registered');
                ApexPages.addMessage(msg);
                return null;
            } 
            else{
                ApexPages.Message msg = new ApexPages.Message(ApexPages.severity.WARNING, 'Password Wrong...');
                ApexPages.addMessage(msg);
                con.clear();
                return null;
            }  
            
        }
        else{
            
            ApexPages.Message msg = new ApexPages.Message(ApexPages.severity.WARNING, 'Email not registered');
            ApexPages.addMessage(msg);
            return null;
        }
        
        
    } 
    
    public pageReference Save(){
        RegisterFlag=true;
        LoginFlag=false;
        
        try{ 
            //generate random password
            newUser.Password__c='manisai';
            insert newUser;
            //sending password to email
            sendmail(newUser.Email_ID__c,newUser.Password__c);
            newUser.clear();
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.CONFIRM, '       You have been registered. Check your Email for your Password');
            ApexPages.addMessage(msg);
            
           
        }
        catch(Exception excp){
            // ApexPages.AddMessage(new   ApexPages.Message(ApexPages.Severity.ERROR,excp.getMessage()));
            ApexPages.AddMessage(new   ApexPages.Message(ApexPages.Severity.ERROR,'Email already registered'));
        }
        return null;
    }
    public void sendmail(String sendemail, String password){
                                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                                    string [] toaddress= New string[]{sendemail};
                                    email.setSubject('Password');
                                    email.setPlainTextBody('Your password is: '+password);
                                    email.setToAddresses(toaddress);
                                    Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
                        }
    
}