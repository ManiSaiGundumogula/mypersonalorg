({
    navigateToComTwo : function(component, event, helper) {
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:ComponentTwo",
            componentAttributes: {    
                Text : component.get("v.Txt")
            }
        });
        evt.fire();
 }
})