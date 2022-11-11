public with sharing class ClimateHelper {
    private final static Map<String, String> decoder = new Map<String, String>{}
    public static Map<String, Object> getClimateDataHourly(String lat, String lon, String param) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.open-meteo.com/v1/forecast?latitude=' + lat + '&longitude=' + lon + '&hourly=' + param);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
            return results;
        }
        return null;
    }   
    public static List<ClimateUtils.HourlyClimate> getHourlyClimateValues(Map<String, Object> hourlyData, String param) {
        Map<String, Object> hourly = (Map<String,Object>) hourlyData.get('hourly');
        System.debug(hourly);
        List<Object> t = (List<Object>) hourly.get('time');
        System.debug(t);
        List<Object> temp_2m = (List<Object>) hourly.get('temperature_2m');
        List<ClimateUtils.HourlyClimate> results = new List<ClimateUtils.HourlyClimate>();
        for(Integer i = 0; i < t.size(); i++) results.add(new ClimateUtils.HourlyClimate((String) t[i], (Double) temp_2m[i]));
        return results;
    }
}
