import { LightningElement } from 'lwc';
import findDuplicates from '@salesforce/apex/PreventDuplicates.findDuplicates';
import createContact from '@salesforce/apex/PreventDuplicates.createContact';

export default class PreventDuplicates extends LightningElement {
    firstName;
    lastName;
    email;
    mobile;
    duplicateContact;
    createdContact;

    handleChange(event) {   
        this[event.target.name] = event.target.value;
    }

    handleClick() {
        findDuplicates({ email: this.email })
            .then(data => {
                this.duplicateContact = data;
                if (this.duplicateContact.length === 0) {
                    createContact({
                        fName: this.firstName,
                        lName: this.lastName,
                        email: this.email,
                        phone: this.mobile
                    })
                    .then(result => {
                        this.createdContact = result;
                        console.log('Contact created:', this.createdContact);
                    })
                    .catch(error => {
                        console.log('Error creating contact:', error);
                    });
                } else {
                    console.log('Duplicate contact found');
                }
            })
            .catch(error => {
                console.log('Error checking duplicates:', error);
            });
    }
}
