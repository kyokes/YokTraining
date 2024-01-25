import { LightningElement,api,wire } from 'lwc';
import getAccountDetails from '@salesforce/apex/ComponentParent.getAccountDetails';
export default class ComponentChild extends LightningElement 
{
    @api
    accountId;
    accountInformation;
    accountName;
    renderedCallback()
    {
        getAccountDetails({accountId:'$accountId'})
        .then(data =>{
            console.log(data);
            this.accountInformation = data;
        })
        .catch(error =>{
            console.log(error);
        })
    }
    // @wire(getAccountDetails,{accountId:'$accountId'})
    // accountDetails({error,data})
    // {
    //     if(data)
    //     {
    //         this.accountInformation = data;
    //         console.log(this.accountInformation);
    //         this.error = undefined;
    //     }
    //     else if(error)
    //     {
    //         this.error = error;
    //         this.accountInformation = undefined;
    //         console.log(error);
    //     }
    // }

    handleChange(event)
    {
        this.accountName = event.target.name;
        console.log(this.accountName);
    }

    handleClick(event)
    {
        this.dispatchEvent(new CustomEvent('valuechange',{
            detail : {changedName : this.accountName}
        }));
    }
}