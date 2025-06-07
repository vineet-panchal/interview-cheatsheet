module AthletesHardWay where
  golds (Athlete g _ _) = g
  silvers (Athlete _ s _) = s
  bronzes (Athlete _ _ b) = b 

  instance Show Athlete where
    show (Athlete g s b) =
      show g ++ " Gold, " ++ show s ++" Silver, " ++ show b ++" Bronze"

  instance Eq Athlete where 
    (Athlete g1 s1 b1) == (Athlete g2 s2 b2) =
      g1 == g2 && s1 == s2 && b1 == b2

  instance Ord Athlete where
    (Athlete g1 s1 b1) > (Athlete g2 s2 b2) 
      | g1 > g2 = True
      | g1 == g2 && s1 > s2 = True
      | g1 == g2 && s1 == s2 && b1 >= b2 = True
      | otherwise = False

  bestAthlete :: [Athlete] -> Athlete
  bestAthlete [] = Athlete 0 0 0
  bestAthlete [one] = one
  bestAthlete (one:rest) =
    let 
      bestOfRest = bestAthlete rest 
    in
      if one > bestOfRest then
        one 
      else do
        bestOfRest 