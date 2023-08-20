public with sharing class ITCompany 
{
    public static List<Human> onBoardEmployees()
    {
        List<Human> listOfHumans = new List<Human>();

        Human createHuman1 = new Human('Mennear','amennear6@patch.com',21,'Male');
        createHuman1.firstName='Algernon';
        createHuman1.isSmoker=true;
        listOfHumans.add(createHuman1);

        Human createHuman2 = new Human('Jeffree','ajeffree8@bloglovin.com',23,'Male');
        createHuman2.firstName='Aldwin';
        createHuman2.isSmoker=true;
        listOfHumans.add(createHuman2);

        Human createHuman3 = new Human('Dunaway','cdunaway0@homestead.com',20,'Female');
        createHuman3.firstName='Caye';
        createHuman3.isSmoker=false;
        listOfHumans.add(createHuman3);

        Human createHuman4 = new Human('Stollwerk','sstollwerk2@moonfruit.com',26,'Female');
        createHuman4.firstName='Sharleen';
        createHuman4.isSmoker=false;
        listOfHumans.add(createHuman4);

        Human createHuman5 = new Human('Batrick','cbatrick1@sina.com.cn',22,'Female');
        createHuman5.firstName='Crysta';
        createHuman5.isSmoker=false;
        listOfHumans.add(createHuman5);

        Human createHuman6 = new Human('Moorcraft','mmoorcraft7@i2i.jp',25,'Male');
        createHuman6.firstName='Murdock';
        createHuman6.isSmoker=false;
        listOfHumans.add(createHuman6);

        Human createHuman7 = new Human('Ambrogioni','aambrogioni6@discovery.com',28,'Female');
        createHuman7.firstName='Amalee';
        createHuman7.isSmoker=true;
        listOfHumans.add(createHuman7);

        Human createHuman8 = new Human('Bilt','wbilt9@businessinsider.com',29,'Male');
        createHuman8.firstName='Wang';
        createHuman8.isSmoker=true;
        listOfHumans.add(createHuman8);

        Human createHuman9 = new Human('Destouche','hdestoucheg@youtube.com',23,'Female');
        createHuman9.firstName='Hildegarde';
        createHuman9.isSmoker=false;
        listOfHumans.add(createHuman9);

        Human createHuman10 = new Human('Kernes','lkernes1d@photobucket.com',23,'Male');
        createHuman10.firstName='Langsdon';
        createHuman10.isSmoker=true;
        listOfHumans.add(createHuman10);

        Human createHuman11 = new Human('Cleynman','dcleynman1k@a8.net',26,'Female');
        createHuman11.firstName='Daphene';
        createHuman11.isSmoker=false;
        listOfHumans.add(createHuman11);

        Human createHuman12 = new Human('Kernes','lkernes1d@photobucket.com',23,'Male');
        createHuman12.firstName='Langsdon';
        createHuman12.isSmoker=true;
        listOfHumans.add(createHuman12);

        Human createHuman13 = new Human('Farthing','bfarthing1q@ow.ly',20,'Male');
        createHuman13.firstName='Boot';
        createHuman13.isSmoker=true;
        listOfHumans.add(createHuman13);

        Human createHuman14 = new Human('Prendergrast','mprendergrast1o@icio.us',24,'Female');
        createHuman14.firstName='Meryl';
        createHuman14.isSmoker=false;
        listOfHumans.add(createHuman14);

        Human createHuman15 = new Human('Vick','kvick1n@yellowpages.com',26,'Female');
        createHuman15.firstName='Kristine';
        createHuman15.isSmoker=true;
        listOfHumans.add(createHuman15);

        Human createHuman16 = new Human('Dormand','edormand4@flickr.com',21,'Male');
        createHuman16.firstName='Esra';
        createHuman16.isSmoker=true;
        listOfHumans.add(createHuman16);

        Human createHuman17 = new Human('Oxborrow','coxborrow9@exblog.jp',24,'Female');
        createHuman17.firstName='Christen';
        createHuman17.isSmoker=false;
        listOfHumans.add(createHuman17);

        Human createHuman18 = new Human('Holmes','sherlock.holmes@imdb.com',21,'Male');
        createHuman18.firstName='Sherlock';
        createHuman18.isSmoker=true;
        listOfHumans.add(createHuman18);

        Human createHuman19 = new Human('Shelby','thomas.shelby@movie.com',28,'Male');
        createHuman19.firstName='Thomas';
        createHuman19.isSmoker=false;
        listOfHumans.add(createHuman19);

        Human createHuman20 = new Human('Nolan','chris.nolan@flickr.com',45,'Male');
        createHuman20.firstName='Christopher';
        createHuman20.isSmoker=true;
        listOfHumans.add(createHuman20);

        return listOfHumans;
    } 

    public static List<Human> identifySuperHumans()
    {
        List<Human> superHumanIdentification = onBoardEmployees();

        List<Human> returnUpdatedSuperHumanStatus = new List<Human>();

        String weekDay = ITCompanyUtility.giveMeTheDayToday();

        // Datetime todayDate = Datetime.now();
        // String weekday = todayDate.format('EEEE');
        for(Human currentHuman : superHumanIdentification)
        {
            if(weekDay == 'Fri')
            {
                Human updateSuperHumanStatus = new Human(currentHuman.lastName,currentHuman.email,currentHuman.age,currentHuman.genderSex);
                if(updateSuperHumanStatus!=null)
                {
                    if(
                        currentHuman.lastName.startsWith('A') || currentHuman.lastName.startsWith('M') || 
                        currentHuman.lastName.startsWith('D') || currentHuman.lastName.startsWith('P') || 
                        currentHuman.lastName.startsWith('V') || currentHuman.firstName.startsWith('A') || 
                        currentHuman.firstName.startsWith('M') || currentHuman.firstName.startsWith('D') || 
                        currentHuman.firstName.startsWith('P') || currentHuman.firstName.startsWith('V')
                     )
                    {
                        updateSuperHumanStatus.activateSuperHumanCapability();
                        returnUpdatedSuperHumanStatus.add(updateSuperHumanStatus);
                    }
                }
            }
        }
        return returnUpdatedSuperHumanStatus;
    }
}