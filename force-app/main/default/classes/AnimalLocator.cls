public with sharing class AnimalLocator {
    public static string getAnimalNameById(Integer num) {
        Http h= new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+num);
        HttpResponse res = h.send(req);
        Map<String,Object> animal =new Map<String,Object>();

        if(res.getStatusCode()==200){
            Map<String,Object> results =(Map<String,Object>) JSON.deserializeUntyped(res.getBody());
            animal = (Map<String,Object>) results.get('animal');

        }

        return (String)animal.get('name');


    }

}