public with sharing class AccountHelper {
    public AccountHelper() {

    }

    public static void PreventDelete(List<Account> accList) {
        
        List<Contact> conList = [SELECT Id, Account.Name FROM Contact];
        
        Map<Account, Integer> accountCon = new Map<Account, Integer>();

        for(Account acc : accList) {
            for(Contact con : conList) {
                if(con.Account.Name.equals(acc.Name)) {
                    if(accountCon.containsKey(acc)) { 
                        accountCon.put(acc, accountCon.get(acc) + 1);
                    }
                    else {
                        accountCon.put(acc, 1);
                    }
                }
            }
        }
        
        for(Account acc : accList) {
            if(accountCon.get(acc) >= 1 || accountCon.get(acc) != null) {
                acc.addError('This Account has a contact and may not be deleted.');
            }
        }
    }

    public static void CreateRelatedContact(List<Account> accList) {
        for(Account acc : accList) {
            Contact toInsert = new Contact(LastName='Name', AccountId = acc.Id);
            insert toInsert;
        }
    }
}