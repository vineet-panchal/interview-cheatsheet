module ExercismPractice where
  import Data.Char (toLower, isUpper, isAlpha, isSpace, isLetter, toUpper)
  import Data.Map (Map, fromList, adjust)
  import Data.List (words)

  -- Question 1 
  -- Write a function that returns "Hello, World"
  hello :: String
  hello = "Hello, World"



  -- Question 2
  -- Write a function that calculates the leap year given a year
  -- if the year is divisible by 4 and not divisible by 100, or if it is divisible by 400, then it is a leap year.
  -- return true or false
  isLeapYear :: Integer -> Bool
  isLeapYear year = 
    if year `mod` 100 == 0
      then year `mod` 400 == 0
      else year `mod` 4 == 0
  
  -- solution 2 to Question 2
  isLeapYear2 :: Integer -> Bool
  isLeapYear2 year
    | year `mod` 4 == 0 && year `mod` 100 /= 0 = True
    | year `mod` 400 == 0 = True
    | otherwise = False
  
  -- solution 3 to Question 2
  isLeapYear3 :: Integer -> Bool
  isLeapYear3 year
    | year `mod` 100 == 0 = year `mod` 400 == 0
    | otherwise = year `mod` 4 == 0



  -- Question 3
  -- reverse a given string, return the reversed string
  reverseString :: String -> String
  reverseString str = reverse str

  -- solution 2 to Question 3
  reverseString2 :: String -> String
  reverseString2 str = foldl (\acc x -> x : acc) "" str

  -- solution 3 to Question 3
  reverseString3 :: String -> String
  reverseString3 str = foldr (\x acc -> acc ++ [x]) "" str

  -- solution 4 to Question 3
  reverseString4 :: String -> String
  reverseString4 str = reverseHelper str []
    where
      reverseHelper [] acc = acc
      reverseHelper (hd:tl) acc = reverseHelper tl (hd:acc)



  -- Question 4
  -- Write a function that returns the earned points in a single toss of a Darts game
  -- if the dart lands outside the target, player earns no points
  -- if the dart lands in the outer circle of the target, player earns 1 point
  -- if the dart lands in the middle circle of the target, player earns 5 points
  -- if the dart lands in the inner circle of the target, player earns 10 points
  -- the outer circle has a radius of 10 units, the middle circle has a radius of 5 units, and the inner circle has a radius of 1 unis
  score :: Float -> Float -> Int
  score x y = 
    | dist <= 1 = 10
    | dist <= 5 = 5
    | dist <= 10 = 1
    | otherwise = 0
    where
      dist = sqrt (x^2 + y^2)



  -- Question 5
  -- given an age in seconds, calculate how old someone would be on: 
  -- Mercury: orbital period 0.2408467 Earth years
  -- Venus: orbital period 0.61519726 Earth years
  -- Earth: orbital period 1.0 Earth years
  -- Mars: orbital period 1.8808158 Earth years
  -- Jupiter: orbital period 11.862615 Earth years
  -- Saturn: orbital period 29.447498 Earth years
  -- Uranus: orbital period 84.016846 Earth years
  -- Neptune: orbital period 164.79132 Earth years
  data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune
  ageOn :: Planet -> Float -> Float
  ageOn planet seconds = 
    case planet of
      Mercury -> seconds / (0.2408467 * 31557600)
      Venus -> seconds / (0.61519726 * 31557600)
      Earth -> seconds / 31557600
      Mars -> seconds / (1.8808158 * 31557600)
      Jupiter -> seconds / (11.862615 * 31557600)
      Saturn -> seconds / (29.447498 * 31557600)
      Uranus -> seconds / (84.016846 * 31557600)
      Neptune -> seconds / (164.79132 * 31557600)



  -- Question 6
  -- given a string, return true or false if the string is a pangram
  isPangram :: String -> Bool
  isPangram text =
    let alphabet = ['a'..'z']
        textLower = map toLower text
    in all (`elem` textLower) alphabet



  -- Question 7
  -- write a function that takes a string and returns a message based on the string
  -- if the string is a question, return "Sure."
  -- if the string is a shouting (ALL CAPITAL LETTERS), return "Whoa, chill out!"
  -- if the string is yelling (an exclamation mark), return "Calm down, I know what I'm doing!"
  -- if the string is empty (no response), return "Fine. Be that way!"
  -- otherwise, return "Whatever."  
  responseFor :: String -> String
  responseFor xs
    | null (trim xs) = "Fine. Be that way!"
    | isYelling xs && endsWithQuesttion xs = "Calm down, I know what I'm doing!"
    | endsWithQuestion xs = "Sure."
    | isYelling xs = "Whoa, chill out!"
    | otherwise = "Whatever."
    where
      trim = dropWhile isSpace . reverse . dropWhile isSpace . reverse
      endsWithQuestion s = case (dropWhile isSpace . reverse $ s) of
        '?': _ -> True
        _ -> False
      isYelling s = any isLetter s && all (\c -> not (isLetter c) || isUpper c) s 



  -- Question 8
  -- the Collatz conjecture of 3x + 1  problem can be summarized as follows:
  -- take any positive integer n. if n is even, divide n by 2 to get n / 2.
  -- if n is odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely until n is equal to 1.
  -- given a number n, return the number of steps required to reach 1
  collatz :: Integer -> Maybe Integer
  collataz n =
    if n == 1
      then Just 0
    else if n <= 0
      then Nothing
    else Just (collatzHelper n 0)
    where
      collatzHelper n steps
        | n == 1 = steps
        | even n = collatzHelper (n `div` 2) (steps + 1)
        | otherwise = collatzHelper (3 * n + 1) (steps + 1)
  -- solution 2 to Question 8
  collatz2 :: Integer -> Maybe Integer
  collatz2 n
    | n <= 0 = Nothing
    | otherwise = collatzHelper n 0
    where
      collatzHelper n steps
        | n == 1 = Just steps
        | even n = collatzHelper (n `div` 2) (steps + 1)
        | otherwise = collatzHelper (3 * n + 1) (steps + 1)



  -- Question 9
  -- determine the RNA complement of a given DNA strand
  -- given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement
  -- G -> C
  -- C -> G
  -- T -> A
  -- A -> U
  toRNA :: String -> Either Char String
  toRNA xs = 
    | any (== 'U') xs = Left 'U'
    | any (`notElem` "GCTA") xs = Left 'X'
    | otherwise = Right (map transcribe xs)
    where
      transcribe 'G' = 'C'
      transcribe 'C' = 'G'
      transcribe 'T' = 'A'
      transcribe 'A' = 'U'
      transcribe x = 'U'



  -- Question 10
  -- given a string representing a DNA sequence, count how many of each mnucleotide is present
  -- if the string contains characters that aren't A, C, G, T, then it is invalid and you should signal an error
  -- "GATTACA" -> 'A': 3, 'C': 1, 'G': 1, 'T': 2
  -- "INVALID" -> error
  data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)
  nucleotideCounts :: String -> Either String (Map Nucleotide Int)
  nucleotideCounts xs 
    | all (`elem` "ACGT") xs = Right $ foldr countNucleotide emptyCountMap xs
    | otherwise = Left "Invalid DNA sequence"
    where
      emptyCountMap = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
      countNucleotide :: Char -> Map Nucleotide Int -> Map Nucleotide Int
      countNucleotide 'A' = adjust (+1) A
      countNucleotide 'C' = adjust (+1) C
      countNucleotide 'G' = adjust (+1) G
      countNucleotide 'T' = adjust (+1) T
      countNucleotide _ = id



  -- Question 11
  -- calculate energy points that get awarded to players when they complete a level
  -- the energy points are calculated based on the level that the player completed, and the base value of each magical item collected by the player during that elvel
  -- for each magical item, take hte base value and find all the multiples of that value that are less than the level number
  -- combine the sets of numbers, remove any duplicates, and calculate the sum of all the numbers that are left
  -- Ex: the player completed level 20 and found 2 magical items with base values of 3 and 5
  -- Multiples of 3 less than 20: {3, 6, 9, 12, 15, 18}
  -- Multiples of 5 less than 20: {5, 10, 15}
  -- Combine the sets and remove duplicates: {3, 5, 6, 9, 10, 12, 15, 18}
  -- Sum of the numbers: 78, therefore return 78
  sumOfMultiples :: [Integer] -> Integer -> Integer
  sumOfMultiples factors limit 
    | null factors = 0
    | otherwise = sum $ uniqueMultiples
    where
      -- For each factor, get all its multiples less than limit
      allMultiples = [multiples factor limit | factor <- factors, factor /= 0]
      -- Flatten the list of lists and remove duplicates (using list comprehension)
      uniqueMultiples = foldr (\x acc -> if x `elem` acc then acc else x:acc) [] $ concat allMultiples
    
      -- Helper function to get multiples of a factor less than limit
      multiples :: Integer -> Integer -> [Integer]
      multiples factor limit
        | factor == 0 = []
        | otherwise = [factor, factor*2 .. limit-1]



  -- Question 12
  -- calculate the number of grains of wheat on a chessboard given that the number on each square doubles
  -- calculate how many grains were on a given square
  -- calculate the total number of grains on the chessboard
  square :: Integer -> Maybe Integer
  square n
    | n <= 0 = Nothing
    | n > 64 = Nothing
    | otherwise = Just (2 ^ (n - 1))
  
  total :: Integer
  total = sum [2 ^ n | n <- [0..63]]



  -- Question 13
  -- given a string, turn it into acronyms
  -- Ex: "For your information" -> "FYI"
  abreviate :: String -> String
  abreviate = map toUpper . concatMap (take 1) . words . normalize

  normalize :: String -> String
  normalize = foldr insertSpaces ""

  insertSpaces :: Char -> String -> String
  insertSpaces c acc
    | c == '-' = ' ' : acc 
    | c == '-' = ' ' : acc
    | c == '\'' = acc
    | isAlpha c && isUpper c && not (null acc) && head acc /= ' ' && not (isUpper (head acc)) = ' ' : c : acc
    | otherwise = c : acc



  -- Question 14
  -- implement a discard and keep function that imitates the behavior of the filter and map functions
  -- discard: remove all elements that do not satisfy the predicate
  -- keep: keep all elements that satisfy the predicate
  keep :: (a -> Bool) -> [a] -> [a]
  -- Returns elements where the predicate is true
  keep _ [] = []  -- Base case: empty list returns empty list
  keep p (x:xs)
    | p x       = x : keep p xs  -- If predicate is true, keep the element
    | otherwise = keep p xs      -- If predicate is false, skip the element

  discard :: (a -> Bool) -> [a] -> [a]
  -- Returns elements where the predicate is false
  discard p xs = keep (not . p) xs  -- Reuse keep with inverted predicate



  