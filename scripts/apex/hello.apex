// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

List<Contact> conList = [SELECT Id, Account.Name FROM Contact];
        
Map<Account, Integer> accountCon = new Map<Account, Integer>();

List<Account> accList = [SELECT Name FROM Account];

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

System.debug(accountCon);