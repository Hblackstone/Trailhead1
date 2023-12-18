@isTest
public with sharing class AccountManagerTest {
    @isTest
    static void testGetAccount(){
        Account acc = new Account(name='Testxxx');
        insert acc;
        Contact cnt = new Contact (LastName ='cnt', accountId = acc.Id);
        Insert cnt;
        ID recordId = acc.id;
        RestRequest req = new RestRequest();
        req.requestURI = 'wqcom3-dev-ed.develop.my.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        req.httpMethod= 'GET';
        RestContext.request = req;
        Account testAccount = AccountManager.getAccount();

        System.assertEquals('Testxxx', testAccount.name);
        


    }


}