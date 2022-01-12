/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Utility class for creating objects needed in tests.
 */
public class TestsUtils {

public static List<Vehicle__c> createTestCars(Integer numberOfCars){
    List<Vehicle__c> cars = new List<Vehicle__c>();
    Vehicle__c newCar = new Vehicle__c();
    for(Integer i=0; i < numberOfCars; i++){
        newCar = new Vehicle__c(Brand__c = Utils.TESTING_VEHICAL + i, VIN__c = Utils.VIN_NUMBER, Model__c = Utils.MODEL);
        cars.add(newCar);
    }
    insert cars;
    return cars;
}

public static List<Salon__c> createTestSalon(Integer numberOfSalons){
    List<Salon__c> salons = new List<Salon__c>();
    Salon__c newSalon = new Salon__c();
    for(Integer i=0; i < numberOfSalons; i++){
        newSalon = new Salon__c(name = Utils.TESTING_SALON + i, Account__c = Utils.ACCOUNT_ID);
        salons.add(newSalon);
    }
    insert salons;
    return salons;
}

public static List<Telemetry__c> createTestTelemetry(Integer numberOfTelemetries){
    List<Vehicle__c> car = createTestCars(1);
    List<Telemetry__c> telemetry = new List<Telemetry__c>();
    for(INteger i=0; i < numberOfTelemetries; i++){
        Telemetry__c newTelemetry = new Telemetry__c(Type__c = Utils.TELEMETRY_TEMPERATURE, Vehicle__c = car[i].Id);
        telemetry.add(newTelemetry);
    }
    insert telemetry;
    return telemetry;
}
}