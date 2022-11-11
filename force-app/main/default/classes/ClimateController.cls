public with sharing class ClimateController {
    @AuraEnabled(cacheable=true)
    public static List<ClimateUtils.HourlyClimate> getHourlyClimateValues(){
        try {
            Map<String, Object> results = ClimateHelper.getClimateDataHourly('52.52', '13.41', 'temperature_2m');
            return ClimateHelper.getHourlyclimateValues(results, 'temp_2m');
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
