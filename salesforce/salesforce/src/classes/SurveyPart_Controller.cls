public with sharing class SurveyPart_Controller {

    public SurveyPart_Controller ( ApexPages.StandardController standardController ) {
      
        
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

}