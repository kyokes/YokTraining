import { LightningElement, track } from 'lwc';
import getProperty from '@salesforce/apex/PropertyFinder.getProperty';
import findProperty from '@salesforce/apex/PropertyFinder.findProperty';

// const columns = [
//     { label: 'Property Name', fieldName: 'Name' },
//     { label: 'Property Type', fieldName: 'City_Props__Property_Type__c', type: 'picklist' },
//     { label: 'Unit Name', fieldName: 'Name', type: 'text' },
//     { label: 'Unit Type', fieldName: 'City_Props__Unit_Type__c', type: 'text' }, 
//     { label: 'Status', fieldName: 'City_Props__Status__c', type: 'text' }, 
//     { label: 'Active', fieldName: 'City_Props__Active__c', type: 'checkbox' }, 
//     { label: 'Saleable', fieldName: 'City_Props__Saleable__c', type: 'checkbox' }, 
// ];
const columns = [
    { label: 'Property', fieldName: 'Name' },
    { label: 'Property Type', fieldName: 'City_Props__Property_Type__c', type: 'text' },
    { label: 'Unit Short Code', fieldName: 'City_Props__Unit_Short_Code__c', type: 'text' },
    { label: 'Unit Type', fieldName: 'City_Props__Unit_Type__c', type: 'text' },
    { label: 'Property Status', fieldName: 'City_Props__Status__c', type: 'text' },
    { label: 'Sub Project Status', fieldName: 'Sub_Project_Status__c', type: 'text' },
    { label: 'Building Type', fieldName: 'City_Props__Building_Type__c', type: 'text' },
    { label: 'Building Short Code', fieldName: 'City_Props__Building_short_code__c', type: 'text' },
    // Add other fields from the related lists as needed
];


export default class PropertyFinderComponent extends LightningElement 
{
    
    @track selectedProperty = '';
    @track selectedPropertyType = '';
    @track propertyOptions = [];
    @track propertyType = [];
    @track propertyFind ;
    columns = columns;
    
    connectedCallback() 
    {
        getProperty()
            .then(data => {
                this.propertyOptions = data.map(item => ({
                    label: item.Name,
                    value: item.Id
                }));
                this.propertyType = data.map(item => ({
                    label: item.City_Props__Property_Type__c,
                    value: item.City_Props__Property_Type__c
                }));
            })
            .catch(error => {
                console.error(error);
            });
    }

    handleChange(event) 
    {
        this[event.target.name] =  event.detail.value;
        console.log(this[event.target.name]);

        this.selectedProperty = event.detail.value;
        console.log(this.selectedProperty);
        // this.selectedPropertyType = event.detail.value;
        // console.log(this.selectedPropertyType);
    }
    handleClick(event)
    {
    //     findProperty({ propertyId: this.selectedProperty })
    //     .then(data => {
    //         const mappedData = data.map(item => ({
    //         Id: item.Id,
    //         Name: item.Name,
    //         City_Props__Property_Type__c: item.City_Props__Property_Type__c,
    //         // City_Props__Unit_Short_Code__c: item.City_Props__Properties__r[0] ? item.City_Props__Properties__r[0].City_Props__Unit_Short_Code__c : null,
    //         // City_Props__Unit_Type__c: item.City_Props__Properties__r[0] ? item.City_Props__Properties__r[0].City_Props__Unit_Type__c : null,
    //         // City_Props__Status__c: item.City_Props__Properties__r[0] ? item.City_Props__Properties__r[0].City_Props__Status__c : null,
    //         // City_Props__Active__c: item.City_Props__Properties__r[0] ? item.City_Props__Properties__r[0].City_Props__Active__c : null,
    //         // City_Props__Saleable__c: item.City_Props__Properties__r[0] ? item.City_Props__Properties__r[0].City_Props__Saleable__c : null,
    //         City_Props__Unit_Short_Code__c: item.City_Props__Properties__r.map(subItem => subItem.City_Props__Unit_Short_Code__c).join(', '), 
    //         City_Props__Unit_Type__c: item.City_Props__Properties__r.map(subItem => subItem.City_Props__Unit_Type__c).join(', '), 
    //         City_Props__Status__c: item.City_Props__Properties__r.map(subItem => subItem.City_Props__Status__c).join(', '), 
    //     }));

    //     this.propertyFind = mappedData;
    // })
    // .catch(error => {
    //     console.log(error);
    // });
    // 
    findProperty({ propertyId: this.selectedProperty })
    .then(data => {
        const mappedData = [];

        data.forEach(item => {
            item.City_Props__Properties__r.forEach(subItem => {
                const row = {
                    Id: item.Id,
                    Name: item.Name,
                    City_Props__Property_Type__c: item.City_Props__Property_Type__c,
                    City_Props__Unit_Short_Code__c: subItem.City_Props__Unit_Short_Code__c,
                    City_Props__Unit_Type__c: subItem.City_Props__Unit_Type__c,
                    City_Props__Status__c: subItem.City_Props__Status__c,
                };

                item.City_Props__Sub_Projects__r.forEach(subProject => {
                    const newRow = { ...row };
                    newRow.Sub_Project_Status__c = subProject.City_Props__Status__c;
                    newRow.City_Props__Building_Type__c = subProject.City_Props__Building_Type__c;
                    newRow.City_Props__Building_short_code__c = subProject.City_Props__Building_short_code__c;

                    mappedData.push(newRow);
                });

                mappedData.push(row);
            });
        });

        this.propertyFind = mappedData;
    })
    .catch(error => {
        console.log(error);
    });


    }
}
