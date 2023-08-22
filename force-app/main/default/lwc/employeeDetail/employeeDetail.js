import { LightningElement , api} from 'lwc';

export default class EmployeeDetail extends LightningElement {

@api 
   employeeName;
@api 
    email;
 @api 
    phone;
 @api 
    company;
 @api 
    role;

}