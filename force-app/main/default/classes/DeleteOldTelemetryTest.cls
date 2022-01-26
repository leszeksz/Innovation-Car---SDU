/**
 * @author Leszek Szczotka
 * @date 18/01/2022
 * @description Class created to test possibility of deleting old telemetries.
 */
@isTest
public class DeleteOldTelemetryTest {
  /**
   * @author Leszek Szczotka
   * @date 18.01.2022
   * @description test method removing old telemetry
   */
  @isTest
  static void deleteTelemetryTest() {
    Vehicle__c testVehicle = TestsUtils.inCreateTestCars(200)[0];
    date oldTelemetry = system.Date.today() - 90;

    Telemetry__c testTelemetry = TestsUtils.inCreateTestTelemetry(1)[0];
    testTelemetry.Vehicle__c = testVehicle.Id;
    update testTelemetry;
    Test.setCreatedDate(testTelemetry.Id, oldTelemetry);

    List<Telemetry__c> telemetryBeforeDelete = [SELECT Id FROM Telemetry__c];

    Test.startTest();
    DeleteOldTelemetry execute = new DeleteOldTelemetry();
    Database.executeBatch(execute);
    Test.stopTest();

    List<Telemetry__c> telemetryAfterDelete = [SELECT Id FROM Telemetry__c];
    System.assert(telemetryAfterDelete.size() == 0);
  }
}
