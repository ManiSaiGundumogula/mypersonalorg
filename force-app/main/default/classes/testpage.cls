public class testpage{
    public testpage(ApexPages.StandardController controller){
        dotestpage();
    }
   
    public PageReference dotestpage(){
        Account_User_Access__c obj= Account_User_Access__c.getInstance(System.UserInfo.getUserId());
        if(obj!=NULL){
            
            if(obj.Account_Pemisions__c) {
                PageReference pageRef = new PageReference('/001/e?retURL=%2F001%2Fo');
                pageRef.setRedirect(true);
                return pageRef;
            }
            else{
                
                return null; 
                
            }
        }
        else{
            
            return null; 
            
        }
    } 
  
    
    
}