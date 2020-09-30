trigger UpdateCountryCode on Account (before insert) {
    if(trigger.isBefore)
    {
        if(trigger.isInsert){
            for(Account acc:trigger.new)
            {
            /* Map<String, CountryCodes__c> mapCountryCodes =CountryCodes__c.getAll();  
                if(acc.billingCountry!=''){
                   acc.BillingCountry=mapCountryCodes.get(acc.billingCountry).Country_Code__c;
                } */
                
              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'mani4sai@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Exception caught');
        string body = 'Hi Team'+'<br/> <br/>';
        body+='The following error has been occured while performing the operation: '+'<br/>';
        body+='errorMessage';
        body+='Error Message: ';
        mail.setHtmlBody(body);
        system.debug('sending mail'+mail);
        try{
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });   
        }
        Catch(Exception e){
            system.debug('sending email failed--> priority ');
        } 
        acc.AddError('Error Approving User. Unable to create User');     
                
            }
        }
    }
}