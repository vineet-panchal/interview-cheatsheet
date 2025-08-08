module Part1 where

  -- Question 1
  -- given a list, return true if the first two elements of the list are the same, and false otherwise
  -- if the list is less than 2 elements, return False
  firstTwoEqual :: [Integer] -> Bool
  firstTwoEqual [] = False
  firstTwoEqual [x] = False
  firstTwoEqual (x : y : xs) = x == y



  -- Question 2
  -- given a list, insert integer 99 into the second position of the list and return list
  -- if the list is empty, return an error
  nextNineNine :: [Integer] -> [Integer]
  nextNineNine [] = error "List is empty"
  nextNineNine (x : xs) = x : 99 : xs 



  -- Question 3
  -- give a list, remove teh head from the list and append it to the back of the list
  -- if the list is empty, return an error
  frontToBack :: [Integer] -> [Integer]
  frontToBack [] = error "List is empty"
  frontToBack (hd : tl) = tl ++ [hd]



  -- Question 4
  -- given a tuple, return true if the elements of the tuple can be side lengths of a triangle, and false otherwise
  -- if the input is anything other than a 3-tuple return false
  -- if the elements of the tuple are not numeric, return false
  canBeTriangle :: (Integer, Integer, Integer) -> Bool
  canBeTriangle (a, b, c) = ((a + b) > c) && ((a + c) > b) && ((b + c) > a) 



  -- Question 5
  -- given a list, return true if the elems are strictly ascending, and false otherwise
  -- strictly larger than the element that precedes it
  -- an empty list, and a single element list, is ascending
  isAscending :: [Integer] -> Bool
  isAscending [] = True
  isAscending [_] = True
  isAscending (x : y : xs) = (x < y) && (isAscending (y : xs))



  -- Question 6
  -- return true if the given integer contains only odd digits, and false otherwise
  onlyOddDigits :: Integer -> Bool
  onlyOddDigits 0 = True
  onlyOddDigits num = 
    if num < 10 && (num `mod` 2 == 1) then True
    else if (num > 10) && (num `mod` 2 == 1) then 
      onlyOddDigits (num `div` 10)
    else False

  -- solution 2 to Question 6
  -- onlyOddDigits :: Integer -> Bool
  -- onlyOddDigits 0 = True
  -- onlyOddDigits n = (n mod 2 == 1) && onlyOddDigits (n div 10)



  -- Question 7
  -- given a tuple with a mix of elements
  -- return a string that is concatenation of all the strings in the tuple

  -- data Mixed = IntVal Int | DoubleVal Double | StringVal String deriving (Show)

  -- catStrings :: [ Mixed] -> String
  -- catStrings xs = concat [s | StringVal s <- xs]

  