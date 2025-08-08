module Practice where

  -- Question 1
  -- given an array of integers, calculate and return the number of directional maximums
  -- a directional maximum is a number that is greater than its two neighbors
  -- an element is considered a maximum left if it is greater than the element to its left
  -- elements at the start of the array are maximum lefts
  -- an element is considered a maximum right if it is greater than the element to its right
  -- elements at the end of the array are maximum rights
  -- Ex: [4, 6, 2, 7], elements 4, 6, and 7 are considered left maximums, and element 7 is considered a maximum right
  -- return the total number of directional maximums which is 4 in this example
  -- Test 1 ==> Input: [4, 6, 2, 7]     Output: 4
  -- Test 2 ==> Input: [20, 21, 5, 4, 3, 23, 22]      Output: 5
  -- Test 3 ==> Input: [50, 1, 1, 1, 0, 2, 1, 50]      Output: 2

  directionalMax :: [Integer] -> Integer
  directionalMax [] = 0
  directionalMax nums =
    let (left_count, _) = leftMax(nums)
        (right_count, _) = rightMax(nums)
    in
        left_count + right_count

  -- Increases count if the current element is greater than all
  -- elements to the right. Returns tuple including number of
  -- right maximums and the greatest number in the given array
  rightMax :: [Integer] -> (Integer, Integer)
  rightMax [only] = (1, only)
  rightMax (hd:tail) =
    let (count, max) = rightMax(tail)
    in
        if hd > max then
            (count+1, hd)
        else
            (count, max)

  -- Takes the given array and reverses it to perform rightMax
  -- on the list instead of making an algorithm that goes left
  leftMax :: [Integer] -> (Integer, Integer)
  leftMax nums =
    let nums_r = reverse_list(nums)
    in rightMax nums_r

  -- Reverses the given list recursively
  reverse_list :: [Integer] -> [Integer]
  reverse_list [] = []
  reverse_list (hd:tail) = reverse_list(tail) ++ [hd]





  -- Question 2
  -- create a structure to represent the number of coins in your hand in quarters, dimes, nickels, and pennies (integers)
  -- create a method that, given the current structure of coins, create a new instance of the structure with an idead set of coins to represent the same currency
  -- using the largest coins as much as possible (which is also the fewest)
  -- create another method that takes two collections fo coins and produces an ideal set of coins

  data Coins = Coins Integer Integer Integer Integer  
  -- create a custom data type for Coins, that needs 4 Integers

  instance Show Coins where
    show (Coins qs ds ns ps) = "Quarters: " ++ show qs ++ " Dimes: " ++ show ds ++ " Nickels: " ++ show ns ++ " Pennies " ++ show ps

  computeTotal :: Integer -> Integer -> Integer -> Integer -> Integer
  computeTotal q d n p = q * 25 + d * 10 + n * 5 + p

  optimize :: Coins -> Coins
  optimize (Coins qs ds ns ps) =
    let total = computeTotal qs ds ns ps
        q_new = div total 25
        d_new = div (mod total 25) 10
        n_new = div ( mod (mod total 25) 10) 5
        p_new = mod total 5
    -- Return optimized coins
    in Coins q_new d_new n_new p_new

  merge :: Coins -> Coins -> Coins
  merge (Coins q1 d1 n1 p1) (Coins q2 d2 n2 p2) =
    let total = computeTotal (q1+q2) (d1+d2) (n1+n2) (p1+p2)
        q_new = div total 25
        d_new = div (mod total 25) 10
        n_new = div ( mod (mod total 25) 10) 5
        p_new = mod total 5
    -- Return optimized coins
    in Coins q_new d_new n_new p_new





  -- Question 3
  -- given a list of elements ints, determine if the list is a palindrome or not
  -- return true or false accordingly
  -- Test 1 ==> Input: [1, 2, 3, 4, 4, 3, 2, 1]       Output: True
  -- Test 2 ==> Input: [1]       Output: True
  -- Test 3 ==> Input: [1, 2, 3, 4, 1]      Output: False
  -- Test 4 ==> Input: [1, 2, 3, 4, 2, 1]       Output: False
  isPalindrome :: [Integer] -> Bool
  isPalindrome arr =
    let rev = reverse arr
    in arr == rev



  -- solution 2 to Question 3
  isPalindrome2 :: [Integer] -> Bool
  isPalindrome2 [_] = True
  isPalindrome2 arr = isPalindrome2Helper arr False

  isPalindrome2Helper :: [Integer] -> Bool -> Bool
  isPalindrome2Helper [] acc = True
  isPalindrome2Helper [_] acc = True
  isPalindrome2Helper arr acc = 
    let x = head arr
        y = last arr
    in 
      if x == y then
        isPalindrome2Helper (init (tail arr)) True
      else 
        False



  -- solution 3 to Question 3
  palindrome :: [Integer] -> Bool
  palindrome [] = True
  palindrome [only] = True
  palindrome (hd:tl) =
    -- Structure would be considered tail recursive
    let revList = reverse tl
        (new_h:new_t) = revList
    in
        if new_h == hd then
            palindrome new_t
        else
            False

  -- Reverses the given list recursively
  -- reverse_list :: [Integer] -> [Integer]
  -- reverse_list [] = []
  -- reverse_list (hd:tail) = reverse_list(tail) ++ [hd]

  -- Alternate solution, perhaps clearer structure and tail recursive
  alt_pal :: [Integer] -> Bool
  alt_pal nums = alt_pal_helper nums True

  alt_pal_helper :: [Integer] -> Bool -> Bool
  alt_pal_helper [] res = res
  alt_pal_helper [one] res = res
  alt_pal_helper anything False = False
  alt_pal_helper nums res =
    let hd = head nums
        tl = tail nums
        rev = reverse tl
        rev_tail = tail rev
    in alt_pal_helper rev_tail (hd == head(rev))





  -- Question 4
  -- There are two contestants in this game.
  -- Each contestant has two attributes: energy level and stomach capacity.
  -- Burgers with varying heat levels are continuously rolling out on a conveyor belt. For example, the heat levels could be [1, 2, 4, 7, 5, 3].
  -- The heat level of a burger determines how much energy a contestant consumes when eating it and the points they gain.
  -- Eating a burger consumes two units of a contestant’s stomach capacity.
  -- When a burger reaches the end of the conveyor belt, the contestant with higher energy (provided they have enough energy and capacity) grabs and eats the burger. (Note: However, a contestant with a lower energy level may eat the burger if the opponent no longer has enough stomach capacity to eat anymore)
  -- If both contestants have the same energy, the heat level of the burger determines who gets it. If the heat level is odd, Contestant 1 gets the burger. If it’s even, Contestant 2 gets it.
  -- If neither contestant has enough energy or capacity to eat the burger, it falls off the conveyor belt and is not eaten.
  -- The game ends when there are no more burgers left. The contestant with more points is declared the winner.
  -- Write a function called "eat" which implements this. The function definition is provided below:
  -- eat :: [Int] -> Int -> Int -> Int -> Int -> String
  -- eat food energy1 capacity1 energy2 capacity2
  -- where food is a list representing the conveyor belt holding the burgers with varying heat levels, and energy1, capacity1, energy2, capacity2 are integer values. Return the points for each contestant and the winner (as a String) when there is no more food left (Eg. "POINTS 1: 6, POINTS 2: 8, WINNER: 2").
  eat :: [Int] -> Int -> Int -> Int -> Int -> String
  eat food energy1 capacity1 energy2 capacity2 = eat2 food energy1 capacity1 energy2 capacity2 0 0

  eat2 :: [Int] -> Int -> Int -> Int -> Int -> Int -> Int -> String
  eat2 food energy1 capacity1 energy2 capacity2 points1 points2
    | null food = "POINTS 1: " ++ show points1 ++ ", POINTS 2: " ++ show points2 ++ ", WINNER: " ++ (if points1 > points2 then "1" else if points2 > points1 then "2" else "DRAW")
    | (capacity2 < 2 || energy1 > energy2) && energy1 >= head food && capacity1 >= 2 = eat2 (tail food) (energy1 - head food) (capacity1 - 2) energy2 capacity2 (points1 + head food) points2
    | (capacity1 < 2 || energy2 > energy1) && energy2 >= head food && capacity2 >= 2 = eat2 (tail food) energy1 capacity1 (energy2 - head food) (capacity2 - 2) points1 (points2 + head food)
    | energy1 == energy2 && odd (head food) && energy1 >= head food && capacity1 >= 2 = eat2 (tail food) (energy1 - head food) (capacity1 - 2) energy2 capacity2 (points1 + head food) points2
    | energy1 == energy2 && even (head food) && energy2 >= head food && capacity2 >= 2 = eat2 (tail food) energy1 capacity1 (energy2 - head food) (capacity2 - 2) points1 (points2 + head food)
    | otherwise = eat2 (tail food) energy1 capacity1 energy2 capacity2 points1 points2





  -- Question 5
  -- create function that receives an integer less than 100 as input
  -- return the number of factors for this number that are prime numbers
  -- this total should not include the factor 1 (because 1 is not a prime number) or the number itself 
  -- i.e. 7 is a prime number, and also a factor of 7

  countPrimes :: Integer -> Integer
  countPrimes num | num < 1 = 0
                  | num == 0 = 0
                  | num == 1 = 1
                  | otherwise = countPrimesHelper num 0 1

  countPrimesHelper :: Integer -> Integer -> Integer -> Integer
  countPrimesHelper num acc currNum =
    if currNum <= num then do
      if num `mod` currNum == 0 && isPrime currNum then
        countPrimesHelper num (acc + 1) (currNum + 1)
      else
        countPrimesHelper num acc (currNum + 1)
    else
      acc

  isPrime :: Integer -> Bool
  isPrime n
    | n <= 1 = False
    | n == 2 = True
    | even n = False
    | otherwise = all (\x -> n `mod` x /= 0) [3,5..isqrt n]
    where
      isqrt = floor . sqrt . fromIntegral



  -- solution 2 to Question 5
  runTests :: IO ()
  runTests =
    let
        r1 = primeFactors 84
        r2 = primeFactors 19
        r3 = primeFactors 99
    in
        putStrLn ("84 has " ++ show r1 ++ " prime factors.\n19 has " ++ show r2 ++ " prime factors.\n99 has " ++ show r3 ++ " prime factors.")

  primeFactors :: Integer -> Integer
  primeFactors num = primeHelper num 2 0

  primeHelper :: Integer -> Integer -> Integer -> Integer
  primeHelper num curr counter
    | curr >= num = counter
    | rem num curr == 0 && isPrime2 curr 2 = primeHelper num (curr+1) (counter+1)
    | otherwise = primeHelper num (curr+1) counter

  isPrime2 :: Integer -> Integer -> Bool
  isPrime2 num curr
    | curr >= num = True
    | rem num curr == 0 = False
    | otherwise = isPrime2 num (curr+1)





  -- Question 6
  -- given a list of integers, locate the local maximums
  -- a local max is a number that is greater than its immediate neighbours on both sides
  -- return a tuple containing the sum of the local maxs and the sum of the index values where these maxumums occur
  -- assume index values start at 1

  runTests2 :: IO ()
  runTests2 =
    let
        r1 = localMaximums [10, 1, 3, 4, 2, 7, 5, 2, 3, 2, 5]
        r2 = localMaximums [1,2,1]
        r3 = localMaximums [5]
    in
        putStrLn (show r1 ++ "\n" ++ show r2 ++ "\n" ++ show r3)

  localMaximums :: [Integer] -> (Integer, Integer)
  localMaximums [] = (0,0)                    -- Empty base case
  localMaximums [oneValue] = (oneValue, 1)    -- One element base case

  localMaximums (first: second: rest)    -- Checks first before checking middle
    | first > second = recCall ([first, second] ++ rest) first 1 2
    | otherwise = recCall ([first, second] ++ rest) 0 0 2


  recCall :: [Integer] -> Integer -> Integer -> Integer-> (Integer, Integer)
  recCall [] valSum iSum _index = (-1, -1)            -- Debugging
  recCall [oneVal] valSum iSum _index = (-1, -1)     -- Debugging

  recCall [first, second] valSum iSum index          -- Final two, check the last element and return tuple
    | second > first = (valSum + second, iSum + index)  -- iSum + index because index already represents the second value in list
    | otherwise = (valSum, iSum)

  recCall (first : second : third : rest) valSum iSum index     -- More elements to handle, recursive call
    | second > first && second > third = recCall ( [second,third] ++ rest) (valSum+second) (iSum+index) (index+1)
    | otherwise = recCall ([second, third]++rest) valSum iSum (index+1)

