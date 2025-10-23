# Prolog Lists

## Intro To Lists

- often working on a collection of objects
  - a list is just an ordered collection of objects

- Prolog lists are like Python lists
  - enclosed in square brackets `[]`
  - elements separated by commas
  - `[intro, to, programming, in, prolog]` -> a five item list of atoms
  - `[cat, 42]` -> can mix types in a list
  - `[]` -> the empty list
  - `[[nested, list], [[doublenested]]]` -> a list can contain other lists

- The list `[a]` is different than the list `[[intro]]`

## Heads and Tails

- Consider the list `[a, b, c, d]`
  - the element `a` is called the *head* of the list
  - the list `[b, c, d]` is called the *tail* of the list

- Consider the list `[a]`
  - the head is `a`
  - the tail is the empty list `[]`

- Consider the empty list `[]`
  - it has no head or tail

## Matching

- in order to use this notation, must match different terms
  - same matching that happens when back-chaining

- Suppose we have the query `p(a, U)`
  - `p(a, b)` matches with `U = b`
  - `p(a, f(c))` matches with `U = f(c)`
  - `p(a, a)` matches with `U = a`

## Matching Lists
- lists match as follows
  - when they are identical, element by element
  - if one or more lists have variables, when the variables can be given values that make the lists identical, element for element

## Examples of Matching Pairs
- `[]` matches with `[]`
- `[a, b, c]` matches with `[a, b, c]`
- `[X]` and `[a]` with `X = a`
- `[X]` and `[Y]` with X = _978 and Y = _978

## Examples of Non-Matching Pairs
- `[]` and `[a]` do not match
- `[a, b]` and `[a, b, c]` do not match
- `[a, b, c]` and `[a, c, b]` do not match
- `[a, b, c]` and `[a, X, a]` do not match
- `[]` and `[[]]` do not match

## List Representations
- The "usual form": `[a, b, c, d]`
- Seperating into "parts": `[a | [b, c, d]]`
  - the head is `a`
  - the tail is `[b, c, d]`
- `[a, b | [c, d]]`: a and b are first two elements, rest is `[c, d]`
  - equivalent to `[a, b, c, d]`
- `[a, b, c, d | []]` is also equivalent to `[a, b, c, d]`

## Why use [H | T] notation?

- the notation makes it easy to do list iteration

- `A = [a, b, c, d], B = [H | T], A = B`
  - sets H = a, and T = [b, c, d]

- can then do C = [H2 | T2], C = T
  - sets H2 = b, and T2 = [c, d]


## Examples of Matching Pairs
- X and [a, b, c] with X = [a, b, c]
- [a | [b, c] ] and [a, b, c]
- [a | [b | [c] ] ] and [a, b, c]
- [a | [b, c] ] and [X | Y] with X = a and Y = [b, c]
- [X | Y] and [a] with X = x and Y = []

## Examples of Non-matching pairs
- [X|Y] and []
- [a | [b, [c] ] and [a, b, c]
- [a, b, c] and [X | [Y] ]

## Computing With Lists
- suppose we want to create predicate head(X, Y)
  - holds iff Y is a non-empty list and X is its first element

- Y must have at least one element, and first element must be X
  - So Y = [X | Z]