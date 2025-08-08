module Athletes where
  data Athlete = Athlete Integer Integer Integer 

  instance Show Athlete where 
      show (Athlete g s b) = "Gold: " ++ show g ++ " Silver: " ++ show s ++ " Bronze: " ++ show b

  winner (Athlete g1 s1 b1) (Athlete g2 s2 b2)
    | g1 > g2 = (Athlete g1 s1 b1)
    | g1 < g2 = (Athlete g2 s2 b2) 

    | s1 > s2 = (Athlete g1 s1 b1)
    | s1 < s2 = (Athlete g2 s2 b2) 

    | b1 > b2 = (Athlete g1 s1 b1)
    | b1 < b2 = (Athlete g2 s2 b2) 

    | otherwise = (Athlete g1 s1 b1)

  topAthlete :: [Athlete] -> Athlete
  topAthlete [] = Athlete 0 0 0

  topAthlete (curr:others) = winner curr (topAthlete others)
