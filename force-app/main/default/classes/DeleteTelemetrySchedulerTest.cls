/**
 * @author Leszek Szczotka
 * @date 18/01/2022
 * @description Class created to test posibility to delete old telemetry scheduler.
 */
@isTest
public class DeleteTelemetrySchedulerTest {
  /**
   * @author Leszek Szczotka
   * @date 18.01.2022
   * @description test method removing old telemetry with scheduler
   */
  @isTest
  static void startScheduler() {
    Test.startTest();
    DeleteTelemetryScheduler scheduler = new DeleteTelemetryScheduler();
    system.schedule(Utils.JOB_NAME, Utils.CRON_EXP, scheduler);
    Test.stopTest();
  }
}
