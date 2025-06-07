module ConsecutiveElements where
  consecElements :: [Integer] -> Integer
  consecElements elements 
    | null elements = 0 
    | otherwise = consec (tail(elements)) (head(elements)) 1 1

  consec :: [Integer] -> Integer -> Integer -> Integer -> Integer
  consec [] _ currStreak maxStreak              -- End of List
    | currStreak > maxStreak = currStreak 
    | otherwise = maxStreak

  consec (hd:tl) prev currStreak maxStreak  
    | hd == prev = consec tl hd (currStreak+1) maxStreak 
    | otherwise = do 
      if currStreak > maxStreak then 
        consec tl hd 1 currStreak 
      else
        consec tl hd 1 maxStreak