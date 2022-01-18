/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class created to implement Schedulable.
 */
public class DeleteTelemetryScheduler implements Schedulable {
  public void execute(SchedulableContext ctx) {
    DeleteOldTelemetry deleteOldTelemetry = new DeleteOldTelemetry();
    database.executeBatch(deleteOldTelemetry);
  }
}
