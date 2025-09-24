# Recursion and Infinite Loops

## Examples
- consider three predicates
  - ```initLoc(X)``` -> X is a starting location
  - ```road(X, Y)``` -> there is a road from X to Y
  - ```reachable(X)``` -> X is reachable from the original locationß

```prolog
reachable(Z) :- reachable(Y), road(Y, Z).
reachable(X) :- initLoc(X).

initLoc(toronto).
road(toronto, calgary).
road(calgary, vancouver).
road(new_york, boston).
road(calgary, toronto).
road(vancouver, calgary).
road(boston, new_york).
```

***Example 1***:
reachable(vancouver).

```prolog
