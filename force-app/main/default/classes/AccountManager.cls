@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest req =RestContext.request;
        String accountId =req.requestURI.substringBetween('Accounts/','/contacts');

        Account result= [SELECT Id, Name, (Select Id, Name FROM Contacts)
                        FROM Account
                        WHERE Id =:accountId limit 1];

        
        return result;
        
    }
}