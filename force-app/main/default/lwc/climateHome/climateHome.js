import { LightningElement, track, wire } from 'lwc';
import getHourlyClimateValues from '@salesforce/apex/ClimateController.getHourlyClimateValues';
export default class ClimateHome extends LightningElement {
    @track hourlyClimateValues;

    @wire(getHourlyClimateValues)
    wiredHourlyClimateValue({ error, data}) {
        if (data) {
            this.hourlyClimateValues = data;
            console.log(data);
        } else {
            console.error(error);
        }
    }
    
}