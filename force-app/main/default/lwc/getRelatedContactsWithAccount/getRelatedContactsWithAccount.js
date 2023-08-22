import { LightningElement, api } from 'lwc';

export default class GetRelatedContactsWithAccount extends LightningElement {


    @api
    accountName;
    @api
    contactName;
    @api
    email;
    @api
    phone;
}