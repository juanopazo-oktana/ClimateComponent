public with sharing class ClimateUtils {
    public class HourlyClimate {
        @AuraEnabled
        public String t {get; set;}
        @AuraEnabled
        public Double temp_2m {get; set;}

        public HourlyClimate(String t, Double temp_2m) {
            this.t = t;
            this.temp_2m = temp_2m;
        }
    }
}
