# Recursion On Lists

- list operations are often naturally done recursively

- The main reason is that lists are composed of lists
- A list is either:
  - the empty list `[]`
  - or a head element followed by a tail list `[Head|Tail]`

## member(a, [b, c, a, d])
- knowledge base:
```
1. member(E, [E | T]).
2. member(E, [H | T]) :- member(E, T).
```

## member(q, [b, c, a, d])
- knowledge base:
```
1. member(E, [E | T]).
2. member(E, [H | T]) :- member(E, T).
```

## member(X, [a, b, c])
- knowledge base:
```
1. member(E, [E | T]).
2. member(E, [H | T]) :- member(E, T).
```

## Appending Two Lists
- append(L1, L2, L) holds when L is the result of joining L1 and L2 together

- Examples:
  - append([a, b], [c, d, e], [a, b, c, d, e])
  - append([], [a, b], [a, b])
  - append([a, b], [], [a, b])
  - append([], [], [])

## Implementing Append

- Base Case:

```

```

- Recursive Call:
```

```

## append([a, b], [c, d, e], L)
- knowledge base:
```
append([], L, L).
append([H | L1], L2, [H | L3]) :- append(L1, L2, L3).
```

