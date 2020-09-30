trigger ContactTriggerWithMap on Contact (before insert) 
{
    Set<Id> SetAccountId = new Set<Id>();
        for(Contact cont: Trigger.new) 
        {
                if(cont.AccountId != null) 
                {
                SetAccountId.add(cont.AccountId);
                }
        }
    
        if(SetAccountId.size() > 0 ) 
        {
            Map<Id, Account> mapAccount = new Map<Id, Account>([Select Id, Name, Type from Account where Id IN :SetAccountId ]);
            for(Contact cont: Trigger.new) 
            {
                if(cont.AccountId != null && mapAccount.containsKey(cont.AccountId) ) 
                {
                    cont.department= mapAccount.get(cont.AccountId).Type;
                }
            }
        }
}