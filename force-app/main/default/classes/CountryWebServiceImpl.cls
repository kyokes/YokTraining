/**
 * Class Name : CountryWebServiceImpl
 * Author Name  : Yokesh.k@4iapps.com
 *  Date Added : 16th August 2023
 
 * This class provides various static methods to interact with the CountryWebService
 * and retrieve country-related information using SOAP web services.
 */
public with sharing class CountryWebServiceImpl 
{
    /**
     * Retrieves full country information based on the provided ISO country code.
     * @param sCountryISOCode The ISO country code for the country.
     */
    public static void getFullCountryInfo(String sCountryISOCode)
    {
        // Create an instance of the CountryInfoServiceSoap client
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        // Retrieve country information using the web service
        CountryWebService.tCountryInfo tCountryInfo = countryInfo.FullCountryInfo(sCountryISOCode);
        
        // Extract and display various country details
        System.debug('Passing Country Code : '+sCountryISOCode);
        System.debug('Country Code : '+tCountryInfo.sISOCode);
        System.debug('Country Name : '+tCountryInfo.sName);
        System.debug('Captial City : '+tCountryInfo.sCapitalCity);
        System.debug('Country Phone Code : '+tCountryInfo.sPhoneCode);
        System.debug('Country Continent Code : '+tCountryInfo.sContinentCode);
        System.debug('Country Currency Code : '+tCountryInfo.sCurrencyISOCode);
        System.debug('Country Flag URL : '+tCountryInfo.sCountryFlag);

        // Extract and display the first language information
        CountryWebService.ArrayOftLanguage languages = tCountryInfo.Languages;
        if (languages != null && !languages.tLanguage.isEmpty())
        {
            CountryWebService.tLanguage tLanguage = languages.tLanguage.get(0);
            System.debug('Language : '+tLanguage.sName);
            System.debug('Language Code : '+tLanguage.sISOCode);
        }
    }
    /**
     * Retrieves country flag url based on the provided ISO country code.
     * @param sCountryISOCode The ISO country code for the country.
     */
    public static void getCountryFlagURL(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Country Code : '+sCountryISOCode);
        System.debug('Country Flag URl : '+countryInfo.CountryFlag(sCountryISOCode));
    }
    /**
     * Retrieves country name based on the provided ISO country code.
     * @param sCountryISOCode The ISO country code for the country.
     */
    public static void getCountryName(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Country Code : '+sCountryISOCode);
        System.debug('Country Name : '+countryInfo.CountryName(sCountryISOCode));
    }
    /**
     * Retrieves country currency information based on the provided ISO country code.
     * @param sCountryISOCode The ISO country code for the country.
     */
    public static void getCountryCurrency(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.tCurrency getCurrencyName = countryInfo.CountryCurrency(sCountryISOCode);

        System.debug('Passing Country Code : '+sCountryISOCode);
        System.debug('Country Currency Name : '+getCurrencyName.sName);
        System.debug('Country Currency Code : '+getCurrencyName.sISOCode);
    }
    /**
     * Retrieves list of currency information based on Name
     */
    public static void getListOfCurrenciesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency getCurrencyNames = countryInfo.ListOfCurrenciesByName();
        List<CountryWebService.tCurrency> tCurrency = getCurrencyNames.tCurrency;

        System.debug('--------- List Of Currencies By Name -------------');

        for(CountryWebService.tCurrency currentCurrency : tCurrency)
        {
            //System.debug('Currency Code : '+currentCurrency.sISOCode);
            System.debug('Currency Name : '+currentCurrency.sName);
        }
    }
    /**
     * Retrieves Array of Country Code and Country Name information
     */
    public static void getArrayOftCountryCodeAndName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = countryInfo.ListOfCountryNamesByCode();
        List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;

        System.debug('----------- List Of Country Names --------------- ');

        for(CountryWebService.tCountryCodeAndName currentCountryCodeAndName : tCountryCodeAndName)
        {
            System.debug('Country Name : '+currentCountryCodeAndName.sName);
            System.debug('Country Code : '+currentCountryCodeAndName.sISOCode);
        }
    }
    /**
     * Retrieves country phone code information based on the provided ISO country code.
     * @param sCountryISOCode The ISO country code for the country.
     */
    public static void getCountryIntPhoneCode(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Country Code : '+sCountryISOCode);
        System.debug('Country Int Phone Code : '+countryInfo.CountryIntPhoneCode(sCountryISOCode));
    }
    /**
     * Retrieves country currency name information based on the provided ISO country code.
     * @param sCurrencyISOCode The ISO code for the Currency.
     */
    public static void getCurrencyName(String sCurrencyISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Country Code : '+sCurrencyISOCode);
        System.debug('Country Currency Name : '+countryInfo.CurrencyName(sCurrencyISOCode));
    }
    /**
     * Retrieves List of Currencies By Code 
     */
    public static void getListOfCurrenciesByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency getArrayOftCurrency = countryInfo.ListOfCurrenciesByCode();
        List<CountryWebService.tCurrency> getTCurrency = getArrayOftCurrency.tCurrency;

        System.debug('--------- List Of Currencies By Code --------');

        for(CountryWebService.tCurrency currentCurrencyCode : getTCurrency)
        {
            System.debug('Currency Code : '+currentCurrencyCode.sISOCode);
            //System.debug('Currency Name : '+currentCurrencyCode.sName);
        }
    }
    /**
     * Retrieves List of Languages By Code 
     */
    public static void getListOfLanguagesByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage getArrayOftLanguage = countryInfo.ListOfLanguagesByCode();
        List<CountryWebService.tLanguage> getTLanguage = getArrayOftLanguage.tLanguage;

        System.debug('------------- List Of Languages By Code ----------');

        for(CountryWebService.tLanguage currentLanguage : getTLanguage)
        {
            System.debug('Language Code : '+currentLanguage.sISOCode);
            //System.debug('Language Name : '+currentLanguage.sName);
        }
    }
    /**
     * Retrieves Language ISO Code information based on the provided Language Name.
     * @param sLanguageName The Language Name.
     */
    public static void getLanguageISOCode(String sLanguageName)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Language Name : '+sLanguageName);
        System.debug('Language Code : '+countryInfo.LanguageISOCode(sLanguageName));
    }
    /**
     * Retrieves country Captial City information based on the provided ISO country code.
     * @param sCountryISOCode The ISO country code for the country.
     */
    public static void getCapitalCity(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Country Code : '+sCountryISOCode);
        System.debug('Country Captial Name : '+countryInfo.CapitalCity(sCountryISOCode));
    }
    /**
     * Retrieves List of Languages By Name 
     */
    public static void getListOfLanguagesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage getArrayOftLanguage = countryInfo.ListOfLanguagesByName();
        List<CountryWebService.tLanguage> getTLanguage = getArrayOftLanguage.tLanguage;

        System.debug('------------- List Of Languages By Name ----------');

        for(CountryWebService.tLanguage currentLanguage : getTLanguage)
        {
            //System.debug('Language Code : '+currentLanguage.sISOCode);
            System.debug('Language Name : '+currentLanguage.sName);
        }
    }
    /**
     * Retrieves List of Country Name Grouped By Continent 
     */
    public static void getListOfCountryNamesGroupedByContinent()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndNameGroupedByContinent getCountryCodeAndNameGroupedByContinent = countryInfo.ListOfCountryNamesGroupedByContinent();
        List<CountryWebService.tCountryCodeAndNameGroupedByContinent> tCountryCodeAndNameGroupedByContinent = 
                                                                                        getCountryCodeAndNameGroupedByContinent.tCountryCodeAndNameGroupedByContinent;
        
        for(CountryWebService.tCountryCodeAndNameGroupedByContinent currentContinent : tCountryCodeAndNameGroupedByContinent)
        {
            CountryWebService.tContinent tContinent = currentContinent.Continent;
            CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = currentContinent.CountryCodeAndNames;
            List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;

            System.debug('--------------- Continent Name ------------- : '+tContinent.sName+' ---------------');
            System.debug('--------------- Continent Code ------------- : '+tContinent.sCode+' ---------------');

            for(CountryWebService.tCountryCodeAndName currentCountry : tCountryCodeAndName)
            {
                System.debug('Current Continent Country Name : '+currentCountry.sName);
                System.debug('Current Continent Country Code : '+currentCountry.sISOCode);
            }
            // System.debug(currentContinent);
            // System.debug(tContinent);
        }
    }
    /**
     * Retrieves List of Country Name By Name
     */
    public static void getListOfCountryNamesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = countryInfo.ListOfCountryNamesByName();
        List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;

        System.debug('---------------- List Of Country Names By Name -------------');

        for(CountryWebService.tCountryCodeAndName currentCountryCodeAndName : tCountryCodeAndName)
        {
            System.debug('Country Name : '+currentCountryCodeAndName.sName);
            //System.debug('Country Code : '+currentCountryCodeAndName.sISOCode);
        }
    }
    /**
     * Retrieves List of Continent Name By Name 
     */
    public static void getListOfContinentsByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftContinent getContinentName = countryInfo.ListOfContinentsByName();
        List<CountryWebService.tContinent> tContinent = getContinentName.tContinent;

        System.debug('---------------- List Of Continent Names By Name -------------');

        for(CountryWebService.tContinent currentContinent : tContinent)
        {
            System.debug('Continent Name : '+currentContinent.sName);
            //System.debug('Continent Code : '+currentContinent.sCode);
        }
    }
    /**
     * Retrieves Language Name information based on the provided ISO code.
     * @param sISOCode The ISO code for Language.
     */
    public static void getLanguageName(String sISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Language ISO Code : '+sISOCode);
        System.debug('Language Name : '+countryInfo.LanguageName(sISOCode));
    }
    /**
     * Retrieves List of Continent Code By Code 
     */
    public static void getListOfContinentsByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftContinent getContinentCode = countryInfo.ListOfContinentsByCode();
        List<CountryWebService.tContinent> tContinent = getContinentCode.tContinent;

        System.debug('---------------- List Of Continent By Code -------------');

        for(CountryWebService.tContinent currentContinent : tContinent)
        {
            //System.debug('Continent Name : '+currentContinent.sName);
            System.debug('Continent Code : '+currentContinent.sCode);
        }
    }
    /**
     * Retrieves countries using currency information based on the provided ISO Currency code.
     * @param sISOCurrencyCode The ISO code for Currency.
     */
    public static void getCountriesUsingCurrency(String sISOCurrencyCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getArrayOfCountryCodeAndName = countryInfo.CountriesUsingCurrency(sISOCurrencyCode);
        List<CountryWebService.tCountryCodeAndName> getCountryNameAndCode = getArrayOfCountryCodeAndName.tCountryCodeAndName;

        System.debug('Passing ISO Currency Code : '+sISOCurrencyCode);
        System.debug('----------- List Of Countries Using This Currency ---------');

        for(CountryWebService.tCountryCodeAndName currentCountry : getCountryNameAndCode)
        {
            System.debug('Country Name : '+currentCountry.sName);
            //System.debug('Country ISO Code : '+currentCountry.sISOCode);
        }
    }
    /**
     * Retrieves country ISO Code information based on the provided Country Name.
     * @param sCountryName The Name of the Country.
     */
    public static void getCountryISOCode(String sCountryName)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug('Passing Country Name : '+sCountryName);
        System.debug('Country ISO Code : '+countryInfo.CountryISOCode(sCountryName));
    }
    /**
     * Retrieves List of Country informations 
     */
    public static void getArrayOfCountryInfo() 
    {
        CountryWebService.CountryInfoServiceSoap countryInfo = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryInfo getArrayOftCountryInfo = countryInfo.FullCountryInfoAllCountries();
    
        if (getArrayOftCountryInfo != null && getArrayOftCountryInfo.tCountryInfo != null) 
        {
            List<CountryWebService.tCountryInfo> getCountryInfo = getArrayOftCountryInfo.tCountryInfo;
    
            for (CountryWebService.tCountryInfo currentCountry : getCountryInfo) 
            {
                if (currentCountry != null) 
                {
                    System.debug('Country Code : ' + currentCountry.sISOCode);
                    System.debug('Country Name : ' + currentCountry.sName);
                    System.debug('Captial City : ' + currentCountry.sCapitalCity);
                    System.debug('Country Phone Code : ' + currentCountry.sPhoneCode);
                    System.debug('Country Continent Code : ' + currentCountry.sContinentCode);
                    System.debug('Country Currency Code : ' + currentCountry.sCurrencyISOCode);
                    System.debug('Country Flag URL : ' + currentCountry.sCountryFlag);
    
                    if(currentCountry.Languages != null && currentCountry.Languages.tLanguage != null) 
                    {
                        List<CountryWebService.tLanguage> getLanguage = currentCountry.Languages.tLanguage;
                        //System.debug(getLanguage);
    
                        for (CountryWebService.tLanguage currentLanguage : getLanguage) 
                        {
                            if (currentLanguage != null) 
                            {
                                System.debug('Language : ' + currentLanguage.sName);
                                System.debug('Language Code : ' + currentLanguage.sISOCode);
                            }
                        }
                    }
                }
            }
        }
    }
    
}