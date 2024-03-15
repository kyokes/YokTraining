import { LightningElement, wire } from 'lwc';
import getJokeCall from '@salesforce/apex/GetJokeAPI.getJokeCall';
export default class GetJoke extends LightningElement 
{
    getJoke;
    setUp;
    punchLine;
    showJoke = false;
    handleClick()
    {
        this.showJoke = !this.showJoke;
        getJokeCall()
        .then(data => {
            console.log(data);
            this.getJoke = data;
            this.setUp = data.setup;
            this.punchLine = data.punchline;
        }
            )
        .catch(error=>{
            console.log(error);
        })
    }
    
}