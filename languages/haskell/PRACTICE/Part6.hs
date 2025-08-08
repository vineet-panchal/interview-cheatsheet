module Part6 where

  -- Question 1
  -- given an list, count the number of peaks in the array
  -- a peak is defined as an element flanked on either side by elements smaller than itself
  -- the first and last elements are considered peaks, if the single element adjacent to it is smaller
  countPeaks :: [Integer] -> Integer
  countPeaks [] = 0
  countPeaks [x] = 1
  countPeaks arr = countPeaksHelper arr 0

  countPeaksHelper :: [Integer] -> Integer -> Integer
  countPeaksHelper [] acc = acc
  countPeaksHelper [a] acc = acc
  countPeaksHelper [a, b] acc = do
    if a > b then acc + 1
    else if b > a then acc + 1
    else acc
  countPeaksHelper (a:b:c:tl) acc = do
    if a > b then countPeaksHelper (b:c:tl) (acc + 1)
    else if b > a && b > c then countPeaksHelper (c:tl) (acc + 1)
    else countPeaksHelper (b:c:tl) acc



  -- Question 2
  -- given a list of integers
  -- return a list where runs of identical integer values have been reduced to a single instance of that integer
  remove_runs :: [Integer] -> [Integer]
  remove_runs [] = []
  remove_runs [a] = [a]
  remove_runs (x : xs) = remove_runs_helper xs [x]

  remove_runs_helper :: [Integer] -> [Integer] -> [Integer]
  remove_runs_helper [] acc = acc
  remove_runs_helper (x : tl) acc = 
    if x == last acc then remove_runs_helper tl acc
    else remove_runs_helper tl (acc ++ [x])



  -- Question 3
  -- given a list of integers, iterate through the list and determine if each number is prime
  -- return the count of primes that were found
  count_and_remove_primes :: [Integer] -> Integer
  count_and_remove_primes [] = 0
  count_and_remove_primes (x : xs) = do
    if isPrime x then count_and_remove_primes_helper xs 1
    else count_and_remove_primes xs
  
  count_and_remove_primes_helper :: [Integer] -> Integer -> Integer
  count_and_remove_primes_helper [] acc = acc
  count_and_remove_primes_helper (x : tl) acc = do
    if isPrime x then count_and_remove_primes_helper tl (acc + 1)
    else count_and_remove_primes_helper tl acc

  isPrime :: Integer -> Bool
  isPrime 1 = False
  isPrime 2 = True
  isPrime n = do
    let divisors = [i | i <- [2 .. (floor (sqrt (fromIntegral n)) :: Integer)], n `mod` i == 0]
    -- in
    if length divisors == 0 then True
    else False




