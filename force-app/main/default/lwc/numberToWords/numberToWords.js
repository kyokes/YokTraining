import { LightningElement } from 'lwc';
import NumberToWordsController from '@salesforce/apex/NumberToWordsController.convertNumberIntoWords'

export default class NumberToWords extends LightningElement 
{

    valueEntered;
    convertedValue;

    handleChange(event)
    {
        this.valueEntered=event.target.value;
    }
    handleClick()
    {
        NumberToWordsController({enteredNumber:this.valueEntered})
        .then(result=>
            {
                this.convertedValue=result;
                console.log(this.convertedValue);
            })
        .catch(error=>
            {
                console.log(error);
            })    
    }
}