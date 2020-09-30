trigger ContactTriggerWithList on Contact (before insert) 
{
Set<Id> SetAccountId = new Set<Id>(); // Use set to collect unique account ID

    for(Contact con: Trigger.new) 
    {
     if(con.AccountId != null) 
     {
      SetAccountId.add(con.AccountId); // add Account in Set
     }
    }

    if( SetAccountId.size() >0 ) 
    {
         List<Account> listAccount = [ Select Id, Name, Type from Account where Id IN :SetAccountId ]; // Query Related Account
         
         for(Contact con: Trigger.new) 
             {
              if(con.AccountId != null)
              {
               for(Account acc: listAccount)
                   {
                    if(con.AccountId == acc.Id)
                    {
                     con.department= acc.Type;
                    }
                   }
              }
             }
    } 
}