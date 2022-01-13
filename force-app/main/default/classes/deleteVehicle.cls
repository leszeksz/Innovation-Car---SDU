/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class responsible for deleting telemetry when vehicle had been removed.
 */
public class deleteVehicle {
    /**
        * @author Leszek Szczotka
        * @date 13.01.2022
        * @description method removing telemetry when vehicle had been removed 
        * @param inRemovedCars list of vehicle objects to check
        */    
        public static void removeTelemetry(List<Vehicle__c> inRemovedCars){
            if(inRemovedCars != null && inRemovedCars.size() > 0){
            List<Telemetry__c> removedTelemetry = [SELECT Id FROM Telemetry__c WHERE Vehicle__c IN :inRemovedCars];
                delete removedTelemetry;
            }
        }
    }