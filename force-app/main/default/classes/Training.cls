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
}