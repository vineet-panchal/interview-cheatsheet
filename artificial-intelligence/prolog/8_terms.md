# Terms

## Arguments for Predicates

- student(jennifer).
  - jennifer is a **constant** representing a specific student.
- student(X).
  - X is a **variable** that can represent any student.
- member(X, [a, b, c, d]).
  - X is a **variable** that can represent any element in the list [a, b, c, d].

## What is a Term?

- a term is a function that maps individuals (i.e., input) into a unique individual
  - it represents a data structure

- dob(4, 1, 1643)
  - maps a day, month, and year to a specific date

- person(issac, newton, dob(4, 1, 1643))
  - maps the names and date to a specific individual

## Formal Definition of Terms
- the following are terms:
  - constants (e.g., jennifer, issac, newton)
  - variables (e.g., X, Y, Z)
  - compound terms (e.g., dob(4, 1, 1643), person(issac, newton, dob(4, 1, 1643)))
  - lists (e.g., [a, b, c], [Head | Tail])

## Predicates vs Terms
- syntactically, they are almost the same
- a predicate states a relationship between its arguments
  - it is either true or false
  - 2 < 7 + 3

- a term specifies an individual
  - it is a function that "returns" that individual
  - 7 + 3

## Database About Families
- consider the database with following predicate:
  - family(ListOfParents, ListOfChildren)

- two terms
  - person(FirstName, LastName, DOB)
  - dob(Day, Month, Year)

