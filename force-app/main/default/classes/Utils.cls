/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Utility class with all strings and labels.
 */
public class Utils {
  public static final String PHYSICAL_OFFER = 'Physical';
  public static final String VIRTUAL_OFFER = 'Virtual';
  public static final String VEHICLE_IS_ALREADY_AVAILABLE_PHYSICALLY = Label.VEHICLE_IS_ALREADY_AVAILABLE_PHYSICALLY;
  public static final String TESTING_VEHICAL = 'testCar';
  public static final String TESTING_SALON = 'testSalon';
  public static final String VIN_NUMBER = '1234567890';
  public static final String MODEL = 'testModel';
  public static final String ACCOUNT = 'TestAccount';
  public static final String TELEMETRY_TEMPERATURE = 'temperature';
  public static final String GET_QUERY_LOCATOR = 'SELECT Id FROM Telemetry__c WHERE createddate <= :oldTelemetry';
  public static final String DELETE_OLD_TELEMETRY_MESSAGE = 'Old telemetries had been removed';
  public static final String JOB_NAME = 'Test startScheduler';
  public static final String CRON_EXP = '0 0 0 15 3 ? *';
  public static final String DIRECTOR_EMAIL = 'leszeszczotka0409@gmail.com';
  public static final String EMAIL_SUBJECT = 'New offers';
  public static final String EMAIL_BODY = 'New offers have appeared';
  public static final String JSON_ENDPOINT = 'https://jsonplaceholder.typicode.com/posts';
  public static final String POST = 'POST';
  public static final String STATUS_CASE_CLOSED = 'Closed';
  public static final String STATUS_CASE_FAILED = 'Failed';
  public static final String CONNECTION_ERROR_MESSAGE = 'Connection failed';
  public static final String RENOVATION_CASE = 'Renovation Case';
}
