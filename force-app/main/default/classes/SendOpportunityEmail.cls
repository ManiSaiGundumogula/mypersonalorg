/*------------------------------------------------------------
Author:         Mani Sai Gundumogula
Company:        Apps Associates
Description:    Class for sending Email of opportunity details  
Test Class:     SendOpportunityEmail_test

History:
<Date>          <Authors Name>     			 <Brief Description of Change>
FEB/23/2018     Mani Sai Gundumogula        	 Initail Creation

------------------------------------------------------------*/
Global class SendOpportunityEmail {
    webservice static Integer sendEmail(Id OppId){
        
        Opportunity opp=[select id,name,Owner.email from Opportunity where id=:OppId];
        
        PageReference pdf = Page.OpportunityPdf;
        pdf.getParameters().put('id',OppId);
        //pdf.setRedirect(true);
        
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
            return 1;
        }
        else {return 0;}
    }
}