public class aaaErpIntegration {
    
    public static void getERP (){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://wisequarter1--erp.sandbox.my.salesforce.com/services/apexrest/ProductWebService');
        req.setHeader('Authorization', 'Bearer 00D780000008gDM!AQcAQGd75z2EiQx6FZzeG9tTar7nL7znHjdNrg7xWJv6iFTXramjy.chN28sMjmWK4qkPZ5St1SD.RXzilMJ1Qkcl9Uk8CNW');
        req.setHeader('Content-Type', 'Application/json');
        
        HttpResponse res = h.send(req);
       // system.debug(res.getBody());
    
       Map<string, Object> jsonErp = (Map<string,Object>) json.deserializeUntyped(res.getBody());
     	system.debug(jsonErp);
        
        List<Object> prodListErp = (List<Object>)jsonErp.get ('prodList');
		System.debug(prodListErp);	
        
        
        List<Product2> productList= new List<Product2> ();
        
        for (Object obj: prodListErp){
            
            Map<String, Object> lastMap = (Map<String, Object>) obj;
            Product2 prod = new Product2();
            prod.ProductCode= (string)lastMap.get('productCode');
            prod.Name= (string)lastMap.get('productName');
            prod.IsActive= (boolean)lastMap.get('isActive');
            prod.Description= (string)lastMap.get('description');
			prod.Family= (string)lastMap.get('bodyType');
            productList.add(prod);
            
        }
        
        
        if (res.getStatusCode()==200){
          //  Database.insert(productList);
        system.debug(productList);
            system.debug(res.getStatus());
           
            
            
        }Else{
            
            system.debug(res.getStatus());
        }
       
        
        
        
        
    }
    
    
  
}