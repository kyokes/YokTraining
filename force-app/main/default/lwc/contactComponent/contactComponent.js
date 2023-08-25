import { LightningElement,api,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactComponent.getContacts';
export default class ContactComponent extends LightningElement 
{
    @api
    accountId;
    contactId;   
    contactList;
    // contactAccountId;

    @wire(getContacts,{ accId : '$accountId'})
    getContacts({error,data})
    {
        if (data) 
        {
            this.contactList = data;
            console.log(this.contactList);
            this.error = undefined;
        } 
        else if (error) 
        {
            this.error = error;
            this.contactList = undefined;
            console.log(error);
        }
    }

    handleClick(event)
    {
        this.contactId = event.target.name;
        console.log(this.contactId);
    }

}