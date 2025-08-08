# Introduction To Haskell

## Functional Programming
### Higher-Order Functions
###### - can return functions or accept them as arguments
### First-Class Functions
###### - can be passed as arguments, returned as values
###### - think of them as values, just like integers or floats
### Pure Functions
###### - functions that have no side effects, no interaction with world outside of local scope
###### - easier to verify correctness, thread-safe when no data dependecy is present

### Strict (eager) vs. Non-Stict (lazy) evaluation
###### Strict: evaluate function arguments before invoking the function
###### Lazy: evaluates arguments if their value is required to invoke the function

## Haskell Intro
### Purely Functional
###### - every function is pure
###### - no statements, only expressions
###### - cannot mutate variables (local or global)
###### - supports pattern matching
###### - even side-effect inducing operations are produced by pure code
###### - side effects are handled using monads

### Statically Typed
###### - every expression has a type, determined at compile time
###### - types composing expressions must match, if not, compile error

### Type Inference
###### - types don't have to be written out explicitly, though you can if you want
###### - they will be inferred at compile time

### Lazy Evaluation
###### - functions don't evaluate their arguments
###### - expressions bound to variables don't evaluate unless the result is used
###### - computation never takes place unless a result is used

### Concurrency 
###### - GHC (Haskell compiler) includes high performance parallel garbage collector
###### - Light-weight concurrency library

### The First Program
#### ghci, Haskell interative shell
#### main() is the entry point of a Haskell program
```haskell
-- simple.hs
main = putStrLn "Hello, World!"
```
```bash
/> ghc -o a simple.hs
/> a
Hello, World!
```

### Literals & Arithmetic
```bash
/> ghci
ghci> 5 + 3
8
ghci> 5 * 3
15
ghci> 5 / 3
1.6666666666666667
ghci> 5 `mod` 3 
2
ghci> 1+2*3
7
ghci> 1 / 2 
0.5
ghci> sqrt 2
1.4142135623730951
ghci> sprt (2)
1.4142135623730951
ghci> 2^2 
4
```

### Tuples
```bash
/> ghci
ghci> let t = (1, 2, 3)
ghci> t
(1,2,3)
ghci> let (a, b, c) = t
ghci> a
1
ghci> (3, 5)
(3,5)
ghci> let (a, b) = (3, 5)
ghci> a
3
ghci> (5, "hello")
(5,"hello")
ghci> fst (5, "hello")
5
ghci> snd (5, "hello")
"hello"
ghci> (1, 2, 3, "Hello", "World")
(1,2,3,"Hello","World")
ghci> fst (1, 2, 3)
error: couldn't match expected type '(a, b0)' with actual type '(Integer, Integer, Integer)'
• In the first argument of ‘fst’, namely ‘(1, 2, 3)'
• In the expression: fst (1, 2, 3)
• Relevant bindings include (line 1): t :: (Integer, Integer, Integer) (bound at <interactive>:1)
```

### Lists
```bash
/> ghci
ghci> [1, 2, 3]
[1,2,3]
ghci> [1, 1.0, 2, 2.0]
[1.0,1.0,2.0,2.0]
ghci> 0:[1, 2]
[0,1,2]
ghci> [1, 2] ++ [3, 4]
[1,2,3,4]
ghci> 0:1:2:3:4:[]
[0,1,2,3,4]
ghci> [1, 2, 3] ++ []
[1,2,3]
ghci> [(1, 2), (3, 4), (5, 6)]
[(1,2),(3,4),(5,6)]
ghci> [(1, 'a'), (3, 'b'), (5, 'c')]
[(1,'a'),(3,'b'),(5,'c')]
ghci> [(1, "Hello"), (3, "World")]
[(1,"Hello"),(3,"World")]
ghci> [(1, "Hello"), (2, 3.4)]
error: could not deduce (Fractional [Char])
from the context: (Fractional [Char])
• The type variable ‘a0’ is ambiguous
• In the expression: (2, 3.4)
• Relevant bindings include (line 1): t :: [(Integer, [Char])]
```

