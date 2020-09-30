trigger UpdateAccount on Account (after insert) {
    
  Account obj= trigger.new[0];
    obj.accountNumber='234';
  
   /* for(Account ob: trigger.new){
       Account obj=[select id, Name from Account where ];  
        insert obj; 
    }*/ 
    
    
}