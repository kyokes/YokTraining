import { LightningElement } from 'lwc';
import additionOfTwoNumbers from '@salesforce/apex/CalculatorUsingSOAP.additionOfTwoNumbers';
import subractionOfTwoNumbers from '@salesforce/apex/CalculatorUsingSOAP.subractionOfTwoNumbers';
import multiplicationOfTwoNumbers from '@salesforce/apex/CalculatorUsingSOAP.multiplicationOfTwoNumbers';
import divisionOfTwoNumbers from '@salesforce/apex/CalculatorUsingSOAP.divisionOfTwoNumbers';

export default class CalculatorUsingSOAP extends LightningElement 
{
    inputNumber1;
    inputNumber2;
    result;

    handleChange(event)
    {
        this[event.target.name]=event.target.value;
    }

    handleAddition()
    {
        additionOfTwoNumbers({input1:this.inputNumber1,input2:this.inputNumber2})
        .then(data=>
            {
                this.result=data;
            })
        .catch(error=>{
            console.log(error);
        })     
    }
    handleSubraction()
    {
        subractionOfTwoNumbers({input1:this.inputNumber1,input2:this.inputNumber2})
        .then(data=>
            {
                this.result=data;
            })
        .catch(error=>{
            console.log(error);
        })     
    }
    handleMultiplication()
    {
        multiplicationOfTwoNumbers({input1:this.inputNumber1,input2:this.inputNumber2})
        .then(data=>
            {
                this.result=data;
            })
        .catch(error=>{
            console.log(error);
        })     
    }
    handleDivision()
    {
        divisionOfTwoNumbers({input1:this.inputNumber1,input2:this.inputNumber2})
        .then(data=>
            {
                this.result=data;
            })
        .catch(error=>{
            console.log(error);
        })     
    }
}