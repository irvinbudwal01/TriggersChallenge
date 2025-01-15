public with sharing class ContactHelper {
    public ContactHelper() {

    }

    public static void SetDefaultEmail(List<Contact> conList) {
        for(Contact con : conList) {
            if(String.isBlank(con.Email)) {
                con.Email = 'default@temporary.com';
            }
        }
     }

    public static void UpdatePhones(List<Contact> conList) {

        Set<Id> accountIds = new Set<Id>();

        for(Contact c : conList) {
            accountIds.add(c.AccountId);
        }
        
        List<Account> allAccounts = [SELECT ID FROM Account WHERE ID IN :accountIds];

        for(Contact c : conList) {
            for(Account acc : allAccounts) {
                if(c.AccountId.equals(acc.Id)) {
                    acc.Phone = c.Phone;
                }
            }
        }
        update allAccounts;
    }

    public static void PreventDuplicatePhone(List<Contact> conList) {
        
        Set<String> phoneNumbers = new Set<String>();

        for(Contact c : conList) {
            phoneNumbers.add(c.Phone);
        }

        List<Contact> allContacts = [SELECT Name, Phone FROM Contact WHERE Phone IN :phoneNumbers];

        for(Contact c : conList) {
            if(!allContacts.isEmpty()) {
                c.addError('Duplicate phone numbers are not allowed!');
            }
        }
    }
}