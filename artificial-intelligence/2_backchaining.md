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

## Back-Chaining Examples
***The Knowledge Base***
1. tesla123 is a sedan.
2. rav456 is a suv.
3. tesla123 is electric.
4. if (X is a suv) then (X is a car)
5. if (X is a sedan) then (X is a car)
6. if (X is a car) and (X is electric) then (X is an ev)

**Example 1**: 
Establish "tesla123 is a sedan"

```
Q = "tesla123 is a sedan"

a) match on 1

success.
```

**Example 2**:
Establish "rav456 is a car"

```
Q = "rav456 is a car"

a) fail
b) match on 4 with X = rav456   // rav456 could be a car, if it is an suv
c) Establish "rav456 is a suv"  // you can show b, if you can establish that it is an suv
  "rav456 is a suv"    // check if rav456 is a suv
  a) match on 2

success.
```

**Example 3**:
Establish "tesla123 is an ev"
```
Q = "tesla123 is an ev"

a) fail
b) match on 6 with X = tesla123     // tesla123 could be an ev, if it is a car and is electric
c) Establish "tesla123 is a car and is electric"   // you can show b, if you can establish that it is a car and is electric
  "tesla123 is a car"   // check if tesla123 is a car
  a) fail
  b) match on 4 with X = tesla123    // tesla123 could be a car, if it is a suv
  c) Establish "tesla123 is a suv"   // you can show b, if you can establish that it is a suv
    "tesla123 is a suv"   // check if tesla123 is a suv
    a) fail
    b) fail
  b) match on 5 with X = tesla123    // tesla123 could be a car, if it is a sedan
  c) Establish "tesla123 is a sedan"   // you can show b, if you can establish that it is a sedan
    "tesla123 is a sedan"   // check if tesla123 is a suv
    a) match on 1    // tesla123 is a car
      "tesla123 is electric"   // check if tesla123 is electric
      a) match on 3    // tesla123 is electric

success.
```

## Retrieval
- can use back-chaining to find individuals for a given property
  - Establish "tesla123 is a car" means confirm that tesla123 is a car
  - Establish "Z is a car" means locate an individual Z that is a car

## Retrieval Examples

***Example 1***:
Establish "Z is a car"

```
Q = "Z is a car"

a) fail
b) match on 4 with X = Z
c) Establish if Z is a suv
  "Z is a suv"
  a) match on 2 with Z = rav456
  success.
  more?

  a) fail
  b) fail
b) match on 5 with X = Z
c) Establish "Z is a sedan"
  "Z is a sedan"
  a) match on 1 with Z = tesla123
  success.
  more?

  a) fail
  b) fail
b) fail

success.
```

***Example 2***:
Establish "Z is ev"

```

```