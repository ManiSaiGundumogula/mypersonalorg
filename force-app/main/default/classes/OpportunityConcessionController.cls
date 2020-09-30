/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    
Test Class:     TestOpportunityConcessionController

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
MARCH/05/2018     Mani Sai Gundumogula        	 Initail Creation

------------------------------------------------------------*/
public class OpportunityConcessionController {
    
    
    public List<Concession__c> lineItems { get; set; }
    public List<ProcessInstanceWorkitem> processItems {get; set;}
    
    Public OpportunityConcessionController( ApexPages.StandardController std )
    {
        if( std.getRecord().Id != null )
        {
            system.debug('id'+std.getRecord().Id);
            lineItems = [ Select Id,
                         Fleet_Name__r.Name,
                         Fleet_Name__r.Country__c,
                         Fleet_Name__r.Owner.name,
                         Start_Year__c,
                         createdDate,
                         End_Year__c,
                         Maximum__c,
                         Minimum__c,
                         Model__r.Name,
                         Approved_Concession__c,
                         Total_Approved_Concession__c,
                         Fleet_Name__r.account.name,
                         Fleet_Name__r.account.billingStreet,
                         Fleet_Name__r.account.billingCity,
                         Fleet_Name__r.account.billingCountry,
                         Fleet_Name__r.account.billingState
                         from Concession__c where Fleet_Name__r.id =: std.getRecord().Id ];
            
            processItems=[select id,
                          actor.name,
                          CreatedDate,
                          ProcessInstanceId,
                          ProcessInstance.TargetObjectid 
                          from ProcessInstanceWorkitem where ProcessInstance.TargetObjectid=:std.getRecord().Id];
                
                }
        
        
        
    }         
}