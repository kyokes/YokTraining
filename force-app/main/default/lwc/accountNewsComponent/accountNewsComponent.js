import { LightningElement, api, wire,track } from 'lwc';
import getNews from '@salesforce/apex/AccountNewsComponent.getNews';

export default class AccountNewsComponent extends LightningElement 
{
    @api recordId;
    @track accountNewsList;
    @track showMoreDescription = false;

    @wire(getNews, {accId: '$recordId'}) 
    WireContactRecords({error, data})
    {
        if(data){
            this.accountNewsList = data.map(item=>
                {
                    return{
                        ...item,
                        truncatedDescription: this.handleDescription(item.text)
                    };
                });
            console.log(this.accountNewsList);
            this.error = undefined;
        }else{
            this.error = error;
            this.accountNewsList = undefined;
        }
    }
    handleDescription(description)
    {
        return description.length > 300 ? `${description.slice(0,300)}...` :description;
    }
    handleShowMore()
    {
        this.showMoreDescription=true;
    }
}
