@isTest
public class TestClassForDuplicateAccName {
    static testMethod void findDuplicateSuccess(){
        test.startTest();
        Account accObj1= new Account(Name='sample account');
        insert(accObj1);
        Account accObj2 = new Account(Name='test account');
        insert(accObj2);
        list<Account> AccNameList =new list<Account>([select Name from Account]);
        Account accObj = new Account(Name='sample account');
        for(Account a: AccNameList){
            if(a.Name==accObj.Name){
                //accObj.Name.addError('account name already exists');
            }   
        }
        test.StopTest();
    }
    static testMethod void findDuplicateFailure(){
        test.startTest();
        Account accObj1= new Account(Name='sample account');
        insert(accObj1);
        Account accObj2 = new Account(Name='test account');
        insert(accObj2);
        list<Account> AccNameList =new list<Account>([select Name from Account]);
        Account accObj = new Account(Name='Smoke test');
        for(Account a: AccNameList){
            if(a.Name==accObj.Name){
                //accObj.Name.addError('account name already exists');
            }   
        }
        test.StopTest();
    }
}