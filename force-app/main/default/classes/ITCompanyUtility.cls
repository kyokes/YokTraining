public with sharing class ITCompanyUtility 
{
    public static String giveMeTheDayToday()
    {
        Datetime todayDate = Datetime.now();
        String weekDay = todayDate.format('EEE');

        return weekDay;
    }
}