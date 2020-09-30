public class SearchController {
    private apexpages.standardController controller {get; set; }
   	public List<Account> searchResults1 {get; set;}
    public string searchText1{get;set;}
    public Date dat {get;set;}
    public Integer start {get;set;}
    public Integer endl {get;set;}
    public Integer count {get;set;}
    public Integer noOfRecords {get;set;} 
   
    public SearchController(ApexPages.StandardController controller)
    {
        this.controller = controller;
        noOfRecords=5;
        start=0;
        endl=noOfRecords; 
        search();
    }
    public void previous(){
        if(start>=noOfRecords){
        start=start-noOfRecords;
        search();
        }
    }
    public void next(){
        system.debug('start'+start);
        system.debug('count'+count);
        if(start<count-noOfRecords){
        start=start+noOfRecords;
      //searchResults1=null;
     System.debug('next block');
        search();  
        }
    }
    public PageReference search()
    {
       endl =noOfRecords;
        if(searchText1 != ''){
            SearchResults1 = new List<Account>();
            SearchResults1=[select id,
                            Name,
                            Industry,
                            CreatedDate from Account where name like :'%' + searchText1 + '%' Order By Name];
            count=SearchResults1.size();
            SearchResults1=[select id,
                            Name,
                            Industry,
                            CreatedDate from Account where name like :'%' + searchText1 + '%' Order By Name limit:endl offset:start] ;
        System.debug('block1'); 
        }
        if(dat!=null){
            system.debug(dat);
           Integer day=dat.day();
            Integer month=dat.month();
            Integer year=dat.year();
            SearchResults1=[select id,
                           Name,
                           Industry,
                           CreatedDate from Account where
                           CALENDAR_YEAR(CreatedDate)=:year and CALENDAR_MONTH(CreatedDate)=:month and DAY_IN_MONTH(CreatedDate)=:day
                           Order By Name];
            count=SearchResults1.size();
            system.debug('date'+day+month+year);
           SearchResults1 = new List<Account>();
           SearchResults1=[select id,
                           Name,
                           Industry,
                           CreatedDate from Account where
                           CALENDAR_YEAR(CreatedDate)=:year and CALENDAR_MONTH(CreatedDate)=:month and DAY_IN_MONTH(CreatedDate)=:day
                           Order By Name limit:endl offset:start] ;
            System.debug('block2'); 
          
        }
        if(string.isEmpty(searchText1) && dat==null){
           SearchResults1 = new List<Account>();
           SearchResults1=[select id,
                           Name,
                           Industry,
                           CreatedDate from Account Order By Name ] ;
            count=SearchResults1.size();
            SearchResults1=[select id,
                           Name,
                           Industry,
                           CreatedDate from Account Order By Name limit:endl offset:start] ;
           System.debug('block3'); 
        }
     
       return null; 
     }
     
   
}