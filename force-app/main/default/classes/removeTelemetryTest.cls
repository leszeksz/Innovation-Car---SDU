/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class created to test possibility of deleting telemetry together with a vehicle.
 */
@isTest
public class removeTelemetryTest {

    @isTest static void deleteTelemetryWithCar(){
        Vehicle__c testVehicle = TestsUtils.createTestCars(1)[0];
        
        Telemetry__c testTelemetry = TestsUtils.createTestTelemetry(1)[0];
        testTelemetry.Vehicle__c = testVehicle.Id;
        update testTelemetry;
        
        Test.startTest();
        Database.DeleteResult testResult = database.delete(testVehicle, true);
        Test.stopTest();
        
        System.assert(testResult.isSuccess());
    }
}