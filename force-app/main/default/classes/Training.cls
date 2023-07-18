public with sharing class Training 
{
    public static void printNumber() 
    {
        for(Integer i=1;i<=200;i++)
        {
            if(Math.mod(i, 9)!=0)   
            {
                system.debug(i);
            }
        }
    } 
    public static Integer sumOfTwoNumber(Integer num1,Integer num2)
    {
        Integer sum=num1+num2;
        return sum;
    }
    public static void pyramid()
    {
        Integer rows=5;
        Integer no=1;
        for(Integer i=1;i<=rows;i++)
        {
            for(Integer j=2;j<=i;j++)
            {
                system.debug(no);
                no++;
            }
            system.debug('');
        }
    }
    public static void reverseOrder(String name) 
    {
        string reverseName=name.reverse();
        system.debug(reverseName);
    }
    public static Lead createLeadRecord(string lastName,string email,string company)
    {  
        Lead leadRecordToInsert = new Lead();
        leadRecordToInsert.LastName=lastName;
        leadRecordToInsert.Email=email;
        leadRecordToInsert.Company=company;
        insert leadRecordToInsert;
        return leadRecordToInsert;
    }
    public static Lead createLeadRecordTest(string lastName,string email,string company)
    {
        Lead leadRecordToInsert = new Lead();
        leadRecordToInsert.LastName=lastName;
        leadRecordToInsert.Email=email;
        leadRecordToInsert.Company=company;
        if(lastName.containsIgnoreCase('test')==True) 
        {
            system.debug('Cant Insert');
            return null;
        }
        else {
            insert leadRecordToInsert;
        }
        return leadRecordToInsert;
    }
    public static void addDefaultBirthDate(string lastName,Date birthDate,string company)
    {
        if(birthDate==Null)
        {
            date myDate = date.newInstance(1990, 01, 01);   
            birthDate=myDate;

        }
        Lead newLeadToBeInserted = new Lead();
        newLeadToBeInserted.LastName=lastName;
        newLeadToBeInserted.Birthday__c=birthDate; 
        newLeadToBeInserted.Company=company;
        insert newLeadToBeInserted;
    }
    public static void insertContactWheneverAccountIsCreated(string lastName)
    {
        Account newAccountRecord = new Account();
        newAccountRecord.Name=lastName;
        insert newAccountRecord;
        Contact newContactRecordAssociatedWithAccount = new Contact();
        newContactRecordAssociatedWithAccount.AccountId=newAccountRecord.Id;
        newContactRecordAssociatedWithAccount.LastName=lastName;
        insert newContactRecordAssociatedWithAccount;
    }
}
