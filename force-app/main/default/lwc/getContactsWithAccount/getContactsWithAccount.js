import { LightningElement,wire } from 'lwc';
import getRelatedContacts from '@salesforce/apex/GetContactsWithAccount.getRelatedContacts'

export default class GetContactsWithAccount extends LightningElement 
{
    accountAndContactList;

    @wire(getRelatedContacts)
relatedContactsWithAccount({ error, data }) {
      if (data) {
          this.accountAndContactList = data;
          console.log(this.accountAndContactList);
           this.error = undefined;
      } else if (error) {
           this.error = error;
          this.accountAndContactList = undefined;
          console.log(error);
      }
  }     
}