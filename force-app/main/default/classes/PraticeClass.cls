public with sharing class PraticeClass 
{
    // public static void main()
    // {
    //     String variableName = 'Madam';
    //     String lowerCase = variableName.toLowerCase();
    //     System.debug(lowerCase);
    //     List<String> listOfCharacters = lowerCase.split();
    //     System.debug(listOfCharacters);
    // }
    
    public static void main() 
    {
        String variableName = 'salesforce';
        String reversedWord = '';
        
        // Iterate through the characters of the string in reverse order
        for(Integer i = variableName.length() - 1; i >= 0; i--) {
            // Append each character to the new string
            //reversedWord += i;
            reversedWord += variableName.charAt(i);
        }
        
        System.debug(reversedWord);
    }
    
}