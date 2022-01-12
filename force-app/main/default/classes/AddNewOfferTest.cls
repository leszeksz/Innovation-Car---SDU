/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class created to test possibility of adding only one phisycal offer to one salon.
 */
@isTest
public class AddNewOfferTest {

    @isTest static void AddCarToSalon(){
        List<Vehicle__c> testCars = TestsUtils.createTestCars(2);
        List<Salon__c> testSalons = TestsUtils.createTestSalon(1);
        
        for(Integer i=0; i<2; i++){
            testCars[i].Salon__c = testSalons[0].Id;
        }
        
        Offer__c newOffer = new Offer__c(
        	Vehicle__c = testCars[0].Id,
            Salon__c = testSalons[0].Id,
        	Offer_type__c = 'Physical');
        
        update testCars;
        
        Test.startTest();
        Database.SaveResult testResult = Database.insert(newOffer, false);
        Test.stopTest();
        
        	System.assert(testResult.isSuccess());
        	System.assertEquals(Utils.VEHICLE_IS_ALREADY_AVAILABLE_PHYSICALLY, 'Vehicle is already available physically');
    }
}