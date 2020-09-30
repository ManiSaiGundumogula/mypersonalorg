@istest
public class TestRestrictContactByName {
     @istest static void insertContact(){
    Contact sampleContact = new Contact();
 sampleContact.LastName = 'INVALIDNAME';
   insert sampleContact;
    }
}