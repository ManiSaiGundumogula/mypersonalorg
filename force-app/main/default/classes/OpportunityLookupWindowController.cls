public class OpportunityLookupWindowController {
public String searchString { get; set; }  
 public String accountId { get; set; }  
 public String opportunityId { get; set; }  
 public List<User> users { get; set; }  
 public OpportunityLookupWindowController(){  
      this.searchString = Apexpages.currentPage().getParameters().get('searchString');  
      this.accountId = Apexpages.currentPage().getParameters().get('accountId');  
      this.opportunityId = Apexpages.currentPage().getParameters().get('opportunityId');  
      this.retrieveTeamMembers();  
 }
    public void retrieveTeamMembers(){  
      if(this.searchString != null && this.searchString != ''){  
           performSearch();  
      } else {  
           Map<String, User> userMap = new Map<String, User>();  
           Set<Id> userIds = new Set<Id>();  
           for(List<AccountTeamMember> members : [SELECT Id, UserId FROM AccountTeamMember WHERE 
                 AccountId = :this.accountId]){  
                for(AccountTeamMember member : members){  
                     userIds.add(member.UserId);  
                }  
           }  
           for(List<OpportunityTeamMember> members : [SELECT Id, UserId FROM OpportunityTeamMember WHERE 
               OpportunityId = :this.opportunityId]){  
                for(OpportunityTeamMember member : members){  
                     userIds.add(member.UserId);  
                }  
           }  
           this.users = [  
                SELECT Id, Name, FirstName, LastName, Email, Phone, Profile.Name, Profile.UserType   
                     FROM User   
                          WHERE Id IN :userIds  
                               AND isActive = true   
                               AND Profile.UserType = 'Standard'   
                               ORDER BY LastName ASC, FirstName ASC];  
      }  
 } 
    public void performSearch(){  
      String query = 'SELECT Id, Name, FirstName, LastName, Email, Phone, Profile.Name, Profile.UserType'  
            + ' FROM User'  
            + ' WHERE isActive = true'  
            + ' AND Profile.UserType = \'Standard\'';  
            if(this.searchString != null && this.searchString != ''){  
                query += ' AND (Name LIKE \'%' + String.escapeSingleQuotes(this.searchString) + '%\' OR Phone LIKE \'%' + 
                String.escapeSingleQuotes(this.searchString) + '%\' OR Email LIKE \'%' + 
                String.escapeSingleQuotes(this.searchString) + '%\')';  
            }       
            query += ' ORDER BY LastName ASC, FirstName ASC';  
      this.users = database.query(query);  
 }  
}