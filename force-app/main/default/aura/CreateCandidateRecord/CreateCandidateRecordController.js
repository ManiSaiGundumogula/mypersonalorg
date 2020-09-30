({
	create : function(component, event, helper) {
		console.log('Create record');
        
        //getting the candidate information
        var candidate = component.get("v.candidate");
        
        //Validation
        if($A.util.isEmpty(candidate.Name) || $A.util.isUndefined(candidate.Name)){
            alert('First Name is Required');
            return;
        }            
        
        //Calling the Apex Function
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({
            candidate : candidate
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newCandidate = {'sobjectType': 'Account',
                                    'Name': ''
                                   };
                //resetting the Values in the form
                component.set("v.candidate",newCandidate);
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        
		//adds the server-side action to the queue        
        $A.enqueueAction(action);

	}
})