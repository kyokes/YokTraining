import { LightningElement, api, wire,track } from 'lwc';
import getNews from '@salesforce/apex/AccountNewsComponent.getNews';

export default class AccountNewsComponent extends LightningElement 
{
    @api recordId;
    @track accountNewsList;
    // @track shortText;

    // @track showFullText = false;
    // @track showReadMore = true;

    // connectedCallback()
    // {
    //     this.shortText = this.accountNewsList.text.slice(0,400);
    // }

    // showFullContent() 
    // {
    //     this.showFullText = true;
    //     this.showReadMore = false;
    // }

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
