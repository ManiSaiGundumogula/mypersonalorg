public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String input){
        List<List< SObject>> results=[Find :input in all fields returning Lead(Name), Contact(Name)];
        return results;    
            }
}