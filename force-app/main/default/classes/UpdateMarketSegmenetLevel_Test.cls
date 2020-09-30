/*
Test Class Name: UpdateMarketSegmenetLevel_Test
Purpose: To Cover the Code Coverage for the Apex Trigger, UpdateMarketSegmenetLevel
Author: Jayaraju Nulakachandanam
Created Date: 24-October-2017
*/
@isTest
public class UpdateMarketSegmenetLevel_Test
{
    
    static testMethod void UpdateMarketSegmenet1()
    {
        Account Acc = new Account(Name='Test Account');        
        insert Acc;
        
        //Reset the Governor Limits
        Test.startTest();        
            Opportunity Oppty = new Opportunity();
            Oppty.AccountId = Acc.Id;
            Oppty.Name = 'Testing Market Segments';
            Oppty.StageName = 'Prospecting';
            Oppty.Probability = 1;
            Oppty.LeadSource = 'Web';
            Oppty.CloseDate = System.Today();
            Oppty.Type='New Customer';                  
            insert Oppty;
        Test.stopTest();
    }
    
    static testMethod void UpdateMarketSegmenet2()
    {
        Account Acc1 = new Account(Name='Test Account');        
        insert Acc1;
        
        Test.startTest();
            RecordType rt = new RecordType();
            rt.Name='Sales Oppty';
            
            Opportunity Oppty1 = new Opportunity();
            Oppty1.RecordType=rt;
            Oppty1.AccountId = Acc1.Id;
            Oppty1.Name = 'Testing Market Segment';
            Oppty1.StageName = 'Needs Analysis';
            Oppty1.Probability = 1;
            Oppty1.CloseDate = System.Today();
            insert Oppty1;
                    
            rt = new RecordType();
            rt.Name='Marketing Opportunity';
            Oppty1.RecordType=rt;
            Oppty1.StageName = 'Negotiation/Review';
            Oppty1.Market_Segment_Level__c='Other';
            update Oppty1;
        Test.stopTest();
    }
    
}