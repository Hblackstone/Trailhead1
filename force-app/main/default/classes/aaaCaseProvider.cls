@RestResource(urlMapping='/cases/*')
global class aaaCaseProvider {
    
   
//*********************************************************************************    
    @HttpGet
    global static List<Case> allCaseGet(){
            
       system.debug(system.Url.getSalesforceBaseUrl());
      //  >>>>ULI mydomain den bulunabilir yada yukaridaki gibi https://wqcom3-dev-ed.develop.my.salesforce.com>>>>>>buraya /services/apexrest yazilir ve sonuna bizim ekledigimiz /cases/ eklenir.
		// https://wqcom3-dev-ed.develop.my.salesforce.com/services/apexrest/cases

		system.debug('sessionID>>>> '+ System.UserInfo.getSessionId().substring(15));
	//	DEBUG|sessionID>>>> !AR4AQP1sXZFy8y0txZm6m7w7rcNjrlE1Q15H3ukI644j3_uApn0XSafK15afTbeLvowSJ70uwe5cpVMc4ZviPHeVnX_v8Kwu
//!AR4AQCuou31t_091s4YzFhKXbFZ4PB85nymMq4xVo_zEE9cb4iyaSuYVn_0NhjN4dkFgfS86YK2eJY58qoE2U76bfaHXhPjw
        
  
 
        List<case> caseList =[SELECT id, status,priority, CaseNumber,origin ,  Subject FROM case ];


            
           return caseList;
        
      
        
    
    }
//**********************************************************    
    
    @HttpDelete
    global static string deleteCase(){
        
        RestRequest req = RestContext.request;       
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Case cs = [SELECT Id FROM Case WHERE Id = :caseId];
        delete cs;
        return 'silindi';
        
        
    }
  
    @HttpPost
    global static id createCase(string caseSubject, string caseStatus, String caseOrigin, String casePriority){
        
        Case cs = new Case();
        cs.Subject= caseSubject;
        cs.Status= caseStatus;
        cs.Origin=caseOrigin;
        cs.Priority= casePriority;
        Database.insert(cs);
        return cs.Id;
        
        
        
    }
    
     @HttpPut
    global static case upsertCase(string caseSubject, string caseStatus, String caseOrigin, String casePriority, String caseid){
        
        Case cs = new Case();
        cs.Id= caseid;
        cs.Subject= caseSubject;
        cs.Status= caseStatus;
        cs.Origin=caseOrigin;
        cs.Priority= casePriority;
      
        Database.upsert(cs);
        return cs;

    }
    
    @HttpPatch    
    global static ID updateCase(){
    
        RestRequest req = RestContext.request;
        String caseId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        
        Case caseToBeUpdated =[SELECT id FROM Case WHERE id= :caseId];
        
        Map <String,Object> params = (Map <String,Object>)Json.deserializeUntyped(req.requestBody.tostring());
       
          for (String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            caseToBeUpdated.put(fieldName, params.get(fieldName));
        }
        update caseToBeUpdated;
        return caseToBeUpdated.Id;
    }
    
    

}