/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class created to test possibility of deleting telemetry together with a vehicle.
 */
@isTest
public class removeTelemetryTest {
  /**
   * @author Leszek Szczotka
   * @date 13.01.2022
   * @description test method removing telemetry with a vehicle
   */
  @isTest
  static void deleteTelemetryWithCar() {
    Vehicle__c testVehicle = TestsUtils.inCreateTestCars(1)[0];

    Telemetry__c testTelemetry = TestsUtils.inCreateTestTelemetry(1)[0];
    testTelemetry.Vehicle__c = testVehicle.Id;
    update testTelemetry;

    List<Telemetry__c> telemetryBefore = [
      SELECT Id
      FROM Telemetry__c
      WHERE Vehicle__c = :testVehicle.Id
    ];

    Test.startTest();
    Database.DeleteResult testResult = database.delete(testVehicle, true);
    Test.stopTest();

    List<Telemetry__c> telemetryAfter = [
      SELECT Id
      FROM Telemetry__c
      WHERE Vehicle__c = :testVehicle.Id
    ];

    System.assert(testResult.isSuccess());
    System.assert(telemetryBefore.size() == 1);
    System.assert(telemetryAfter.size() == 0);
  }
}
