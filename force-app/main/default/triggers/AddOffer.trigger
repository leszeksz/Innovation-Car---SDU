/**
 * @author Leszek Szczotka
 * @date 12/01/2022
 * @description Trigger class to add offer.
 */
trigger AddOffer on Offer__c(before insert, before update, after insert) {
  if (Trigger.isBefore) {
    AddNewOfferHandler.checkAvailabilityCar(Trigger.New);
  }
  if (Trigger.isAfter && Trigger.isInsert) {
    List<Id> offers = new List<Id>();
    for (Offer__c record : Trigger.new) {
      offers.add(record.Id);
    }
    SendEmailToDirector.sendEmail(offers);
  }

}
