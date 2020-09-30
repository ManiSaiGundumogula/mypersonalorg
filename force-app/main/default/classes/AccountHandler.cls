public class AccountHandler {
    public static Account insertNewAccount(String accName){
        Account acc=new Account();
        try{
            acc.Name=accName;
            insert acc;
              return acc;
        }
        catch(Exception e){
            return null;
        }
      
    }
}