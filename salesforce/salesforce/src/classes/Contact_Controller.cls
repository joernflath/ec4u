public with sharing class Contact_Controller {
      public String selectedAccount {get; set;}
      public Contact contact {get; set;}
      	
      public Contact_Controller(ApexPages.StandardController standardController){
            contact = (Contact)standardController.getRecord();
      }

      public List<SelectOption> getAllAccounts(){
		List<SelectOption> options = new List<SelectOption>();
		List<Account> accounts = [SELECT Name FROM Account];
		for (Account account : accounts) {
			options.add(new SelectOption(account.Id, account.Name));
		}
	return options;	
	}
	
	public PageReference costumsave(){
		contact.AccountId = selectedAccount;
		insert contact;
		
		return null;
	}
}