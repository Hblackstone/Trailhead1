@isTest
public with sharing class AddPrimaryContactTest {

    @TestSetup
    static void setup (){

        list<Account> accList = new List<Account> ();
        for(Integer i=0; i<50; i++){
            accList.add(new Account(name= 'testAccount '+i, BillingState ='CA'));
            accList.add(new Account(name= 'testAccount '+i, BillingState ='NY'));

        }
        insert accList;
        
    }
    @isTest
    static void testQueueable(){
        AddPrimaryContact myQueue= new AddPrimaryContact(new Contact(lastName= 'QueueableTest'), 'CA' );

        Test.startTest();
        System.enqueueJob(myQueue);
        Test.stopTest();
        system.assertEquals(50, [select count() from contact where accountId in (select id from account where BillingState ='CA')]);




        
    }
  
}