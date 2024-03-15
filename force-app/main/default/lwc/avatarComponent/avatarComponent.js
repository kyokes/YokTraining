import { LightningElement,wire } from 'lwc';
import getListOfProducts from '@salesforce/apex/AvatarComponent.getListOfProducts';
import getPriceOfTheSelectedProduct from '@salesforce/apex/AvatarComponent.getPriceOfTheSelectedProduct'

export default class AvatarComponent extends LightningElement 
{
    productList;
    prodId;
    priceOfTheSelectedProduct;

    @wire(getListOfProducts)
    getProducts({error,data})
    {
        if(data)
        {
            this.productList = data;
            console.log(data);
        }
        else
        {
            console.log(error);
        }
    }
    handleClick(event)
    {
        console.log(event.target.name);
        this.prodId = event.target.name;
    }

    @wire(getPriceOfTheSelectedProduct,{productId:'$prodId'})
    getPrice({error,data})
    {
        if(data)
        {
            this.priceOfTheSelectedProduct = data;
            console.log(this.priceOfTheSelectedProduct);
        }
        else
        {
            console.log(error);
        }
    }
}