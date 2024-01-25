import { LightningElement } from 'lwc';
import retrieveListOfAccounts from '@salesforce/apex/ChildComponentToParentComponent.retrieveListOfAccounts';
export default class ParentComponent extends LightningElement 
{
  // parentUserName;
  // messageToChild;
  // handleChange(event)
  // {
  //   this.parentUserName = event.target.value;
  // }
  // handleClick(event)
  // {
  //   this.messageToChild = this.parentUserName;
  // }
  messageToChild;
  handleClick1(event)
  {
      this.messageToChild = this.refs.playerDetails1.header +'  '+ this.refs.playerDetails1.description;
  }
  handleClick2(event)
  {
      this.messageToChild = this.refs.playerDetails2.header +'  '+ this.refs.playerDetails2.description;
  }
  handleClick3(event)
  {
      this.messageToChild = this.refs.playerDetails3.header +'  '+ this.refs.playerDetails3.description;
  }
}