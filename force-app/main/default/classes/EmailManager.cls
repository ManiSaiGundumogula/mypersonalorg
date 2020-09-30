public class EmailManager {
    public static Messaging.SingleEmailMessage sendMail(String address, String subject, String body){
        Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        return mail;
    }
}