import { LightningElement, api, wire,track } from 'lwc';
import getNews from '@salesforce/apex/AccountNewsComponent.getNews';

export default class AccountNewsComponent extends LightningElement 
{
    @api recordId;
    @track accountNewsList;

    @wire(getNews, {accId: '$recordId'}) 
    WireContactRecords({error, data})
    {
        if(data){
            this.accountNewsList = data;
            console.log(this.accountNewsList);
            this.error = undefined;
        }else{
            this.error = error;
            this.accountNewsList = undefined;
        }
    }
    
}
