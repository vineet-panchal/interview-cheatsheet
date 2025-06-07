module Part4 where
  -- Question 1
  -- return the third last item in an input list
  -- assume the list has at least three elements
  third_last1 :: [a] -> a
  third_last1 [a, b, c] = a
  third_last1 (_ : rest) = thirdLast rest

  third_last2 :: [a] -> a
  third_last2 arr = (take 1 (drop (length arr - 3) arr)) !! 0

  third_last3 :: [a] -> a
  third_last3 arr = head (drop (length arr - 3) arr)



  -- Question 2
  -- given a list, return a list containing every other element, starting with the firs element
  -- it should work regardless of the size of the list, assume the list is not empty
  every_other :: [a] -> [a]
  every_other [] = []
  every_other [a] = [a]
  every_other (a : b : rest) = [a] ++ every_other rest
  -- every_other (a : b : rest) = a : (every_other rest)


  -- Question 3
  -- a non-negative integer is a cyclops number if its middle digit, and ONLY its middle digit is '0'
  -- if a number does not have a middle digit, it cannot be a cyclops number
  -- return true if its a cyclops, false otherwise
  is_cyclops :: Int -> Bool
  is_cyclops n
    | odd strLen && midDigit == '0' && noZeroes = True
    | otherwise = False
    where
      str = show n
      strLen = length str
      midIndex = strLen `div` 2
      midDigit = str !! midIndex
      noZeroes = all (/= '0') (take midIndex str ++ drop (midIndex + 1) str)

  -- solution to Question 3
  is_cyclops2 :: Int -> Bool
  is_cyclops2 n = ic_helper $ show n

  ic_helper :: String -> Bool
  ic_helper ns | ((length ns) `rem` 2) == 0 = False
                | (length $ filter (\e -> e == '0') ns) /= 1 = False
                | otherwise = (==) '0' $ ns !! ((length ns) `div` 2)


  -- Question 4
  -- given a list of tuples, that represent dominos, return true if it is a domino cycle, and false otherwise
  -- a domino cycle is when each domino ends with the same number the next domino starts with
  domino_cycle :: [(Int, Int)] -> Bool
  domino_cycle [a] = fst a == snd a
  domino_cycle [a, b] = (fst a == snd b) && (fst b == snd a) 
  domino_cycle (a : rest) = domino_cycle_helper (a : rest) a

  domino_cycle_helper :: [(Int, Int)] -> (Int, Int) -> Bool 
  domino_cycle_helper [a] acc = fst acc == snd a
  domino_cycle_helper (a : b : rest) acc = 
    (snd a == fst b) && domino_cycle_helper (b : rest) acc

  -- solution 2 to Question 4
  domino_cycle2 :: [(Int, Int)] -> Bool
  domino_cycle2 tiles = dc_helper $ tiles ++ [(head tiles)]

  dc_helper :: [(Int, Int)] -> Bool
  dc_helper [a] = True
  dc_helper (d1 : d2 : t) | (snd d1) /= (fst d2) = False
                          | otherwise = dc_helper (d2 : t) 



  -- Question 5
  tukeys_ninther :: (Ord a, Num a) => [a] -> a
  tukeys_ninther [a] = a
  tukeys_ninther list = tukeys_ninther (map medianOfThree (partsOf 3 list))

  medianOfThree :: Ord a => [a] -> a
  medianOfThree [a, b, c] = middle [a, b, c]
    where
      middle [x, y, z]
        | x <= y && x <= z = if y <= z then y else z
        | y <= x && y <= z = if x <= z then x else z
        | otherwise = if x <= y then x else y

  partsOf :: Int -> [a] -> [[a]]
  partsOf _ [] = []
  partsOf n list = take n list : partsOf n (drop n list)

  -- solution 2 to Question 5
  m_of_3 :: (Ord a, Num a) => [a] -> a
  m_of_3 :: items = (sum items) - ((minimum items) + (maximum items))

  list_of_m :: (Ord a, Num a) => [a] -> [a]
  list_of_m [] = []
  list_of_m (a : b : c : t) = (m_of_3 [a, b, c]) : (list_of_m t)

  tukeys_ninther2 :: (Ord a, Num a) => [a] -> a
  tukeys_ninther2 [a] = a
  tukeys_ninther2 items = tukeys_ninther $ list_of_m items
  