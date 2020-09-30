public class eventController {
    
    public SelectOption[] selectedUsers { get; set; }
    public SelectOption[] allUsers { get; set; }
    public list<String> selected{get; set;}
    public list<String> removed{get; set;}
    public Set<String> nsUsers{get; set;}
    public Set<String> sUsers{get; set;}
    
    public eventController(ApexPages.StandardController controller){
        
        nsUsers=new Set<String>();
        sUsers=new Set<String>();
        selectedUsers = new List<SelectOption>();
        
        List<Users__c> Users = [SELECT Name, Id FROM Users__c];    
        allUsers = new List<SelectOption>();
        for ( Users__c c : Users ) {
            allUsers.add(new SelectOption(c.Name, c.Name));
            nsUsers.add(c.Name);
        }
    }
    public void createList(){
        allUsers.clear();
        selectedUsers.clear();
        for(String s1:nsUsers){
            SelectOption op1=new SelectOption(s1,s1);
            allUsers.add(op1);
        }
        
        for(String s2:sUsers){
            SelectOption op1=new SelectOption(s2,s2);
            selectedUsers.add(op1);
        }
    }
    
    public void add(){
        nsUsers.removeAll(selected);
        sUsers.addAll(selected);
        createList();
    }
    
    public void remove(){
        sUsers.removeAll(removed);
        nsUsers.addAll(removed);
        createList();
    }
    public void save(){
        Events__c newEvent= new Events__c();
        newEvent.Participants__c='mani';
        insert newEvent;
    }  
    
}