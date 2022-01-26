/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class created to test possibility of adding only one phisycal offer to one salon.
 */
@isTest
public class AddNewOfferTest {
  /**
   * @author Leszek Szczotka
   * @date 13.01.2022
   * @description test method checking getting error when physical offer is already in one salon
   */
  @isTest
  static void getErrorWhenALreadyIsPhysicalOffer() {
    List<Vehicle__c> testCars = TestsUtils.inCreateTestCars(200);
    List<Salon__c> testSalons = TestsUtils.inCreateTestSalon(1);
    List<Offer__c> testPhysicalOffers = TestsUtils.inCreateTestPhysicalOffer(
      200
    );

    for (Integer i = 0; i < 200; i++) {
      testCars[i].Salon__c = testSalons[0].Id;
    }

    Test.startTest();
    Database.SaveResult[] testResults = Database.update(testCars, false);
    Test.stopTest();

    for (Database.SaveResult result : testResults) {
      System.assert(!result.isSuccess());
      System.assert(result.getErrors().size() > 0);
      System.assertEquals(
        Utils.VEHICLE_IS_ALREADY_AVAILABLE_PHYSICALLY,
        result.getErrors()[0].getMessage()
      );
    }
  }
  /**
   * @author Leszek Szczotka
   * @date 13.01.2022
   * @description test method checking not adding second physical offer to one salon
   */
  @isTest
  static void AddCarToSalon() {
    List<Vehicle__c> testCars = TestsUtils.inCreateTestCars(200);
    List<Salon__c> testSalons = TestsUtils.inCreateTestSalon(1);

    for (Integer i = 0; i < 200; i++) {
      testCars[i].Salon__c = testSalons[0].Id;
    }

    Offer__c newOffer1 = new Offer__c(
      Vehicle__c = testCars[0].Id,
      Salon__c = testSalons[0].Id,
      Offer_type__c = Utils.PHYSICAL_OFFER
    );
    insert newOffer1;

    Test.startTest();
    Offer__c newOffer2 = new Offer__c(
      Vehicle__c = testCars[0].Id,
      Salon__c = testSalons[0].Id,
      Offer_type__c = Utils.PHYSICAL_OFFER
    );
    Database.SaveResult testResult = Database.insert(newOffer2, false);
    Test.stopTest();

    System.assert(!testResult.isSuccess());
  }

  /**
   * @author Leszek Szczotka
   * @date 17.01.2022
   * @description test method checking success adding an offer to the salon
   */
  @isTest
  static void AddCarToSalonSuccess() {
    List<Vehicle__c> testCars2 = TestsUtils.inCreateTestCars(200);
    List<Salon__c> testSalons2 = TestsUtils.inCreateTestSalon(1);

    for (Integer i = 0; i < 200; i++) {
      testCars2[i].Salon__c = testSalons2[0].Id;
    }

    Offer__c newOffer1 = new Offer__c(
      Vehicle__c = testCars2[0].Id,
      Salon__c = testSalons2[0].Id,
      Offer_type__c = Utils.PHYSICAL_OFFER
    );
    insert newOffer1;

    Test.startTest();
    Offer__c newOffer3 = new Offer__c(
      Vehicle__c = testCars2[0].Id,
      Salon__c = testSalons2[0].Id,
      Offer_type__c = Utils.VIRTUAL_OFFER
    );
    Database.SaveResult testResult2 = Database.insert(newOffer3, true);
    Test.stopTest();

    System.assert(testResult2.isSuccess());
  }
}
