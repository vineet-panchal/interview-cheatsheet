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

## Unit Clauses
- atoms like ```car(tesla123)``` are also called ***unit clauses*** (or clauses)
  - a unit clause ```a``` has ```a``` as its head and an empty body

- you can write a unit clause in a PROLOG file as
```prolog
a.
% or as
a :- .  % not recommended
```
- PROLOG programs are just sequences of clauses
  - unit clauses and rules

## Example Of A PROLOG Program
```prolog
hasAccount(jennifer).  % 1)
hasAccount(tony).      % 2)
hasAccount(tim).       % 3) 
hasAccount(sam).       % 4)
hasAccount(michelle).  % 5)

connected(jennifer, tony).  % 6)
connected(tony, jennifer).  % 7)
connected(tony, tim).       % 8)
connected(tim, tony).       % 9)

student(jennifer).  % 10)
student(sam).       % 11) 
student(michelle).  % 12) 

worksAt(jennifer, google, 2020).  % 13)
worksAt(tony, bell, 2015).        % 14)
worksAt(tim, apple, 2022).        % 15)

endedWorkingAt(tony, bell, 2019).  % 16)

degree2Connection(X, Y) :- connected(X, Z), connected(Z, Y), not X = Y.  % 17)

atCompany(X, Y) :- worksAt(X, Y, S), not endedWorkingAt(X, Y, E).  % 18)

unemployed(X) :- hasAccount(X), not student(X), not atCompany(X, Y).  % 19)

connectionAtCompany(P1, P2, C) :- connected(P1, P2), atCompany(P2, C).          % 20)
connectionAtCompany(P1, P2, C) :- degree2Connection(P1, P2), atCompany(P2, C).  % 21)
```