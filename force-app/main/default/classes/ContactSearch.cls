public class ContactSearch {
    public static list<Contact> searchForContacts(String Lname, String Mailingcode){
        list<Contact> conList=[Select LastName,
                               MailingPostalCode from Contact where LastName=:Lname and MailingPostalCode=:Mailingcode ];
     
        return conList;
    }
}