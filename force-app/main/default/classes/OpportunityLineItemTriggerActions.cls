/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    Class for the OpportunityLineItemTrigger 
Test Class:     OpportunityLineItemTriggerActions_test

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
FEB/19/2018     Mani Sai Gundumogula        	 Initail Creation

------------------------------------------------------------*/
public class OpportunityLineItemTriggerActions {
    
    /*------------------------------------------------------------
Author:      Mani Sai Gundumogula
Company:     Apps Associates
Description: Update related Opportunity Amount when OpportunityLineItem is Inserted or Updated
Inputs:      New List Opportunity Line Items,Old Map of Opportunity Line Items
Returns:    N/A

History:
<Date>         <Authors Name>      <Brief Description of Change>
FEB/19/2018    Mani Sai Gundumogula   Initial Creation  
------------------------------------------------------------*/
    public static void CalculateTotalAmount(list<OpportunityLineItem> NewOppLineItems, Map<id,OpportunityLineItem> OldOppLineItemsMap, list<OpportunityLineItem> OldOppLineItems){
        list<Id> OpportunityIds = new List<Id>();
        List<Opportunity> oppList= new List<Opportunity>();
        
        //When Inserting and Updating OLI
       
            
            if(NewOppLineItems!=NULL){
                for(OpportunityLineItem OLI:NewOppLineItems){
                    OpportunityIds.add(OLI.OpportunityId);
                }
            }
            
           
            
            
            Map<Id, Opportunity> OppMap=new Map<Id, Opportunity>([select id,Total_Amount__c from Opportunity where id in:OpportunityIds]);
            
            
            for(OpportunityLineItem OLI:NewOppLineItems){
                Opportunity opp=OppMap.get(OLI.OpportunityId);
                if(opp.Total_Amount__c==NULL){opp.Total_Amount__c=0;}
                if(OldOppLineItemsMap!=NUll){
                    if(opp.id==OLI.OpportunityId && OLI.TotalPrice!=OldOppLineItemsMap.get(OLI.Id).TotalPrice){
                        opp.Total_Amount__c=opp.Total_Amount__c-OldOppLineItemsMap.get(OLI.Id).TotalPrice;
                        opp.Total_Amount__c=opp.Total_Amount__c+OLI.TotalPrice;  
                    }
                }
                else if(OldOppLineItems!=NULL){
                    opp.Total_Amount__c=opp.Total_Amount__c-OLI.TotalPrice;
                }
                else if(NewOppLineItems!=NULL){
                    if(opp.id==OLI.OpportunityId){
                        opp.Total_Amount__c=opp.Total_Amount__c+OLI.TotalPrice; 
                    }
                }
                OppMap.put(opp.id,opp);  
            }
            
            
            if(OppMap.size()>0){
                update OppMap.values();
            }
            
        }
        
    }