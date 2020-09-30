public class sampleCon {

    public sampleCon(ApexPages.StandardController controller) {

    }
    public PageReference test() {
        return null;
    }

    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        List<Recordtype> recordlist;
        recordlist=[select Name from recordtype where SobjectType='Opportunity'];
        for(Recordtype a:recordlist){
        options.add(new SelectOption(a.name,a.name));
        }
         
        return options;
    }

    

}