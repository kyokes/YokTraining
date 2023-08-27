import { LightningElement } from 'lwc';
import findDuplicates from '@salesforce/apex/PreventDuplicates.findDuplicates'
export default class PreventDuplicates extends LightningElement 
{
    firstName;
    lastName;
    email;
    mobile;
    duplicateContact;

    handleChange(event)
    {
        this[event.target.name]=event.target.value;
    }

    handleClick()
    {
        findDuplicates({email:this.email})
        .then(data=>{
            this.duplicateContact=data;
            console.log(this.duplicateContact);
        })
        .catch(error=>
            {
                console.log(error);
            })
    }
}