public class GroupingExampleController 
{
 private List<Account> allAccs {get; set;}
 public List<GroupWrapper> groups {get; set;}
 public String groupFieldName {get; set;}
 public List<SelectOption> groupOptions {get; set;}
  
 public GroupingExampleController()
 {
  allAccs=[select id, Name, BillingStreet, BillingCity, BillingCountry, Type,
         (select id, Name, Email, Phone from Contacts)
     from Account
     where Type != null
     ];
  groupFieldName='Type';
   
  setupGrouping();
  groupOptions=new List<SelectOption>();
  groupOptions.add(new SelectOption('Name', 'Name'));
  groupOptions.add(new SelectOption('BillingCity', 'BillingCity'));
  groupOptions.add(new SelectOption('BillingCountry', 'BillingCountry'));
  groupOptions.add(new SelectOption('Type', 'Type'));
 }
  
 public PageReference regroup()
 {
  setupGrouping();
  return null;
 }
  
  
 private void setupGrouping()
 {
  Map<String, List<Account>> groupedMap=new Map<String, List<Account>>();
  for (Account acc : allAccs)
  {
   String key=String.valueof(acc.get(groupFieldName));
   if ( (null==key) || (0==key.length()) )
   {
    key='Undefined';
   }
   List<Account> groupedAccs=groupedMap.get(key);
   if (null==groupedAccs)
   {
    groupedAccs=new List<Account>();
    groupedMap.put(key, groupedAccs);
   }
    
   groupedAccs.add(acc);
  }
   
  groups=new List<GroupWrapper>();
  for (String key : groupedMap.keySet())
  {
   GroupWrapper gr=new GroupWrapper();
   groups.add(gr);
   gr.accs=groupedMap.get(key);
   gr.groupedVal=key;
  }
 }
  
 public class GroupWrapper
 {
  public List<Account> accs {get; set;}
  public String groupedVal {get; set;}
  public Integer count {get {return accs.size(); } set;}
 }
}