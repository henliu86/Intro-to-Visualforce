public with sharing class SearchableContactListController {

    //Global Variables
    public List<Contact> contacts {get;set;}
    public String searchString {get;set;}

    //Constructor for stand alone page
    public SearchableContactListController()
    {
        searchString='';
        doQuery();
    }

    //methods for getting list of contacts
    public void doQuery()
    {
        String queryString = '';
        if(searchString != null) //add in % in the query string
            queryString = '%'+searchString+'%';

        contacts = [SELECT id, name, email, phone, accountid, Nominate__c
                    FROM Contact c
                    WHERE lastname like :queryString
                    LIMIT 10];
    }
    
    //save all records that were updated
    public void save() 
    {
        update contacts;
    }
}