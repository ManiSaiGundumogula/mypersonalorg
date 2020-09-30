public class RandomContactFactory {
    public static list<contact> generateRandomContacts( integer count, String data){
        list<contact> con= new List<contact>();
        for(integer i=1;i<=count;i++){
            Contact c = new Contact(LastName='name',FirstName='data'+i);
            con.add(c);
        }

        return con;
    } 
}