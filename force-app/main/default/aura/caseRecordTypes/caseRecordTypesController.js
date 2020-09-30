({
	doInit : function(component, event, helper) {
		
	},
    PickChangeType : function(component, event, helper) {
        var parentValueType = component.find('parentPicklistType').get('v.value');
        if(parentValueType=='Lal'){
            var pVals1 = [
            {text:"Troubleshooting", value: "Troubleshooting"},
            {text:"General Enquiry", value: "General Enquiry"}
        ];
		var pVals2 = [];
            component.set('v.parentOptions1', pVals1);
            component.set('v.parentOptions2', pVals2);
        }
        else if(parentValueType=='Celsis'){
            var pVals2 = [
            {text:"Literature", value: "Literature"},
            {text:"Troubleshooting", value: "Troubleshooting"}
        ];
            var pVals1 = [];
            component.set('v.parentOptions1', pVals1);
            component.set('v.parentOptions2', pVals2);
        }
    },
    
    PickChange1 : function(component, event, helper) {
        var parentValueType = component.find('parentPicklist1').get('v.value');
        if(parentValueType=='Troubleshooting'){
            var pVals = [
            {text:"Reagent", value: "Reagent"},
            {text:"Instrument", value: "Instrument"}    
        ];
            component.set('v.dependentOptions', pVals);
        }
        else if(parentValueType=='General Enquiry'){
            var pVals = [
            {text:"Question on our Product", value: "Question on our Product"},
             {text:"Issues with Sample", value: "Issues with Sample"}   
        ];
            component.set('v.dependentOptions', pVals);
        }
    },
    
    PickChange2 : function(component, event, helper) {
        var parentValueType = component.find('parentPicklist2').get('v.value');
        if(parentValueType=='Troubleshooting'){
             console.log('1');
            var pVals = [
            {text:"Reagent", value: "Reagent"},
            {text:"Instrument", value: "Instrument"}    
        ];
            component.set('v.dependentOptions', pVals);
        }
        else if(parentValueType=='Literature'){
            console.log('2');
            var pVals = [
            {text:"Sample value 1", value: "Sample value 1"},
             {text:"Sample value 2", value: "Sample value 2"}   
        ];
            component.set('v.dependentOptions', pVals);
        }
    }
})