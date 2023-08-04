public with sharing class ContactHelperExtension 
{
    public static void updateDescription(List<Contact> contactsToBeUpdated)
    {
        List<Contact>  contactsUpdated = new List<Contact>();
        for(Contact updateContactDescription : contactsToBeUpdated)
        {
            Contact updateContact = new Contact();
            updateContact.Id=updateContactDescription.Id;
            updateContact.Description='Contacts Updated';
            contactsUpdated.add(updateContact);
        }
        Update contactsUpdated;
    }    
}