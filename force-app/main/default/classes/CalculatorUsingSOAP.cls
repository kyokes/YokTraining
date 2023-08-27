public with sharing class CalculatorUsingSOAP 
{
    @AuraEnabled(cacheable=true)
    public static Integer additionOfTwoNumbers(Integer input1,Integer input2)
    {
        CalculatorSoapClass.CalculatorSoap addition = new CalculatorSoapClass.CalculatorSoap();
        Integer resultOfTWoNumber = addition.Add(input1,input2);
        return resultOfTWoNumber;
    }
    @AuraEnabled(cacheable=true)
    public static Integer subractionOfTwoNumbers(Integer input1,Integer input2)
    {
        CalculatorSoapClass.CalculatorSoap subraction = new CalculatorSoapClass.CalculatorSoap();
        Integer resultOfTWoNumber = subraction.Subtract(input1,input2);
        return resultOfTWoNumber;
    }
    @AuraEnabled(cacheable=true)
    public static Integer multiplicationOfTwoNumbers(Integer input1,Integer input2)
    {
        CalculatorSoapClass.CalculatorSoap mul = new CalculatorSoapClass.CalculatorSoap();
        Integer resultOfTWoNumber = mul.Multiply(input1,input2);
        return resultOfTWoNumber;
    }
    @AuraEnabled(cacheable=true)
    public static Integer divisionOfTwoNumbers(Integer input1,Integer input2)
    {
        CalculatorSoapClass.CalculatorSoap division = new CalculatorSoapClass.CalculatorSoap();
        Integer resultOfTWoNumber = division.Divide(input1,input2);
        return resultOfTWoNumber;
    }
}