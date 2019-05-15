public class AutomationScriptRunner{
    
    private string apiLocationApex = '/services/data/v29.0/tooling/executeAnonymous/?anonymousBody=';
    private string apiLocationSOQL = '/services/data/v20.0/query/?q=';
    public String textColor{get;set;}
    public String responseText{get;set;}
    public String scriptText {get;set;}
    private String encoding='UTF-8';
    private String requestMethod='GET';
    private Integer requestTimeout=1000;
    
    //Run the Script
    public PageReference execute()
    {
        System.debug('##text'+ scriptText);
        
        
        if(string.IsEmpty(scriptText))   
        {
            textColor = 'red';
            responseText = 'Please provide script text to execute.';            
        }        
        else
        {
            responseText = executeAnonymous(scriptText);
            System.debug('### responseText');
            System.debug(responseText);
            List <String> respTextList=responseText.split(':');
            Integer success_position=0;
           for(String respText : respTextList)
            {
                if(respText.contains('success'))
                    break;
                success_position = success_position + 1;
            }
            if (respTextList[success_position].contains('success') && respTextList[success_position+1].contains('true'))
            {
                textColor = 'green';
                responseText  = '<b>Script executed successfully.</b>';
            }   
            else
            {
                textColor = 'red';
                responseText  = '<b>Error:</b>'+ responseText ;
                responseText  = responseText.replace('{', '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;').replace('}', '');
                responseText  = responseText.replace(',"','<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;').replace('":', ' = ').replace(',', '');                
            }                       
        }
        return null;
    }
    
    //Execute Apex script using API
    private string executeAnonymous(string scriptToExecute)
    {
        return getResponseText(apiLocationApex,scriptToExecute);
    }
    
    
    //get response text of query/script
    private string getResponseText(string apiLocation, string scriptToExecute)
    {
        string salesfoceURL = URL.getSalesforceBaseUrl().toExternalForm();
        Http httpInstance = new Http();
        HttpRequest httpRequest = new HttpRequest();
        HttpResponse httpResponse;
        String apexCode = scriptToExecute ;
        String encodedApex = EncodingUtil.urlEncode(apexCode, encoding);
        httpRequest.setEndpoint(salesfoceURL + apiLocation  + encodedApex);
        httpRequest.setMethod(requestMethod);
        httpRequest.setTimeout(requestTimeout);
        
        httpRequest.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId()); 
        httpResponse = httpInstance.send(httpRequest);
        return httpresponse.getBody();     
    }   
}