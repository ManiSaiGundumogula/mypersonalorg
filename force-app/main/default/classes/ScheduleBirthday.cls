public class ScheduleBirthday implements Schedulable{

public void execute(SchedulableContext con){

list<Candidates__c> candidatelist= new list<Candidates__c>();
candidatelist= [select First_Name__c,Last_Name__c,Email__c,Next_Birthday__c from Candidates__c where Email__c != null];
for(Candidates__c can: candidatelist){
 if(can.Next_Birthday__c==date.today()){
    sendmail(can.Email__c); 
 }
}
} 
public void sendmail(String sendemail){
                                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                                    string [] toaddress= New string[]{sendemail};
                                    email.setSubject('Birthday Wishes');
                                    email.setPlainTextBody('Happy Birthday');
                                    email.setToAddresses(toaddress);
                                    Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
                        }

}