/**
 * @author Leszek Szczotka
 * @date 12/01/2022
 * @description Trigger class to remove offer with telemetry.
 */
trigger removeVehicle on Vehicle__c (before delete) {
    if(trigger.isDelete){
        deleteVehicle.removeTelemetry(Trigger.Old);
    }
}