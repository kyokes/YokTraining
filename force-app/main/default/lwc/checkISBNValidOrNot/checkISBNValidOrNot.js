import { LightningElement } from 'lwc';
import checkValidOrNot from '@salesforce/apex/CheckISBNValidOrNot.checkValidOrNot';

export default class CheckISBNValidOrNot extends LightningElement 
{
    receivedNumber;
    validatedResult;
    checkBoxTrue=false;

    handleChange(event)
    {
        this.receivedNumber=event.target.value;
        console.log(this.receivedNumber);
    }

    handleClick()
    {
        checkValidOrNot({ISBNNumber:this.receivedNumber})
        .then(result=>
            {
                this.validatedResult=result;
                if(this.validatedResult==true)
                {
                    this.checkBoxTrue=true;
                }
                console.log(this.validatedResult);
            })
        .catch(error=>
            {
                console.log(error);
            })    
    }
}