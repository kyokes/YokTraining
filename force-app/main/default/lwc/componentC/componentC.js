import { LightningElement } from 'lwc';

export default class ComponentC extends LightningElement 
{
    messageFromParent; 

    valueChangeHandler(event)
    {
        this.messageFromParent = event.detail.messageToParentComponent;
    }
}