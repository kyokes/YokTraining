import { LightningElement,api,wire } from 'lwc';
import getContact from '@salesforce/apex/ContactDetailComponent.getContact';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ContactDetailComponent extends LightningElement 
{
    @api
    contactId;
    // currentContactId;
    currentContactData;

    @wire(getContact,{conId:'$contactId'})
    
    getCurrentContact({error,data})
    {
        if (data) 
        {
            this.currentContactData = data;
            console.log(this.currentContactData);
            this.error = undefined;
        } 
        else if (error) 
        {
            this.error = error;
            this.currentContactData = undefined;
            console.log(error);
        }
    }

    handleClick(event)
    {
        const evt = new ShowToastEvent({ title: "Success",
                                         message: "Record Successfully Saved",
                                         variant: "Success",});    
        this.dispatchEvent(evt);
        this.dispatchEvent(new CustomEvent('recordsave',{
            detail:{userName : userName}
        })); 
    }

    handleChange(event)
    {
        this[event.target.name] = event.target.value;
        console.log(this[event.target.name]);
    }
}