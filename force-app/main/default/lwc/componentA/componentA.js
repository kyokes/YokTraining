import { LightningElement } from 'lwc';

export default class ComponentA extends LightningElement 
{
    messageFromChild;
    valueChangeHandler(event)
    {
        this.messageFromChild = event.detail.messageToParentComponent;
    }
}