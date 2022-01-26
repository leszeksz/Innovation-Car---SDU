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
    List<Telemetry__c> testTelemetry = TestsUtils.inCreateTestTelemetry(200);
    Id testVehicleId = testTelemetry.get(0).Vehicle__c;

    List<Telemetry__c> telemetryBefore = [
      SELECT Id
      FROM Telemetry__c
      WHERE Vehicle__c = :testVehicleId
    ];

    Test.startTest();
    Database.DeleteResult testResult = database.delete(testVehicleId, true);
    Test.stopTest();

    List<Telemetry__c> telemetryAfter = [
      SELECT Id
      FROM Telemetry__c
      WHERE Vehicle__c = :testVehicleId
    ];

    System.assert(testResult.isSuccess());
    System.assert(telemetryBefore.size() == 200);
    System.assert(telemetryAfter.size() == 0);
  }
}
