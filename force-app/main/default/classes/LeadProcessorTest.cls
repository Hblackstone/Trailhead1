@istest
public with sharing class LeadProcessorTest {

    @TestSetup
    static void insertLeads(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i<200; i++){
            leadList.add(new Lead(LastName= 'test '+i,Status= 'Open - Not Contacted',LeadSource= 'Web', Company = 'Silverline'));

        }
        insert leadList;
        
    }
    @isTest
    static void LeadSourceTest() {
        Test.startTest();
        LeadProcessor myBatch = new LeadProcessor();
        Id myBatchId = Database.executebatch(myBatch);
        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);



    }
}