/**
 * @author Leszek Szczotka
 * @date 12/01/2022
 * @description Trigger class to add offer.
 */
trigger AddOffer on Offer__c (before insert) {
    if(trigger.isBefore){
        AddNewOfferHandler.checkAvailabilityCar(Trigger.New);
    }

}