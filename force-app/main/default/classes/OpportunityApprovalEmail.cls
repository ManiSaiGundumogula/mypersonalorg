/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    Class for sending Email of opportunityand its related concession details  
Test Class:     OpportunityApprovalEmail_test

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
FEB/23/2018     Mani Sai Gundumogula        	 Initail Creation

------------------------------------------------------------*/
public class OpportunityApprovalEmail {
    @future(callout=true)	 
    public static void sendEmail(Id oppId){
          
       Opportunity opp=[select id,name,Owner.email,Approval_status__c from Opportunity where id=:oppId];
          if(opp.Approval_status__c=='Approved'){
        PageReference pdf = Page.OpportunityConcessionInvoice;
        pdf.getParameters().put('id',opp.Id);
     
        
        // Take the PDF content
        Blob b = pdf.getContent();
        
        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('attachment.pdf');
        efa.setBody(b);
        
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{opp.Owner.email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Opportunity details');
        mail.setPlainTextBody(opp.Id);
       	mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
		Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        if(results[0].success){
           
        }
        else {}
          }
    }
          

}