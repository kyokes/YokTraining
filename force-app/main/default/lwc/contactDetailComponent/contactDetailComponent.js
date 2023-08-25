import { LightningElement,api,wire } from 'lwc';
import getContact from '@salesforce/apex/ContactDetailComponent.getContact'
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
        
    }
}