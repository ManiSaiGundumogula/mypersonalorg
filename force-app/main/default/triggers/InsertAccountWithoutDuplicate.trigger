trigger InsertAccountWithoutDuplicate on Account (before insert) {
  List<Account> AccountObject = new List<Account>([select Name from Account]);
    for(Account newRecord:trigger.new){
        for(Account ref:AccountObject)
    {
        if(ref.Name==newRecord.Name){
            newRecord.addError('No duplicates allowed in Account Name');
           
        }
    }
        
    }
}