### Strings
```bash
/> ghci
ghci> "hello"
"hello"
ghci> "hello" ++ " world"
"hello world"
ghci> "hello" ++ [' ']
"hello "
ghci> 'H':'e':'l':'l':'o':[]
"Hello"
ghci> ['H':'e':'l':'l':'o']
"Hello"
ghci> ['H':'e':'l':'l':'o'] ++ []
"Hello"
ghci> "Hello, " ++ 5.0
error: • Couldn't match expected type ‘String’ with actual type ‘Double’
• In the expression: 5.0
• In the expression: "Hello, " ++ 5.0
```
```bash
/> ghci
ghci> "This is " ++ "Haskell part " ++ show 1
"This is Haskell part 1"
ghci> "This is " ++ "Haskell part " ++ show (1 + 2)
"This is Haskell part 3"
ghci> read "506" - 6
502
ghci> read "506" - 6 :: Int
502
ghci> read "506" - 6 :: Integer
502
ghci> read "506" - 6 :: Double
502.0
ghci> read "506" - 6 :: Float
502.0
ghci> read "506" - 6 :: Char
error: • Couldn't match expected type ‘Char’ with actual type ‘Integer’
• In the expression: read "506" - 6 :: Char
• In the expression: read "506" - 6 :: Char
```

### Operations On Lists
###### - in functional programming, computation is done in large part by operating on lists.
###### - 3 primary list processing functions: map, filter, foldr, and foldl

#### Head and Tail
```bash
/> ghci
ghci> head [1, 2, 3]
1
ghci> tail [1, 2, 3]
[2,3]
ghci> head []
*** Exception: Prelude.head: empty list
ghci> tail []
*** Exception: Prelude.tail: empty list
ghci> tail [1]
[]
ghci> head [1]
1
```

#### Map
###### - map operates on lists
```bash
/> ghci
ghci> map (+1) [1, 2, 3]
[2,3,4]
ghci> map Data.Char.toUpper "Hello, World!"
"HELLO, WORLD!"
ghci> map (\x -> x * x) [1, 2, 3]
[1,4,9]
```

#### Filter
###### - remove items from a list based on some criteria
```bash
/> ghci
ghci> filter odd [1, 2, 3, 4, 5]
[2, 4]
ghci> filter (> 3) [1, 2, 3, 4, 5]
[1, 2, 3]
ghci> filter (\x -> x > 3) [1, 2, 3, 4, 5]
[1, 2, 3]
ghci> filter Data.Char.isLower "Hello, World!"
"elloorld"
```

#### Infix Functions
###### - use symbolic operators as functions
```bash
/> ghci
ghci> 2 + 3
5
ghci> (+) 2 3
5
ghci> (*) 5 10
50
ghci> (/) 5 10
0.5
```

#### foldl, foldr
###### - the list [1, 2, 3, 4, 5] is actually seen like this 1:2:3:4:5:[], by the compiler
###### - foldl and foldr replaces the cons operator with some other function
###### - foldr is right associative, and foldl is left associative
##### foldr (+) 0 [1, 2, 3, 4, 5]
###### - 3 arguments, (+) - function, 0 - initial value, [1, 2, 3, 4, 5] - list
##### foldr (+) 0 [1, 2, 3, 4, 5]
##### foldr (+) 0 1:2:3:4:5:[]
##### 1 + 2 + 3 + 4 + 5 + 0 = 15
##### (1 + (2 + (3 + (4 + (5 + 0)))))
##### foldr (-) 1 [4, 8, 5]
##### 4 - 8 - 5 - 1 = 0
##### (4 - (8 - (5 - 1)))
```bash
/> ghci
ghci> foldl (+) 0 [1, 2, 3, 4, 5]
15
ghci> foldr (*) 1 [1, 2, 3, 4, 5]
120
ghci> foldr (-) 1 [4, 8, 5]
0
```

##### foldl (-) 1 [4, 8, 5]
###### 1 - 4 - 8 - 5 = -16
###### ((1 - 4) - 8) - 5
```bash
/> ghci
ghci> foldl (-) 1 [4, 8, 5]
-16
```

