public with sharing class AnimalLocator {
    public static string getAnimalNameById(Integer int) {
        Http h= new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/');




    }
}