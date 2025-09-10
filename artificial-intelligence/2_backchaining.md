# Back-Chaining

## If-Then Reasoning
- Knowledge base that only consists of:
  - ***Atomic Sentences***: simple primitives (facts like "I am a student")
  - ***Conditional Sentences***: if P1 and P2 and ... PN, then Q
    - Pi and Q are atomic sentences

- Notation
  - ***Variables*** will be written in capital letters
  - ***Constants*** will be written in lower case

## Back-Chaining
- back-chaining is a computational procedure for deriving new conclusion

Query (i.e, goal): Given a KB, establish atomic sentence Q is true
1. If Q is in KB, done
2. Find a sentence of the form "if P1 and ... Pn, then Q"
3. Establish each of Pi (i.e, call back-chaining with Pi as query)

- if sentence has variables, you will need to replace variable with atoms

## Example
***The Knowledge Base***
1. tesla123 is a sedan.
2. rav456 is a suv.
3. tesla123 is electric.
4. if (X is a suv) then (X is a car)
5. if (X is a sedan) then (X is a car)
6. if (X is a car) and (X is electric) then (X is an ev)

**Example 1**
Establish "tesla123 is a sedan"

```
Q = "tesla123 is a sedan"

a) match on 1

success.
```

**Example 2**
Establish "rav456 is a car"
```
asdfas
```

**Example 3**
Establish "tesla123 is an ev"
```
asdfasdf
```

