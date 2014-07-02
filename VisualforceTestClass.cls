@isTest
private class VisualforceTestClass{

    public static TestMethod void test(){
    
        Contact c = new Contact(lastname='x');
        insert c;
        
        ContactListSimpleController clsc = new ContactListSimpleController();
        
        SearchableContactListController sclc = new SearchableContactListController();
        sclc.doQuery();
        sclc.Save();
        
        ContactListController clc = new ContactListController();
        clc.doQuery();
        clc.Save();
        
        ApexPages.StandardController sc = new ApexPages.StandardController(c);
        AccountContactListController aclc = new AccountContactListController(sc);
        aclc.doQuery();
        aclc.Save();
    }
    
}