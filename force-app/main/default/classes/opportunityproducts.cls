public class opportunityproducts
{
	public List<OpportunityLineItem> lineItems { get; set; }
    
    Public opportunityproducts( ApexPages.StandardController std )
	{
		if( std.getRecord().Id != null )
		{
			
			
			lineItems = [ Select Id,
                         Name,
                         Opportunityid, 
                         TotalPrice, 
                         Quantity,UnitPrice from OpportunityLineItem where Opportunityid =: std.getRecord().Id ];
		}
		
    }         
}