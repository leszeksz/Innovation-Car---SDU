/**
 * @author Leszek Szczotka
 * @date 18/01/2022
 * @description Class responsible for deleting old telemetries
 */
public class DeleteOldTelemetry implements Database.Batchable<sObject> {
  public Database.QueryLocator start(Database.BatchableContext bt) {
    date oldTelemetry = system.Date.today() - 90;
    return Database.getQueryLocator(Utils.GET_QUERY_LOCATOR);
  }
  public void execute(Database.BatchableContext bt, List<sObject> records) {
    delete records;
  }
  public void finish(Database.BatchableContext bt) {
    System.debug(LoggingLevel.INFO, Utils.DELETE_OLD_TELEMETRY_MESSAGE);
  }
}
