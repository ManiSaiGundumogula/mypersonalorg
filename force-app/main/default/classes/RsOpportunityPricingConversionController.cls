public class RsOpportunityPricingConversionController {
    @AuraEnabled
    public Static Opportunity getOpportunityPricingData(String recordId){
        system.debug('recordId: '+recordId);
        if(recordId!=NULL){
        Opportunity opp = [Select Id, Name,stageName from Opportunity where Id=:recordId];
        System.debug(opp);
        return opp;
        }
        else{
            return null;
        }
    }
    
}