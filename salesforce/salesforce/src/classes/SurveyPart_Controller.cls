public class SurveyPart_Controller {
    public SurveyPart__c surveypart { get; private set; }
    
    public SurveyPart_Controller () {
        surveypart = new SurveyPart__c();
    }

    public List<SelectOption> getTypes()
    {
        List<SelectOption> types = new List<SelectOption>();
        
        Schema.DescribeFieldResult fieldResult = SurveyPart__c.Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple)
        {
            types.add(new SelectOption(f.getLabel(), f.getValue()));
        }
              
        return types;
    }
    
    public PageReference save() {
        try {
            upsert(surveypart);
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
        
        //PageReference pageRef = new PageReference('http://www.google.com');
        PageReference pageRef = ApexPages.currentPage();
        pageRef.setRedirect(true);
        return (pageRef);
    }
   
}