### List Generation
##### List declaration: list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
##### can be written as: list = [1..9]
##### specify an interval: list = [1, 3..9] = [1, 3, 5, 7, 9]
```bash 
/> ghci
ghci> list = [1..9]
ghci> list
[1,2,3,4,5,6,7,8,9]
ghci> list = [1, 3..9]
ghci> list
[1,3,5,7,9]
ghci> [1..]
[1,2,3,4,5,6,7,8,9,10^C
```
```bash
/> ghci
ghci> list = [1..]
ghci> length list
Interrupted.
ghci> take 10 list
[1,2,3,4,5,6,7,8,9,10]
ghci> take 3 (drop 5 list)
[6,7,8]
ghci> x = [1..]
ghci> zip "Hello" x
[('H',1),('e',2),('l',3),('l',4), ('o',5)]
```

### Functions In Haskell
###### - functions are central in Haskell
###### - if we're compiling our code into an executable, we need a main function
###### - if we're using the GHCi shell, we don't
###### Ex: define function called square that takes on argument x
```bash
/> ghci
ghci> square x = x * x
ghci> square 5
25
ghci> square (sqrt 2)
2.0000000000000004
```
#### Three components to every function
##### sum a b c d = a + b + c + d
##### function named sum: sum
##### parameter list: a b c d
##### expression to evaluate: a + b + c + d
```bash
/> ghci
ghci> sum a b c d = a + b + c + d
ghci> sum 1 2 3 4
10
ghci> square x = x * x
ghci> cube x = x * x * x
ghci> sum (square 2) (cube 2) 3 4
19
```

### Modules
```haskell
-- Test.hs
module Test where
  square x = x * x
  cube x = x * x * x
  sum a b = a + b
```
```bash
/> ghci 
ghci> :load Test.hs
ghci> square 2
4
ghci> :l square
square :: Num a = a -> a
```

### Control Structures
#### if then else
```bash
/> ghci
ghci> f x = if x < 0 then 0 else 1
ghci> f 67
1
ghci> f 0
1
ghci> f (-6)
0
ghci> f -6
error: Non type-variable argument in the constraint
```

#### Indenting In Haskell
###### - code which is part of some expression should be indented further than the beginning of that expression

```haskell
-- Test.hs
module Test where
  square x = x * x
  cube x = x * x * x
  sum a b = a + b

  sign x = 
    if x < 0 then -1
    else if x > 0 then 1
    else 0
```

#### Local Names In Functions
###### - when binding a name inside a function, we use the "let" keyword
```haskell
-- Test.hs
module Test where
  sign x = do
    let q = x
    if q < 0 then -1
    else if q > 0 then 1
    else 0
```

#### Multiple Expressions
```haskell
-- Test.hs
module Test where
  sign x = do -- have to the do keyword
    let q = x
    if q < 0 then -1
    else if q > 0 then 1
    else 0
-- now there are 2 expressions in this function
```
```bash
ghci> :load Test.hs
[1 of 1] Compiling Test             ( Test.hs, interpreted )
*Test> sign 0
0
*Test> sign 42
1
*Test> sign (-42)
-1
```

#### Return Multiple Things?
```haskell
-- Test.hs
module Test where
  roots a b c =
    ((-b + sqrt(b*b - 4*a*c)) / (2*a),
      (-b - sqrt(b*b - 4*a*c)) / (2*a))
```

#### let/in Expression
###### - ensures one expression (let/in)
###### - we don't need to add do keyword 
```haskell
-- Test.hs
module Test where
  roots a b c = 
    let disc = sqrt(b * b - 4 * a * c)
    in ((-b + disc) / (2 * a),
        (-b - disc) / (2 * a))
```
```bash
ghci> :load Test.hs
[1 of 1] Compiling Test             ( Test.hs, interpreted )
*Test> roots 1 0 (-4)
(-2.0,-2.0)
*Test> roots 1 2 (-6)
(1.6457513110645907, -3.6457513110645907)
*Test> roots 1 (-2) 4
(NaN, NaN)
```

#### Case Expression
```haskell
-- Test.hs
module Test where
  isNum x = 
    case x of
      0 -> 0
      1 -> 1
      2 -> 2
      _ -> -1
  
  sign x = do
    let q = x
    if x < 0 then -1
    else if x > 0 then 1
```
```bash
ghci> :load Test.hs
*Test> isNum 0
0
*Test> isNum 1
1
*Test> isNum 2
2
*Test> isNum 999
-1
```

