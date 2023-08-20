public with sharing class Human 
{
    public String firstName;
    public String lastName;
    public String email;
    public String genderSex;
    public Boolean isSmoker;
    public Integer age;
    public Boolean isSuperHuman = False;
    
    public Human(String lastNameProvided,String emailProvided,Integer ageProvided,String genderSexProvided) 
    {
        this.lastName = lastNameProvided;
        this.email = emailProvided;
        this.age = ageProvided;
        this.genderSex = genderSexProvided;
        // System.debug(lastName);
        // System.debug(email);
        // System.debug(age);
        // System.debug(genderSex);
    }

    public void activateSuperHumanCapability()
    {
        isSuperHuman=True;
    }
}