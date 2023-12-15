public with sharing class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext ctx) {
        List<Lead> leadList = [SELECT id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        List<Lead> updateLeadSource = new List<Lead> ();

        for(Lead newLead: leadList){
            newLead.LeadSource = 'Dreamforce';
            updateLeadSource.add(newLead);
            
        }
        update updateLeadSource;


    }

 
            

}