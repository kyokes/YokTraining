import { LightningElement } from 'lwc';

export default class ComponentB extends LightningElement 
{
    messageToParent;
    handleChange(event)
    {
        this.messageToParent = event.target.value;
    }
    handleClick(event)
    {
        console.log('button clicked');
        console.log(this.messageToParent);
        this.dispatchEvent(new CustomEvent('valuefromchild',
            {
                bubbles:true,
                composed:true,
                detail : {messageToParentComponent : this.messageToParent}
            }));
    }
}