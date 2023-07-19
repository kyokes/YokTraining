public virtual with sharing class UtilityHelper 
{
    public static Integer generateRandomString()
    {
        Integer num=Integer.valueOf(Math.random()*1000);
        system.debug(num);
        return num;
    }
    public static void validateLoggedInUserHasCreateAccessToObject()
    {  

    }
}