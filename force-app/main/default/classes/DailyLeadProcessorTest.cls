
@isTest
private  with sharing class DailyLeadProcessorTest {
     
    @isTest
    static void testScheduleJob (){
        String cron = '0 0 0 * * ?';

        List<Lead> ldList = new List<Lead>();
        for(Integer i = 0; i<200; i++){
            Lead ld = new Lead (
                LastName = 'Test '+ i,
                LeadSource= '',
                Company = 'kkk'
            );
            ldList.add(ld);
        }
        insert ldList;

        Test.startTest();
        String jobId = System.Schedule('LeadSource update',cron, new DailyLeadProcessor() );
        Test.stopTest();
        

        System.assertEquals(200, [Select id FROM Lead WHERE LeadSource = 'Dreamforce'].size());


    }


    
}