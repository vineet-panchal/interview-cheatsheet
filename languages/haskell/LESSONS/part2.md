# Types, Type Inference, Type Classes

## Types In Haskell
### Statically Typed
###### - Haskell uses static type checking
###### - every expression is assigned a type
###### - if a function's arguments aren't the expected type, a compiler error occurs

### Type Inference
###### - in Haskell, we do not need to specify type explicitly
###### - it is inferred by the context: X = "Hello", X is a string
###### - however, we can explicitly specify types

##### :t can be used to reveal type
```bash
/> ghci
ghci> :t 1
1 :: Num p => p
ghci> :t "Hello"
"Hello" :: [Char]
ghci> :t 1.0
1.0 :: Fractional p => p
ghci> :t 'a'
'a' :: Char
ghci> :t 1 > 2
1 > 2 :: Bool
```

## Type Class
###### - consider the equality (==) operator: 
###### - it takes two arguments, each of the same type (a), and returns a Boolean
###### - this operator may not be defined for all types, just some
###### - we can associate == with a specific type class containing those types for which == is defined
###### - this is called Eq in Haskell

### Eq Type Class
###### - (==) is defined for types in typeclass Eq
###### - (==) takes two args of type a, where a is a member of type class Eq
###### - it returns Boolean
###### - if a concrete type, a, belongs to a certain type class, we say a is an instance of that type class
```bash
/> ghci
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool
ghci> :i Eq
type Eq :: * -> Constraint
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  {-# MINIMAL (==) | (/=) #-}
  	-- Defined in ‘GHC.Classes’
instance (Eq a, Eq b) => Eq (Either a b)
  -- Defined in ‘Data.Either’
instance Eq a => Eq (Maybe a) -- Defined in ‘GHC.Maybe’
instance Eq Integer -- Defined in ‘GHC.Num.Integer’
instance Eq () -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b) => Eq (a, b) -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c) => Eq (a, b, c)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d) => Eq (a, b, c, d)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e) => Eq (a, b, c, d, e)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f) =>
         Eq (a, b, c, d, e, f)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g) =>
         Eq (a, b, c, d, e, f, g)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h) =>
         Eq (a, b, c, d, e, f, g, h)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i) =>
         Eq (a, b, c, d, e, f, g, h, i)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
          Eq j) =>
         Eq (a, b, c, d, e, f, g, h, i, j)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
          Eq j, Eq k) =>
         Eq (a, b, c, d, e, f, g, h, i, j, k)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
          Eq j, Eq k, Eq l) =>
         Eq (a, b, c, d, e, f, g, h, i, j, k, l)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
          Eq j, Eq k, Eq l, Eq m) =>
         Eq (a, b, c, d, e, f, g, h, i, j, k, l, m)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
          Eq j, Eq k, Eq l, Eq m, Eq n) =>
         Eq (a, b, c, d, e, f, g, h, i, j, k, l, m, n)
  -- Defined in ‘GHC.Classes’
instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
          Eq j, Eq k, Eq l, Eq m, Eq n, Eq o) =>
         Eq (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)
  -- Defined in ‘GHC.Classes’
instance Eq Bool -- Defined in ‘GHC.Classes’
instance Eq Char -- Defined in ‘GHC.Classes’
instance Eq Double -- Defined in ‘GHC.Classes’
instance Eq Float -- Defined in ‘GHC.Classes’
instance Eq Int -- Defined in ‘GHC.Classes’
instance Eq Ordering -- Defined in ‘GHC.Classes’
instance Eq a => Eq (Solo a) -- Defined in ‘GHC.Classes’
instance Eq Word -- Defined in ‘GHC.Classes’
instance Eq a => Eq [a] -- Defined in ‘GHC.Classes’
```
###### - Int is an instance of Eq

#### Num Type Class
###### - this grants numeric values freedom to be an integer or floating point as the compiler sees fit
###### - Num class contains all numbers, and certain operations over them such as addition
```bash
/> ghci
ghci> :t 5
5 :: Num a => a
ghci> :i Num
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
  	-- Defined in ‘GHC.Num’
instance Num Double -- Defined in ‘GHC.Float’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
```

### Show Type Class
###### - types that are members of the Show class have functions which convert their value to a String
```bash
/> ghci
ghci> :t show
show :: Show a => a -> String
ghci> :i show
type Show :: * -> Constraint
class Show a where
  ...
  show :: a -> String
  ...
  	-- Defined in ‘GHC.Show’
ghci> show 5
"5"
ghci> show 'A'
"'A'"
ghci> show "Hello, World"
"\"Hello, World\""
```

