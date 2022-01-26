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
   * @description test method checking when no more salons are available
   */
  @isTest
  static void TestAddSalonOfferWhereNoSalon() {
    List<Vehicle__c> vehicles = TestsUtils.inCreateTestCars(200);
    List<Salon__c> salons = TestsUtils.inCreateTestSalon(1);
    List<Offer__c> offers = new List<Offer__c>();
    for (Integer i = 0; i <= 199; i++) {
      Offer__c offer = new Offer__c(
        Name = Utils.TEST_OFFER_NAME,
        Vehicle__c = vehicles[i].Id,
        Salon__c = salons[0].Id,
        Offer_type__c = Utils.PHYSICAL_OFFER
      );
      offers.add(offer);
    }
    insert offers;
    for (Integer i = 0; i < offers.size(); i++) {
      System.assertEquals(offers[i].Salon__c, salons[0].Id);
    }
  }

  /**
   * @author Leszek Szczotka
   * @date 13.01.2022
   * @description test method checking not adding second physical offer to one vehicle
   */

  @isTest
  static void TestAddPhysicalOfferWhereOfferExist() {
    List<Salon__c> salons = TestsUtils.inCreateTestSalon(2);
    List<Vehicle__c> vehicles = TestsUtils.inCreateTestCars(200);
    List<Offer__c> offers = new List<Offer__c>();
    List<Offer__c> offersDuplicate = new List<Offer__c>();
    for (Integer i = 0; i <= 199; i++) {
      Offer__c offer = new Offer__c(
        Name = Utils.TEST_OFFER_NAME,
        Vehicle__c = vehicles[i].Id,
        Salon__c = salons[0].Id,
        Offer_type__c = Utils.PHYSICAL_OFFER
      );
      offers.add(offer);
    }
    insert offers;

    for (Integer i = 0; i <= 199; i++) {
      Offer__c offer = new Offer__c(
        Name = Utils.TEST_OFFER_NAME,
        Vehicle__c = vehicles[i].Id,
        Salon__c = salons[1].Id,
        Offer_type__c = Utils.PHYSICAL_OFFER
      );
      offersDuplicate.add(offer);
    }

    Test.startTest();
    Database.SaveResult[] result = Database.insert(offersDuplicate, false);
    Test.stopTest();

    for (Integer i = 0; i < offers.size(); i++) {
      System.assert(!result[i].isSuccess());
      System.assertEquals(
        'Vehicle is already available physically',
        result[i].getErrors()[0].getMessage()
      );
    }
  }
}
