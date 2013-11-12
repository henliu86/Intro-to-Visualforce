public with sharing class ContactListSimpleController
{
    public List<Contact> contacts {get;set;} //global variables
    
    //constructor
    public ContactListSimpleController()
    {
        contacts = [select name, accountid, phone, email, nominate__c from contact limit 10];
    }

    //save method
    public void save()
    {
        update contacts;
    }
}