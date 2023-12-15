public with sharing class AddPrimaryContact implements Queueable{
private Contact cnt;
private String str;

    public AddPrimaryContact(Contact con, String strng) {
        this.cnt=con;
        this.str=strng;

    }
    public  void execute (QueueableContext context){
       List<Account> accList= [Select id,BillingState from account where BillingState = :str LIMIT 200 ];
       List<Contact> listContacts = new List<Contact> ();
       for(Account acc: accList){
        Contact cont = cnt.clone(false,false,false,false);
        cont.AccountId= acc.Id;
        listContacts.add(cont);

       }
       insert listContacts;


    }






}