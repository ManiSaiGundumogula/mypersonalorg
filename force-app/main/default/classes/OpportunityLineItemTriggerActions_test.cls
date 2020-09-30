/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    Test Class for the OpportunityLineItemTrigger 
Test Class:     OpportunityLineItemTriggerActions_test

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
FEB/20/2018     Mani Sai Gundumogula        	 Initial Creation

------------------------------------------------------------*/
@isTest
public class OpportunityLineItemTriggerActions_test {
    
   // private static list<Opportunity> OppList;
    private static Id pricebookId;
    Private Static Product2 product1;
    Private Static Pricebookentry PBE;
    
    static{
        
        //Get Standard PriceBook ID
        pricebookId = Test.getStandardPricebookId();
        
        
        
        //insert Product
        product1=TestUtility.newProduct('Samsung');
        insert product1;
        
        //Insert PriceBookEntry
        PBE=Testutility.newPricebookEntry(pricebookId, product1.id, 100);
        Insert PBE;
        
    }
    static testMethod void CalculateTotalAmount_test(){
        
        Opportunity opp= TestUtility.newOpportunity('TestOpp', system.today(), 'Qualification');
        insert opp;
        
         list<Opportunity> OppList = new list<Opportunity>();
  	     for(Integer i=1; i<=10;i++){
       	     OppList.add(TestUtility.newOpportunity('TestOpp'+i, system.today(), 'Qualification'));
      	  }
      	  insert OppList; 
      
        OpportunityLineItem OLI=TestUtility.newOLI(opp.id,product1.id,PBE.id,10,100);
        insert OLI;
      
        
        OpportunityLineItem OLIToUpdate=[select id, Quantity,UnitPrice from OpportunityLineItem where id=:OLI.Id];
        OLIToUpdate.UnitPrice=200;
        update OLIToUpdate;
        
        OpportunityLineItem OLIToDelete=[select id, Quantity,UnitPrice from OpportunityLineItem where id=:OLI.Id];
        delete OLIToDelete;
    }
}