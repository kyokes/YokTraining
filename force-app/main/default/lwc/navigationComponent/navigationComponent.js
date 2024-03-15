import { LightningElement,wire  } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

export default class NavigationComponent extends NavigationMixin(LightningElement) 
{
    recordTypeId;
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfo({error,data})
    {
        if(data)
        {
            console.log(data.recordTypeInfos);

            for(let x in data.recordTypeInfos)
            {
                if(data.recordTypeInfos[x].name==='Business Customers')
                {
                    this.recordTypeId = x;
                }
            }
        }
        else{
            console.log(error);
        }
    }

    handleClick()
    {
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'home'
            }
        });
    }
    navigateToNewContact() 
    {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
            state: {
                recordTypeId : this.recordTypeId
            }
        });
    }
    navigateToNewContactWithDefaults()
    {
        const defaultValues = encodeDefaultFieldValues({
            FirstName: 'Morag',
            LastName: 'de Fault',
            LeadSource: 'Other'
        });
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }
} 