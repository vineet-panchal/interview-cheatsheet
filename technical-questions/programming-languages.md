# Programming Languages Questions

## Paradigms 

#### 1. What are your two favourite programming languages and what is the difference between them?

- my two favourite programming languages are Java and Python
- Java is statically typed meaning you must declare variable types, and then it is checked at compile time
- while Python is dynamically typed and variable types are determined at runtime
- Java is also strictly object-oriented, and so everything is under a class
- while Python supports object-oriented programming but also allows functional programming styles


## Flaws/Errors of Programming Languages

#### 1. Is 0.1 + 0.2 == 0.3, true or false in Java?

- that equates to False in Java
- this happens because of floating-point precision errors, computers store decimal numbers in binary format, and some decimal numbers like 0.1 or 0.2 cannot be represented in binary
- So Java actually calculates 0.1 + 0.2 to something like 0.3000000004, which is not 0.3 and that would equate it to false
- To solve this issue, you can simple store the result of 0.1 + 0.2 in some variable, then check if the absolute value of the result - 0.3 is less than 0.001, 
- If that equals to true, then 0.1 + 0.2 == 0.3 is true
