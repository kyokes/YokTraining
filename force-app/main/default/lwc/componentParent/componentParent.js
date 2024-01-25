import { LightningElement,wire } from 'lwc';
import getAccount from '@salesforce/apex/ComponentParent.getAccount';
export default class ComponentParent extends LightningElement 
{
    accountList;
    accountId;
    changedName;

    @wire(getAccount)
    tenAccounts({error,data})
    {
        if(data)
        {
            this.accountList = data;
            console.log(this.accountList);
        }
        else
        {
            console.log(error);
        }
    }
    handleClick(event)
    {
        this.accountId = event.target.name;
        console.log(this.accountId);

    }

    handleValueChange(event)
    {
        this.changedName = event.detail.changedName;
    }
}