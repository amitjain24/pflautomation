/**
* To generate Mock Response.
*/
@isTest
global class MockResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"line":-1,"column":-1,"compiled":true,"success":true,"compileProblem":null,"exceptionStackTrace":null,"exceptionMessage":null}');
        res.setStatusCode(200);
        return res;
    }
}