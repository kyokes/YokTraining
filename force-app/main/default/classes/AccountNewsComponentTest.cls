@isTest
public class AccountNewsComponentTest
{
    @isTest
    static void testNewsCaptureMethod_Success() 
    {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        HttpMockCalloutGenerator mockGenerator = new HttpMockCalloutGenerator();
        mockGenerator.setMockResponse('{"news":[{"title":"Test News Title","author":"Test Author","source_country":"Test Country","publish_date":"2023-08-27","text":"Test News Text","image":"Test Image URL"}]}');
        System.Test.setMock(HttpCalloutMock.class, mockGenerator);
        

        System.Test.startTest();
        List<AccountNewsComponent.NewsItem> newsList = AccountNewsComponent.getNews(testAccount.Id);
        System.Test.stopTest();
        
        
        System.assertEquals(1, newsList.size());
        
        AccountNewsComponent.NewsItem newsData = newsList[0];
        System.assertEquals('Test News Title', newsData.title);
        System.assertEquals('Test Author', newsData.author);
        System.assertEquals('Test Country', newsData.source_country);
        System.assertEquals('2023-08-27', newsData.publish_date);
        System.assertEquals('Test News Text', newsData.text);
        System.assertEquals('Test Image URL', newsData.image);
    }
}