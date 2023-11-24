import { LightningElement,wire,api } from 'lwc';
import getAccounts from '@salesforce/apex/AccountComponent.getAccounts'
export default class AccountComponent extends LightningElement 
{
    accountList;
    @api 
    accountId;

    @wire(getAccounts)
    relatedContactsWithAccount({ error, data }) 
    {
        if (data) 
        {
            this.accountList = data;
            console.log(this.accountList);
            this.error = undefined;
        } 
        else if (error) 
        {
            this.error = error;
            this.accountList = undefined;
            console.log(error);
        }
    }

    handleClick(event)
    {
        this.accountId=event.target.name;
        console.log(this.accountId);
        console.log(event.target.dataset.website);
    }
}