import { LightningElement } from 'lwc';
import convertCelsiusToFahrenheit from '@salesforce/apex/TemperatureConversion.convertCelsiusToFahrenheit';
import convertFahrenheitToCelsius from '@salesforce/apex/TemperatureConversion.convertFahrenheitToCelsius';

export default class TemperatureConversion extends LightningElement 
{
    toggleEvent;
    inputValue;
    result;

    handleInputChange(event)
    {
        this.inputValue = event.target.value;
    }

    handleToggle(event)
    {   
        if(event.target.checked=true)
        {
            convertFahrenheitToCelsius({degreeValue:this.inputValue})
            .then(data=>{
                this.result=data;
            })
            .catch(error=>
                {
                    console.log(error);
                })
        }
        else
        {
            convertCelsiusToFahrenheit({degreeValue:this.inputValue})
            .then(data=>{
                this.result=data;
            })
            .catch(error=>
                {
                    console.log(error);
                })
        }
    }
}