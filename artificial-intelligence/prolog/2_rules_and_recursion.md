# PROLOG Rules and Deductive Databases

## Conditional Sentences
- for more complex reasoning, you need conditional sentences
- in PROLOG, these are called ***general rules*** or ***clauses***

```prolog
% if (X is a car) and (X is electric) then (X is an ev).
ev(X) :- car(X), electric(X).
% :- means "if"
% , means "and"
```

## Clauses
```prolog
a :- b1, ... , bn.
% a is the head
% b1, ... , bn is the body
```
- the head must be an atom (cannot use not)
- each ```bi```, in the body is an atom or negation of an atom
- read as ```a if(b1 and ... and bn)``` 

