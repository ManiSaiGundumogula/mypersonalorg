/*
*/
public class OpportunityProductsSelection {

    //Variable Declaration
    Opportunity Oppty{get;set;}
    
    //Constructor
    public OpportunityProductsSelection(ApexPages.StandardController controller) {
    
        this.Oppty=(Opportunity)controller.getRecord();
        
        if(this.Oppty.Id !=null){
            this.Oppty=[select id,Name,Select_All_Products__c,Opportunity_Products_List__c from Opportunity where id=:Oppty.id];
        }
        
        system.debug('Current Opportunity:'+this.Oppty);
    }
    
    //Method to excute the Products Selection logic
    public PageReference ProductSelection()    
    {
        try{
            if(Oppty.Select_All_Products__c == True)        
            {
                String OpptyProductValues='Mobiles;Laptops;Softwares;Hardware';
                Oppty.Opportunity_Products_List__c=OpptyProductValues;
                system.debug('Opportunity Product Values:'+this.Oppty.Opportunity_Products_List__c);
            }
            else
            {
                //Oppty.Opportunity_Products_List__c=null;
    
            }
            
            
        }
        catch(Exception ex)
        {
            system.debug('Errors in the Production selection:'+ex.getMessage());
        }
        return null;
    }

}