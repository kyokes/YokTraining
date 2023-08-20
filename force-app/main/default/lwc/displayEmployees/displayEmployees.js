import { LightningElement } from 'lwc';
import createContact from '@salesforce/apex/DisplayEmployees.createContact';

export default class DisplayEmployees extends LightningElement {


    firstName;
    lastName;
    email;
    phone;
    accountId;
    contactId;

    connectedCallback()
    {
        console.log("Yokesh");
        console.log(this.firstName);
        console.log(this.lastName);
        console.log(this.email);
        console.log(this.phone);
    }
    onFormDataChange(event)
    {   
        this[event.target.name]=event.target.value;
    }
    // onChangeOfFirstName(event)
    // {
    //     this.firstName=event.target.value;
    // }
    // onChangeOfLastName(event)
    // {
    //     this.lastName=event.target.value;
    // }
    // onChangeOfEmail(event)
    // {
    //     this.email=event.target.value;
    // }
    // onChangeOfPhone(event)
    // {
    //     this.phone=event.target.value;
    // }
    handleClick()
    {
        console.log(this.firstName);
        console.log(this.lastName);
        console.log(this.email);
        console.log(this.phone);
        //console.log(this.accountId);
        // createAccount({ Name:this.accountName})
        // .then(data=>{
        //     console.log(data.Id)
        //     this.accountId=data.Id});
        // .catch(error=>{
        //     console.log(error);
        // })
        createContact({fName:this.firstName, lName:this.lastName, email:this.email, phone:this.phone})//accountId:this.accountId
        .then(data=>{
            console.log(data)
            this.contactId=data.Id;
            })
        .catch(error=>{
            console.log(error);
        })
    }
}