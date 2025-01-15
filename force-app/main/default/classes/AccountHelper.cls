public with sharing class AccountHelper {
    public AccountHelper() {

    }

    public static void PreventDelete(List<Account> accList) {
        for(Account acc : accList) {
            if(!acc.Contacts.isEmpty()) {
                acc.addError('This Account has a contact and may not be deleted.');
            }
        }
    }
}