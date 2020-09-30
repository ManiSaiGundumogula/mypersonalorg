public class OpportunityCreation {
    public static void createOpportunity(Account record){
       Opportunity OpportunityObj = new Opportunity();
       OpportunityObj.Name=record.Name;
        OpportunityObj.CloseDate=date.today();
        OpportunityObj.StageName='Prospecting';
        insert(OpportunityObj);
    }
}