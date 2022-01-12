/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class responsible for checking that offer is already available physicaly.
 */
public class AddNewOfferHandler {
    
    public static void checkAvailabilityCar(List<Offer__c> newOffers) {
        List<Offer__c> physicalOffers = new List<Offer__c>();

        for (Offer__c offer : newOffers) {
            if (offer.Offer_Type__c == Utils.PHYSICAL_OFFER){
                physicalOffers.add(offer);
            }
        }

        Set<Id> vehicles = new Set<Id>();
        
        for (Offer__c offer : physicalOffers){
            vehicles.add(offer.Vehicle__c);
        }

        Map<Id, String> vehiclesWithPhysicalOffers = new Map<Id, String>();
        
        List<Offer__c> allPhysicalOffers = [SELECT Vehicle__c, Salon__c FROM Offer__c WHERE Offer_Type__c = :Utils.PHYSICAL_OFFER AND Vehicle__c IN :vehicles];

        for (Offer__c offer : allPhysicalOffers){
            vehiclesWithPhysicalOffers.put(offer.Vehicle__c, offer.Salon__c);
        }

        for (Offer__c offer : physicalOffers){
            if (vehiclesWithPhysicalOffers.containsKey(offer.Vehicle__c)){
                offer.addError(Utils.VEHICLE_IS_ALREADY_AVAILABLE_PHYSICALLY);
            }
        }
    }
}