### Functions Type Class
###### - based on what we're doing in square and sum ...
###### - Haskell determined that input and output type should be instances of typeclass Num
###### - (+) and (*) are both defined for all types in typeclass Num
```bash
/> ghci
ghci> square x = x * x
ghci> :t square
square :: Num a => a -> a
ghci> sum a b c = a + b + c
ghci> :t sum
sum :: Num a => a -> a -> a -> a
ghci> :t head
head :: [a] -> a
ghci> :t tail
tail :: [a] -> [a]
ghci> :t fst
fst :: (a, b) -> a
ghci> :t snd
snd :: (a, b) -> b
ghci> :t putStrLn
putStrLn :: String -> IO ()
```

### Specifying Function Type
###### - chkAxis takes a pair-tuple of Floats as input, and returns the same as output
###### - instead of constants being of type Num or Fractional, they are treated as Floats
```haskell
module Test where
  chkAxis :: (Float, Float) -> (Float, Float)
  chkAxis (0, _) = (0, 1)
  chkAxis (_, 0) = (1, 0)
  chkAxis (x, y) = (x, y)
```
```bash
/> ghci
ghci> :load Test.hs
ghci> :t chkAxis
chkAxis :: (Float, Float) -> (Float, Float)
ghci> chkAxis (0, 1)
(0.0,1.0)
ghci> chkAxis (1, 0)
(1.0,0.0)
ghci> chkAxis (1, 1)
(1.0,1.0)
```
```haskell
module Test where
  cmp2 :: Int -> Int -> [Char]
  cmp2 x y | x < y = "First is smaller"
            | x > y = "Second is smaller"
            | otherwise = "Both are equal"
```
```bash
/> ghci
ghci> :load Test.hs
ghci> :t cmp2
cmp2 :: Int -> Int -> [Char]
ghci> cmp2 1 2
"First is smaller"
ghci> cmp2 2 1
"Second is smaller"
ghci> cmp2 2 2
"Both are equal"
ghci> cmp2 1.1 1.2
error: No instance for (Fractional Int) arising from the literal '1.1'
```

#### Ord Type Class
###### - when we don't explicitly define our types, Haskell inferred the type for us
###### - Ord is a type class under which the operations used on our inputs are defined
###### - Ord is a type class that supports comparison
```haskell
module Test where
  cmp2 :: Ord a => a -> a -> [Char]
  cmp2 x y | x < y = "First is smaller"
            | x > y = "Second is smaller"
            | otherwise = "Both are equal"
  -- we specify a is an instance of Ord
  -- cmp2 accepts two instances of Ord as arguments
  -- Ord contains many different types, a can be any of them
```
```bash
/> ghci
ghci> :load Test.hs
ghci> :t cmp2
cmp2 :: Ord a => a -> a -> [Char]
ghci> :i Ord
type Ord :: * -> Constraint
class Prelude.Eq a => Ord a where
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a
  {-# MINIMAL compare | (<=) #-}
  	-- Defined in ‘GHC.Classes’
instance (Ord a, Ord b) => Ord (Either a b)
  -- Defined in ‘Data.Either’
instance Ord a => Ord (Maybe a) -- Defined in ‘GHC.Maybe’
instance Ord Integer -- Defined in ‘GHC.Num.Integer’
instance Ord () -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b) => Ord (a, b) -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c) => Ord (a, b, c)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d) => Ord (a, b, c, d)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e) => Ord (a, b, c, d, e)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f) =>
         Ord (a, b, c, d, e, f)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g) =>
         Ord (a, b, c, d, e, f, g)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g,
          Ord h) =>
         Ord (a, b, c, d, e, f, g, h)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i) =>
         Ord (a, b, c, d, e, f, g, h, i)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i, Ord j) =>
         Ord (a, b, c, d, e, f, g, h, i, j)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i, Ord j, Ord k) =>
         Ord (a, b, c, d, e, f, g, h, i, j, k)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i, Ord j, Ord k, Ord l) =>
         Ord (a, b, c, d, e, f, g, h, i, j, k, l)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i, Ord j, Ord k, Ord l, Ord m) =>
         Ord (a, b, c, d, e, f, g, h, i, j, k, l, m)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i, Ord j, Ord k, Ord l, Ord m, Ord n) =>
         Ord (a, b, c, d, e, f, g, h, i, j, k, l, m, n)
  -- Defined in ‘GHC.Classes’
instance (Ord a, Ord b, Ord c, Ord d, Ord e, Ord f, Ord g, Ord h,
          Ord i, Ord j, Ord k, Ord l, Ord m, Ord n, Ord o) =>
         Ord (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)
  -- Defined in ‘GHC.Classes’
instance Ord Bool -- Defined in ‘GHC.Classes’
instance Ord Char -- Defined in ‘GHC.Classes’
instance Ord Double -- Defined in ‘GHC.Classes’
instance Ord Float -- Defined in ‘GHC.Classes’
instance Ord Int -- Defined in ‘GHC.Classes’
instance Ord Ordering -- Defined in ‘GHC.Classes’
instance Ord a => Ord (Solo a) -- Defined in ‘GHC.Classes’
instance Ord Word -- Defined in ‘GHC.Classes’
instance Ord a => Ord [a] -- Defined in ‘GHC.Classes’
```
###### - Int is an instance of Ord type class, so when we made our function arguments explicitly Int, we were Ok

