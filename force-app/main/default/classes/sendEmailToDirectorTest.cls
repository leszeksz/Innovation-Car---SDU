/**
 * @author Leszek Szczotka
 * @date 18/01/2022
 * @description Class created to test posibility of sending emails with offers to the director.
 */
@isTest
public class sendEmailToDirectorTest {
  /**
   * @author Leszek Szczotka
   * @date 18.01.2022
   * @description test method checking that email with offers had been send
   */
  @isTest
  static void sendEmailTest() {
    List<Vehicle__c> testVehicle = TestsUtils.inCreateTestCars(1);
    update testVehicle;
    List<Salon__c> testSalon = TestsUtils.inCreateTestSalon(1);
    update testSalon;

    List<Offer__c> testOffers = new List<Offer__c>();

    Offer__c testOffer = new Offer__c(
      Vehicle__c = testVehicle[0].Id,
      Salon__c = testSalon[0].Id,
      Offer_type__c = Utils.PHYSICAL_OFFER
    );

    testOffers.add(testOffer);

    Test.startTest();
    insert testOffers;
    Integer invocations = Limits.getFutureCalls();
    Test.stopTest();

    System.assertEquals(1, invocations);
  }
}
