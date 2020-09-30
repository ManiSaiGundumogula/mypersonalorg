({
    doInit : function(component, event, helper) {
        var recordId = component.get("v.recordId");
        
      //  if(recordId!==NULL){
         //   alert('recordId: '+recordId);
        var action = component.get("c.getOpportunityPricingData");
        action.setParams({
            'recordId':recordId
        });
        action.setCallback(this,function(actionResult){
            var storeResponse = actionResult.getReturnValue();
            //alert('storeResponse: '+storeResponse);
            component.set("v.oppRec", storeResponse);
                           });
        
       // }
        $A.enqueueAction(action);
    }
})