```haskell
module Test where
  cmp2 :: Num a => a -> a -> [Char]
  cmp2 x y | x < y = "First is smaller"
            | x > y = "Second is smaller"
            | otherwise = "They are equal"
```
```bash
/> ghci
ghci> :load Test.hs
*Test> cmp2 1 1
error: could not deduce (Ord a) arising from a use of '<'
from the context: Num a
bound by the type signature for:
cmp2 :: Num a => a -> a -> [Char]
at Test.hs:2:1-15
The type variable ‘a’ is ambiguous
Note that Num a’ is a rigid type variable, hence the error message
```

###### - this is because Num type class does not define comparion

###### - so if Num doesn't have comparison, and Ord doesn't have addition, what does Haskell infer x and y in this following example:
```haskell
module Test where
  cmp2 x y | x + 1 < y + 1 = "First is smaller"
            | x + 1 > y + 1 = "Second is smaller"
            | otherwise = "They are equal"
```
```bash
/> ghci
ghci> :load Test.hs
*Test> :t cmp2
cmp2 :: (Ord a, Num a) => a -> a -> [Char]
```
###### - both!, whatever type we pass in a, it must be an instance of both Ord and Num
###### - Int is one such type, as is Float

## Custom Data Types

##### Ex: data Pt3 = Pt3 Float Float Float
###### data => keyword indicating a custom type definition
###### Pt3 => custom type name
###### Pt3 Float Float Float => constructor for our custom type, to construct Pt3, we need 3 Float values
```haskell
module Test where
  data Pt3 = Pt3 Float Float Float
```
```bash
/> ghci
ghci> :load Test.hs
*Test> :t Pt3
Pt3 :: Float -> Float -> Float -> Pt3
*Test> coord = Pt3 1 2 3
*Test> coord
error: No instance for (Show (Pt3 a0))
arising from a use of `print'
```
###### - the values contained in Pt3 are Float, and we know that Float is an instance of Show
###### - how can we access the individual elements of Pt3?
###### - three access functions, one for each of the three values
###### - take as arguments Pt3 (and by extension its three members)
###### - return x, y, or z coordinate respectively
```haskell
module Test where
  data Pt3 = Pt3 Float Float Float
  ptX (Pt3 x y z) = x
  ptY (Pt3 x y z) = y
  ptZ (Pt3 x y z) = z
```
```bash
/> ghci
ghci> :load Test.hs
*Test> coord = Pt3 1 2 3
*Test> ptX coord
1.0
*Test> ptY coord
2.0
*Test> ptZ coord
3.0
```

###### - adding another function Pt2 that takes two arguments
###### - name of our data type is now simply Pt
```haskell
module Test where
  data Pt = Pt3 Float Float Float
          | Pt2 Float Float
  
  ptX (Pt2 x _) = x
  ptX (Pt3 x _ _) = x

  ptY (Pt2 _ y) = y
  ptY (Pt3 _ y _) = y

  ptZ (Pt3 _ _ z) = z
```
```bash
/> ghci
ghci> :load Test.hs
*Test> coord = Pt3 1 2 3
*Test> ptX coord
1.0
*Test> ptY coord
2.0
*Test> ptZ coord
3.0
*Test> coord2 = Pt2 1 2
*Test> ptX coord2
1.0
*Test> ptY coord2
2.0
```

### Deriving Show
```haskell
module Test where
  data pT = pt3 Float Float Float
          | pt2 Float Float
          deriving (Show)
```
###### - our custom type will inherit come default display behaviour from Show
```bash
/> ghci
ghci> :load Test.hs
*Test> coord = pt3 1 2 3
*Test> coord
pt3 1.0 2.0 3.0
*Test> coord2 = pt2 1 2
*Test> coord2
```

