/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    Provides functions for the creation of test records for unit testing
Test Class:     TestUtility

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
FEB/20/2018     Mani Sai Gundumogula        	 Initial Creation

------------------------------------------------------------*/
@isTest
public class TestUtility {
    
    public static Opportunity newOpportunity(String Name, Date CloseDate, String StageName){
        return new Opportunity(Name=Name,
                               CloseDate=CloseDate,
                               StageName=StageName
                              );
    }
    
    public static Product2 newProduct(String name){
        return new Product2(
            Name = name
            , IsActive = true
        );
    }
    public static PricebookEntry newPricebookEntry(Id pricebookId, Id productId, Double unitPrice){
        return new PricebookEntry(
            Pricebook2Id = pricebookId
            , Product2Id = productId
            , UnitPrice = unitPrice 
            , IsActive = true
        );
    }
    public static OpportunityLineItem newOLI(Id OpportunityId,Id Product2Id,Id PricebookEntryId,Decimal Quantity,Decimal UnitPrice){
        return new OpportunityLineItem(
            OpportunityId=OpportunityId,
             Product2Id=Product2Id,
            PricebookEntryId=PricebookEntryId,
            Quantity=Quantity,
            UnitPrice=UnitPrice
        );
    } 
}