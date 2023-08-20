import { LightningElement } from 'lwc';

export default class LwcCalculator extends LightningElement 
{
    inputNumber1 = 0;
    inputNumber2 = 0;
    answer;
    targetField;

    focusHandler(event)
    {
        this.targetField = event.target.label;
        // console.log(this.targetField);
    }
    handleInputNumber1(event)
    {
        this.inputNumber1 = event.target.value;
    }
    handleInputNumber2(event)
    {
        this.inputNumber2 = event.target.value;
    }
    handleNumber0(event)
    {
        event.target.value = 0;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber1(event)
    {
        event.target.value = 1;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
        // console.log(this.inputNumber1);
        // console.log(this.inputNumber2);
    }
    handleNumber2(event)
    {
        event.target.value = 2;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber3(event)
    {
        event.target.value = 3;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber4(event)
    {
        event.target.value = 4;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber5(event)
    {
        event.target.value = 5;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber6(event)
    {
        event.target.value = 6;
        if(this.targetField=='Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber7(event)
    {
        event.target.value = 7;
        if(this.targetField=='Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber8(event)
    {
        event.target.value = 8;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleNumber9(event)
    {
        event.target.value = 9;
        if(this.targetField == 'Enter a number 1')
        {
            this.inputNumber1 = ''+this.inputNumber1+event.target.value;
        }
        else
        {
            this.inputNumber2 = ''+this.inputNumber2+event.target.value;
        }
    }
    handleClr(event)
    {
        this.inputNumber1 = 0;
        this.inputNumber2 = 0;
        this.answer = 0;
    }
    handlePercent(event)
    {
         this.answer = parseFloat(this.inputNumber1*this.inputNumber2)/100;
    }
    handleAddition(event)
    {
        this.answer = parseInt(this.inputNumber1)+parseInt(this.inputNumber2);
    }
    handleSubraction(event)
    {
        this.answer = this.inputNumber1-this.inputNumber2;
    }
    handleMultiplication(event)
    {
        this.answer = this.inputNumber1*this.inputNumber2;
    }
    handleDivision(event)
    {
        this.answer = this.inputNumber1/this.inputNumber2;
    }
}