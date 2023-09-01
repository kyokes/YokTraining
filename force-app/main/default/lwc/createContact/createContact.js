import { LightningElement, track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createContact from '@salesforce/apex/ContactController.createContactRecord';
import doesContactExist from '@salesforce/apex/ContactController.doesContactExist';

export default class CreateContact extends LightningElement 
{
    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track phone = '';

    handleFirstNameChange(event) 
    {
        this.firstName = event.target.value;
    }

    handleLastNameChange(event) 
    {
        this.lastName = event.target.value;
    }

    handleEmailChange(event) 
    {
        this.email = event.target.value;
    }

    handlePhoneChange(event) 
    {
        this.phone = event.target.value;
    }

    createContact() 
    {
        // Check if the contact with the given email already exists
        doesContactExist({ email: this.email })
            .then(result => {
                if (result) 
                {
                    // Show an error toast if contact already exists
                    this.showToast('Error', 'Contact with this email already exists.', 'error');
                } 
                else 
                {
                    // Create the contact
                    createContact({ 
                        firstName: this.firstName,
                        lastName: this.lastName,
                        email: this.email,
                        phone: this.phone 
                    })
                    .then(() => {
                        // Show a success toast
                        this.showToast('Success', 'Contact created successfully.', 'success');
                        // Reset input fields
                        this.resetFields();
                    })
                    .catch(error => {
                        // Show an error toast if contact creation fails
                        this.showToast('Error', 'Contact creation failed.', 'error');
                        console.error(error);
                    });
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    showToast(title, message, variant) 
    {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(toastEvent);
    }

    resetFields() 
    {
        this.firstName = '';
        this.lastName = '';
        this.email = '';
        this.phone = '';
    }
}
