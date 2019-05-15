@isTest
private class AutomationScriptRunnerTest {
	
	private static testMethod void testApexScript(){
		Test.setMock(HttpCalloutMock.class, new MockResponseGenerator());
		
		String apexCode = 'Contact c = new Contact();';
		AutomationScriptRunner asr = new AutomationScriptRunner();
		asr.scriptText = apexCode;
		asr.execute();
	
	} 
}