/**
 * @author Leszek Szczotka
 * @date 03/01/2022
 * @description Utility class for creating objects needed in tests.
 */
public class TestsUtils {
    /**
        * @author Leszek Szczotka
        * @date 13.01.2022
        * @description util method to create account
        */
        public static List<Account> inCreateTestAccount(){
            List<Account> testAccounts = [SELECT Id FROM Account WHERE Name = :Utils.ACCOUNT];
            Account testAccount = new Account(Name = Utils.ACCOUNT);
            
            testAccounts = new List<Account>{testAccount};
    
            insert testAccounts;
            return testAccounts;
    }
    /**
        * @author Leszek Szczotka
        * @date 13.01.2022
        * @description util method to create vehicle
        */
        public static List<Vehicle__c> inCreateTestCars(Integer numberOfCars){
            List<Vehicle__c> cars = new List<Vehicle__c>();
            Vehicle__c newCar = new Vehicle__c();
            for(Integer i=0; i < numberOfCars; i++){
                newCar = new Vehicle__c(Brand__c = Utils.TESTING_VEHICAL + i, VIN__c = Utils.VIN_NUMBER, Model__c = Utils.MODEL);
                cars.add(newCar);
            }
            insert cars;
            return cars;
        }
        
    /**
        * @author Leszek Szczotka
        * @date 13.01.2022
        * @description util method to create salon
        */
        public static List<Salon__c> inCreateTestSalon(Integer numberOfSalons){
            List<Salon__c> salons = new List<Salon__c>();
            List<Account> accounts = inCreateTestAccount();
            Salon__c newSalon = new Salon__c();
            for(Integer i=0; i < numberOfSalons; i++){
                newSalon = new Salon__c(name = Utils.TESTING_SALON + i, Account__c = accounts[0].Id);
                salons.add(newSalon);
            }
            insert salons;
            return salons;
        }
        
    /**
        * @author Leszek Szczotka
        * @date 13.01.2022
        * @description util method to create telemetry
        */    
        public static List<Telemetry__c> inCreateTestTelemetry(Integer numberOfTelemetries){
            List<Vehicle__c> car = inCreateTestCars(1);
            List<Telemetry__c> telemetry = new List<Telemetry__c>();
            for(Integer i=0; i < numberOfTelemetries; i++){
                Telemetry__c newTelemetry = new Telemetry__c(Type__c = Utils.TELEMETRY_TEMPERATURE, Vehicle__c = car[i].Id);
                telemetry.add(newTelemetry);
            }
            insert telemetry;
            return telemetry;
        }
    
    /**
        * @author Leszek Szczotka
        * @date 13.01.2022
        * @description util method to create physical offer
        */    
        public static List<Offer__c> inCreateTestPhysicalOffer(Integer numberOfOffers){
            List<Vehicle__c> car = inCreateTestCars(1);
            List<Salon__c> salon = inCreateTestSalon(1);
            List<Offer__c> offers = new List<Offer__c>();
            for(Integer i=0; i < numberOfOffers; i++){
                Offer__c newOffer = new Offer__c(Vehicle__c = car[0].Id, Salon__c  = salon[0].Id, Offer_type__c = Utils.PHYSICAL_OFFER);
                offers.add(newOffer);
            }
            insert offers;
            return offers;
        }
    
    }