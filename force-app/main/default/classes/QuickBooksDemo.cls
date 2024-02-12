public with sharing class QuickBooksDemo 
{
    private static final String BASE_URL = 'https://sandbox-quickbooks.api.intuit.com/v3/company/9130357886998126/companyinfo/9130357886998126?minorversion=12';
    private static final String ACCESS_TOKEN = 'eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..6qhtpYL79FY0bl6cCGM_2Q.t_HrIAt1aQJYmZZHUp9g6ZVTAWI0lOKT6n5XSP6utoXylawgX8xHdUB1i2P_O-cJotSc9rWvLCtIu2H6CDpNBx6c5CXQy1wuMdXlVnzA8K1AGpwRm5Wy3CXpl873CB9ryagUrFvtS0C_u8zbddAR7t95Rzh9DT9BNX2wbSOZbUOPunxpPiPB2AVDmbB-olxq9gQqWDgnlMGzPSa5SPhxbRMsK5utoFZwz0ThJvS15G7uWBDh7aRGQYt_lWiqBhXtQSnYbGgkGmrDkJZHr-UuZKeSP8SuX236fOPJE-d1fvOBZkUQydxdY7MptLjouiHRAlkSHwUqYM0H35WV5nJhpe_Slo-WlzLm1wl8cVwEmT-FBgfJWWkcd8tekHcBb93g4xDTEoUHksJq7w1xiPnZqlYdp225D8Ds6rW5PBjF6frKAz4EKI0-cfkrlfef523zXbTwojapiwAXr8VpKSZvmAi0VAbIAAQKqfC_kh2m2IsoSIYaKF0ryl0RmSnm88lc8R05ddQ6m6pVGLzOTX0vORyPDUo8n4IWZf-5Wocd6eS5YUQs7rhBbrj99bkKtDaXKh05GlDhwC2CGzwy3tp3pAriy7An9RyX0PVV7hQGbVR7v_FF5AeM9L0S29GX0RZBCjgBdQ2L1btW-z_4mxc9uu_DFhPxeL3-_wf71Z7KOOHBKs6Gtv6y6Y_lkVLFAigveVtIUfrJpDh9kbsZkcebX7_AJBXvW8XpA6FJQynkB84.ELa5aB9jDPW3E1CiO31UCg';
    public static void newRequestForQuickBooks()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint(BASE_URL);
        request.setMethod('GET');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + ACCESS_TOKEN);
        request.setHeader('Content-Type', 'application/json');
        try {
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200)
            {
                System.debug(response.getBody());
                WrapperClass wrapper = (WrapperClass)JSON.deserialize(response.getBody(), WrapperClass.class);
                if (wrapper != null && wrapper.CompanyInfo != null) 
                {
                    System.debug(wrapper.CompanyInfo.CompanyName);
                    System.debug(wrapper.CompanyInfo.LegalName);
                } else 
                {
                    System.debug('CompanyInfo is null');
                }
            } else {
                System.debug('Response status: ' + response.getStatusCode());
                System.debug('Response body: ' + response.getBody());
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
    }
    public class WrapperClass 
    {
        public cls_CompanyInfo CompanyInfo;
    }
    public class cls_CompanyInfo 
    {
        public String CompanyName;
        public String LegalName;
    }
}