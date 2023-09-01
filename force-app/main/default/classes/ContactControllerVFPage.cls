public with sharing class ContactControllerVFPage 
{
    public Contact contact { get; set; }
    
    public ContactControllerVFPage(ApexPages.StandardController controller) 
    {
            contact = new Contact();
        }
    
        public void saveContact()
        {
            List<Contact> existingContacts = [
                SELECT Id
                FROM Contact
                WHERE FirstName = :contact.FirstName
                  AND LastName = :contact.LastName
                  AND Email = :contact.Email
            ];
    
            if (existingContacts.isEmpty()) 
            {
                insert contact;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Contact created successfully.'));
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Duplicate Contact found.'));
            }
        }
}
    