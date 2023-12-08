public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordIds){
        List<Account> accList = [SELECT Id,name, Number_Of_Contacts__c, (SELECT Id, name FROM Contacts) 
                                 FROM Account 
                                 WHERE Id IN :recordIds];
        
        List<Account> newAccList = new List<Account> ();
        for(Account acc : accList){
            acc.Number_Of_Contacts__c= acc.contacts.size();
            newAccList.add(acc);
                
        } 
        update newAccList;
      
        
        /*Testing Anonymous Window
        
        List<Account> acc= [SELECT Id             FROM Account Where Name 
                       Like 'Edge%' LIMIT 1];
        List<Id> acc1 = new List<Id> ();
        acc1.add(acc[0].Id);
        AccountProcessor.countContacts(acc1);
        */


        
        
    }
    
    
    

}