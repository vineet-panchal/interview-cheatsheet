module ConsecutiveVowels where
  isVowel character 
    | character == 'a' = True 
    | character == 'e' = True 
    | character == 'i' = True 
    | character == 'o' = True 
    | character == 'u' = True 
    | otherwise = False


  consecVowels :: [Char] -> Integer
  consecVowels elements 
    | null elements = 0 
    | otherwise = consec (tail(elements)) (isVowel(head(elements))) 1 1


  consec :: [Char] -> Bool -> Integer -> Integer -> Integer
  consec [] _ currStreak maxStreak              -- End of List
    | currStreak > maxStreak = currStreak 
    | otherwise = maxStreak

  consec (hd:tl) prev currStreak maxStreak  
    | prev && isVowel(hd) = consec tl True (currStreak+1) maxStreak 
    | otherwise = do 
      if currStreak > maxStreak then 
        consec tl (isVowel(hd)) 1 currStreak 
      else
        consec tl (isVowel(hd)) 1 maxStreak