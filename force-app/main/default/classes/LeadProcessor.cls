public with sharing class LeadProcessor implements Database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead ]);

    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leadList = new List<Lead> ();
        for(Lead ld: scope){           
            ld.LeadSource= 'Dreamforce';
            leadList.add(ld);
        }
        update leadList;
    }

    public void Finish(Database.BatchableContext bc){

    }

}