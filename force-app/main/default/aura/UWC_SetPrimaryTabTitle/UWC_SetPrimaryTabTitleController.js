({
    
    onTabFocused : function(component, event, helper) {
        alert('onTabFocused');
        console.log('onTabFocused');
    },
    openTab : function(component, event, helper) {
        // alert('Opentab method');
    },
    onTabRefreshed : function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            //workspaceAPI.closeTab({tabId: focusedTabId});
            console.log('getFocusedTabInfo: '+focusedTabId);
        })
        .catch(function(error) {
            console.log(error);
        });
        
        
        alert('Refresh - workspaceAPI: '+workspaceAPI);
    },
    onTabClosed : function(component, event, helper) {
        alert('onTabClosed');
    },
    onTabUpdaed: function(component, event, helper){
        var workspaceAPI = component.find("workspace");
        var getTabId= event.getParam('tabId');
        console.log('getTabId: '+ getTabId);
        workspaceAPI.getTabInfo({ tabId: getTabId}).then(function(response){
            var focusedTabId = response.tabId;
            var title=response.title;
            var customTitle = response.customTitle;
            console.log('focusedTabId: '+focusedTabId );
            console.log('tab label: '+title );
            console.log('Custom tab label: '+customTitle );
            
            if(title!=customTitle && typeof customTitle!=='undefined' ){
                
               // workspaceAPI.closeTab({tabId: focusedTabId});
                
                
                
                //alert('cannot change tab title');
                swal({title: 'Oops!!!Sorry you dont have permissions to customize tab', 
                     type: 'error',
                     showCancelButton: false,
                      showConfirmButton: false
                     }).then((value) => {
                   //  location.reload(true);
                    workspaceAPI.refreshTab({
                    tabId: focusedTabId,
                    includeAllSubtabs: true
                }); 
                
            }); 
            /* swal({
                    position: 'top',
                    type: 'success',
                    title: 'Your work has been saved',
                    showConfirmButton: false,
                    customClass: 'swal-wide'
                }); */
            
             
               /* var modalBody;
                $A.createComponent("c:modalContent", {},
                                   function(content, status) {
                                       if (status === "SUCCESS") {
                                           modalBody = content;
                                           component.find('overlayLib').showCustomModal({
                                               header: "Error Customizing Name",
                                               body: modalBody,
                                               showCloseButton: false,
                                               cssClass: "mymodal",
                                               
                                           }).then(function (overlay) {
                                               setTimeout(function(){ 
                                                   //close the popover after 3 seconds
                                                   overlay.close(); 
                                               }, 5000);
                                           });
                                           
                                       }
                                   }); */
                
           /* var sMsg = 'Contact Your Admin \n';
            sMsg= sMsg+'yes \n';
            
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                mode: 'sticky',
                message: sMsg,
                type : 'Warning'
            });
            toastEvent.fire(); */
            workspaceAPI.setTabLabel({
                tabId: focusedTabId,
                label: response.title
            });   
        }
                                                         
                                                         })
        .catch(function(error) {
            console.log(error);
        }); 
        /* 
        workspaceAPI.getAllTabInfo().then(function(response) {
            for(var i=0; i<response.length; i++){
              workspaceAPI.setTabLabel({
                    tabId: response[i].tabId,
                    label: response[i].title
                });   
            }
            console.log('response: '+response);
			console.log('response size: '+response.length);
            console.log('response title: '+response[0].title);
            console.log('response custom title: '+response[0].tabId);
            console.log('response title: '+response[1].title);
            console.log('response custom title: '+response[1].customtitle);
            console.log('response title: '+response[2].title);
            console.log('response custom title: '+response[2].customtitle);
       })
        .catch(function(error) {
            console.log(error);
        }); */
    },
    onTabUpdated : function(component, event, helper) {
        //var updatedTabId = event.getParam("tabId");
        //alert('updatedTabId: '+updatedTabId);
        var workspaceAPI = component.find("workspace");
        
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            console.log('tab label: '+response.label);
            workspaceAPI.closeTab({tabId: focusedTabId});
            console.log('getFocusedTabInfo: '+focusedTabId);
        })
        .catch(function(error) {
            console.log(error);
        });
        
        workspaceAPI.openTab({
            url: '#/sObject/5007F000003V48jQAC/view',
            focus: true
        }); 
    },
    onTabReplaced : function(component, event, helper) {
        // alert('onTabReplaced: ');
    }
})