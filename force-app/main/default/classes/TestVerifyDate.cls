@isTest
public class TestVerifyDate {

   @istest static void Checkdates(){
         test.startTest();

      //  Date date1=Date.newInstance(2014,01,01);
        Date date2=Date.newInstance(2014,01,30);
       VerifyDate.CheckDates(Date.newInstance(2014,01,01),date2);       
        test.stopTest();
    }
     @istest static void Checkdates2(){
         test.startTest();

        Date date1=Date.newInstance(2015,01,01);
        Date date2=Date.newInstance(2014,01,30);
       VerifyDate.CheckDates(date1,date2);       
        test.stopTest();
    }
}