import { LightningElement , wire } from 'lwc';
import returnTenContacts from '@salesforce/apex/EmployeeMasterPage.returnTenContacts';

export default class EmployeeMasterPage extends LightningElement {

 contactList ;
connectedCallback(){
  returnTenContacts()
    .then(data =>{
         console.log(data);
this.contactList=data;
         })
     .catch(error =>{
         console.log(error);
     })
  }

//  @wire(returnTenContacts)
//  wiredContacts({ error, data }) {
//      if (data) {
//          this.contactList = data;
//          console.log(this.contactList);
//         //  this.error = undefined;
//      } else if (error) {
//         //  this.error = error;
//          this.contactList = undefined;
//          console.log(error);
//      }
//  }    

// get returnTenContacts() {
//     returnTenContacts()
//    .then(data =>{
//     this.contactList=data;
//          console.log( this.contactList);
//          })
//      .catch(error =>{
//          console.log(error);
//              })

// }
get fetchListOfContacts(){
    return this.contactList;
}

}