@istest
public class AccountProcessorTest {
    @isTest
    static  void testAccount(){

        List<Account> accList = new List<Account> ();
        List<Id> recordIds = new List<Id>();
        List<Contact> cntList = new List<Contact> ();
       
            Account acc= new Account (name='Test');
            accList.add(acc);
        	insert accList;
        
        for(Integer i = 0; i<5; i++){

                Contact cnt = new Contact ();
                 cnt.LastName= 'TEST'+ i;  
                cnt.AccountId= acc.Id;
               
                cntList.add(cnt); 
             
        }
        insert cntList; 
             System.debug(cntList);
         recordIds.add(acc.id);

        Test.startTest();
        AccountProcessor.countContacts(recordIds);
        Test.stopTest();
        
        List<Account> newAccList = [SELECT id, name, Number_Of_Contacts__c
                                    FROM Account WHERE Id IN :accList ];
        system.debug(newAccList);
     
        
        
        System.assertEquals(5,newAccList[0].Number_Of_Contacts__c);        
        
    }
}