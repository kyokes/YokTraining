public class AccountNewsComponent 
{
    private static final String BASE_END_POINT = 'https://api.worldnewsapi.com/search-news?text=';
    private static final String API_KEY = '284ad4ccc4b4461f91ccbae49be52fd5';

    @AuraEnabled(cacheable=true)
    public static List<NewsItem> getNews(String accId) 
    {
        List<NewsItem> listOfNews = new List<NewsItem>();
        WrapperNews currentNews = new WrapperNews();

        List<Account> accounts = [
                                    SELECT Id, Name 
                                    FROM Account 
                                    WHERE Id = :accId
                                 ];

        if (!accounts.isEmpty()) 
        {
            Account getAccount = accounts[0];
            String currentAccountName = getAccount.Name;

            Http httpConnection = new Http();
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();

            String endPoint = BASE_END_POINT + currentAccountName;

            request.setMethod('GET');
            request.setEndpoint(endPoint);
            request.setHeader('x-api-key', API_KEY);

            response = httpConnection.send(request);

            if (response.getStatusCode() == 200 || response.getStatusCode()==201)   
            {
                String body = response.getBody();

                WrapperNews wrapper = (WrapperNews) JSON.deserialize(body, WrapperNews.class);
                if (wrapper.news != null) 
                {
                    listOfNews = wrapper.news;
                    System.debug(listOfNews);
                }
            }
        }
        
        return listOfNews;
    }

    public class WrapperNews 
    {
        @AuraEnabled
        public Integer offset { get; set; }
        @AuraEnabled
        public Integer available { get; set; }
        @AuraEnabled
        public List<NewsItem> news { get; set; }
    }

    public class NewsItem 
    {
        @AuraEnabled
        public Integer id { get; set; }
        @AuraEnabled
        public String title { get; set; }
        @AuraEnabled
        public String text { get; set; }
        @AuraEnabled
        public String url { get; set; }
        @AuraEnabled
        public String image { get; set; }
        @AuraEnabled
        public String publish_date { get; set; }
        @AuraEnabled
        public String author { get; set; }
        @AuraEnabled
        public String language { get; set; }
        @AuraEnabled
        public String source_country { get; set; }
        @AuraEnabled
        public Double sentiment { get; set; }
        
    }
}