```haskell
-- Test.hs
module Test where
  chkClr rgb = 
    case rgb of
      (255, 255, _) -> "YELLOW"
      (255, _, 255) -> "MAGENTA"
      (_, 255, 255) -> "CYAN"
      -- put the most constrained cases at the top
      (255, _, _) -> "RED"
      (_, 255, _) -> "GREEN"
      (_, _, 255) -> "BLUE"
      (_, _, _) -> "None"
```
```bash
ghci> :load Test.hs
*Test> chkClr (255, 255, 0)
"YELLOW"
*Test> chkClr (255, 0, 255)
"MAGENTA"
*Test> chkClr (0, 255, 255)
"Cyan"
*Test> chkClr (255, 0, 0)
"RED"
*Test> chkClr (0, 255, 0)
"GREEN"
*Test> chkClr (0, 0, 255)
"BLUE"
*Test> chkClr (0, 0, 0)
"None"
```

#### Piecewise Functions
```haskell
-- Test.hs
module Test where
  fac 0 = 1
  fac n = n * fac (n-1)

  fib 0 = 0
  fib 1 = 1
  fib n = fib (n-1) + fib (n-2)

  chkAxis (0, _) = (0, 1)
  chkAxis (_, 0) = (1, 0)
  chkAxis (x, y) = (x, y)
  -- return unit vector if point lies on axis
  -- return input point otherwise
```
```bash
ghci> :load Test.hs
*Test> fac 5
120
*Test> fib 10
55
*Test> chkAxis (0, 3)
(0,1)
*Test> chkAxis (4, 0)
(1,0)
*Test> chkAxis (4, 3)
(4,3)
```

#### Functions: Guards
```haskell
-- Test.hs
module Test where
  cmp2 x y  | x < y = "First is smaller"
            | x > y = "Second is smaller"
            | otherwise = "Both are equal"
  -- matches input arguments to x and y
  -- guards denoted with |
  -- otherwise is the same as True
```
```bash
ghci> :load Test.hs
*Test> cmp2 3 5
"First is smaller"
*Test> cmp2 5 3
"Second is smaller"
*Test> cmp2 5 5
"Both are equal"
```

#### Recursion
```haskell
module Test where
  llen [] = 0
  llen x = 1 + llen(tail x)
  -- length of list
```
```bash
ghci> :load Test.hs
*Test> llen [1, 2, 3, 4, 5]
5
*Test> llen [1, 2, 3]
3
*Test> llen []
0
```

#### Recursion: cons
```haskell
module Test where
  llen [] = 0
  llen (x:xs) = 1 + (llen xs)
```
```bash
ghci> :load Test.hs
*Test> llen [1, 2, 3, 4, 5]
5
*Test> llen [1, 2, 3]
3
*Test> llen []
0
```

#### Recursion: filter
```haskell
module Test where
  pos x = x >= 0 -- returns true if x >= 0, false otherwise

  filt p [] = [] -- base case if the list is empty
  filt p (xh:xt) = 
  -- otherwise call function p with the head of the list
    if p xh then xh : filt p xt
    -- if true, append it to the running list
    else filt p xh
    -- if false, ignore it and continue with the rest of the list
```
```bash
ghci> :load Test.hs
*Test> filt pos [1, -2, 3, -4, 5]
[1,3,5]
*Test> filt pos [-1, -2, -3, -4, -5]
[]
```

#### Function Composition
```bash
ghci> :load Test.hs
*Test> fac(fib(4))
6
*Test> (fac.fib) 4
6
*Test> fac(fib(5))
120
*Test> (fac.fib) 5
120
*Test> fac(fib(6))
40320
*Test> (fac.fib) 6
40320
```

#### Lambda Functions
```bash
ghci> :load Test.hs
*Test> square = \x -> x * x
*Test> square 5
25
*Test> (\x -> x * x) 5
25
*Test> f = \x y -> 2*x + y
*Test> f 3 4
10
*Test> (\x -> True) True
True
*Test> (\x -> True) False
True
*Test> (\x -> not x) False
True
*Test> (\x -> not x) True
False
*Test> map (\x -> -x) [1, -3, 5, 6, -9]
[-1,3,-5,-6,9]
```