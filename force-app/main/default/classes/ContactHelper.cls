public with sharing class ContactHelper {
    public ContactHelper() {

    }

     public static void SetDefaultEmail(List<Contact> conList) {
        for(Contact con : conList) {
            if(con.email.equals('')) {
                con.email = 'default@temporary.com';
            }
        }
     }
}