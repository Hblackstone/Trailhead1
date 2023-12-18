@isTest
private with sharing class AnimalLocatorTest {

    @isTest
    static void AnimalLocatorTestMock(){
        try{
            Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
            String result = AnimalLocator.getAnimalNameById(1);
            string expresult= 'bear';
            system.assertEquals(result, expresult);
        }
        catch(Exception e){
            system.debug(e.getMessage());

        }

    }

}