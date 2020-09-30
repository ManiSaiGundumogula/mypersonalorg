trigger CreateContactFromAccount on Account (after insert, after update) {
    list<Contact> ContactList= new list<Contact>(); 
    list<Contact> ContactLastName = new list<contact>([select LastName from Contact]);
    if(trigger.isInsert){
        for(Account AccountObject:trigger.new){
            Contact ContactObject= new Contact(LastName='mani',AccountId=AccountObject.Id);
            ContactList.add(ContactObject);            
        }
        insert(ContactList);
        
    }
  else if(trigger.isUpdate){
        
        for(Account AccountObject:trigger.new){
            for(Contact lname: ContactLastName){
                if(! lname.LastName.contains(AccountObject.Name)){
                    lname.LastName=lname.LastName + ' '+ AccountObject.Name;
                    ContactList.add(lname); 
                }
            } 
        }
        update(ContactList);
    }
   
}