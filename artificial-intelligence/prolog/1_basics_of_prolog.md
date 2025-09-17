# Basics Of Prolog

PROLOG (PROgramming in LOGic)
- declarative, non-imperative programming language
- very different than procedural, object-oriented, functional programming languages
- computation in this context means logical deduction
- constraint-based reasoning (both logical and numerical)

## History of PROLOG
- PROLOG was invented in 1971 by Alain Colmerauer and Philippe Roussel
  - based on work on automated theorm-proving by Robert Kowalski
  - initial purpose was natural language processing
  - simultaneously invented by Alan Hewitt (called "Planner")

## PROLOG Knowledge Bases
- PROLOG programs start with a knowledge base (list of facts)

## Atomic Sentences
```prolog
% examples of atomic sentences (or atoms)
hasAccount(jennifer).
student(jennifer).
connected(tony, jennifer).
worksAt(jennifer, google, 2020).
```
- jennifer, tony, google, 2020 are ***constants***
- hasAccount, student, connected, worksAt are ***predicates***ß
- Predicates have the form predName(arg1, arg2, ... , argN)
- Predicates and constants cannot start with a underscore or upper case letter
- Atoms start end with a period

## Simple Knowledge Base
- store a list of statements, usually in a ".pl" file
  - can use % for comments
- open eclipse at command line

```prolog
? - ['file.pl'].
test.pl   compiled 2080 bytes in 0.00 seconds
? - halt.
```

## Querying the Program
- examples of simple queries
```prolog
? - student(jennifer).
Yes

? - connected(tony, jennifer).
Yes

? - student(tony).        -> not in KB
No

? - connected(jennifer, tony).  -> symmetry isn't assumed
No

? - student(jennifer), connected(tony, jennifer). 
Yes
-> "is Jennifer a student that is connected to Tony?" or "is Jennifer a student and is Tony connected to Jennifer?"
-> comma means "and"

? - student(tony), student(jennifer)
No
-> only second statement is correct
```
- checks atomic statements from left to right
  - only succeeds if all succeed
  - uses lazy evaluation

## Negation in PROLOG
- use the keyword not to flip between yes or no
```prolog
? - student(tony).
No

? - not student(tony).
Yes

? - not (student(jennifer), student(tony)).
Yes
```

## Variables in PROLOG Queries
- queries with variables perform retrieval (where possible)
  - use upper case letter or underscore for variables (X or Student, or _student)
```prolog
? - student(S).

X = jennifer
Yes (maybe more);
% check for more

X = sam
Yes (maybe more);
% check for more

X = peter
Yes (maybe more);
% check for more

? -     
% couldn't find more
```

## Back-chaining in PROLOG

***The Knowledge Base***:
```prolog
hasAccount(tony).
hasAccount(sam).
hasAccount(jennifer).
hasAccount(leon).

connected(tony, sam).
connected(tony, jennifer).
connected(tony, leon).
connected(tony, henry).

student(jennifer).
student(henry).
```

***Example 1***: 
? - connected(tony, X), student(X).

```prolog
(5) ↓ X = sam       | (6) ↓ X = jennifer
      student(sam)  |       student(jennifer)
      fail          | (9) ↓ success
```
