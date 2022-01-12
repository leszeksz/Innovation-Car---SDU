/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Class responsible for deleting telemetry when vehicle had been removed.
 */
public class deleteVehicle {
    public static void removeTelemetry(List<Vehicle__c> removedCars){
        List<Telemetry__c> removedTelemetry = [SELECT Id FROM Telemetry__c WHERE Vehicle__c IN :removedCars];
        delete removedTelemetry;
    }
}