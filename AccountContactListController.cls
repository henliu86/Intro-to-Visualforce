public with sharing class AccountContactListController 
{
    //Global Variables
    public List<Contact> contacts {get;set;}
    public String searchString {get;set;}
    private String accountId; //only use if view on standard controller
    
    //Constructor for standard page
    public AccountContactListController(ApexPages.StandardController controller) 
    {
        searchString='';
        accountId = controller.getId();
        doQuery();
    }

    //methods for getting list of contacts
    public void doQuery()
    {
        String queryString = '';
        if(searchString != null) //add in % in the query string
            queryString = '%'+searchString+'%';
        
        //if viewing on standard controller (account), add in filter for accountId
        contacts = [SELECT id, name, email, phone, Nominate__c
                    FROM Contact 
                    WHERE lastname like :queryString
                    AND AccountId = :accountId
                    ORDER BY lastname asc
                    LIMIT 10];
    }
    
    //save all records that were updated
    public void save() 
    {
        update contacts;
    }

}