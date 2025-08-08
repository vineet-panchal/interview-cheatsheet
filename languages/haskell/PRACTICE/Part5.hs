data DigitalTime = DigitalTime (Int, Int, Int)

instance Show DigitalTime where
  show (DigitalTime (h, m, s)) =
    let hour = if h < 10 then "0" ++ show h else show h
        min = if m < 10 then "0" ++ show m else show m
        sec = if s < 10 then "0" ++ show s else show s
    in "<" ++ hour ++ ":" ++ min ++ ":" ++ sec ++ ">"

  
instance Eq DigitalTime where
  (DigitalTime (h1, m1, s1)) == (DigitalTime (h2, m2, s2)) = h1 == h2 && m1 == m2 && s1 == s2

instance Ord DigitalTime where
  (DigitalTime (h1, m1, s1)) <= (DigitalTime (h2, m2, s2)) = 
    if h1 < h2 then
      True
    else if h1 == h2 then
      if m1 < m2 then
        True
      else if m1 == m2 then
        s1 <= s2
      else
        False
    else
      False


instance Num DigitalTime where
  (DigitalTime (h1, m1, s1)) + (DigitalTime (h2, m2, s2)) =
    let secondCarry = if s1 + s2 >= 60 then 1 else 0
        seconds = (s1 + s2) `mod` 60
        minuteCarry = if m1 + m2 + secondCarry >= 60 then 1 else 0
        minutes = (m1 + m2 + secondCarry) `mod` 60
        hours = if (h1 + h2 + minuteCarry) `mod` 12 == 0 then 12 else (h1 + h2 + minuteCarry) `mod` 12
    in DigitalTime (hours, minutes, seconds)


  (DigitalTime (h1, m1, s1)) - (DigitalTime (h2, m2, s2)) =
    let seconds = (s1 - s2 + 60) `mod` 60
        minutes = (m1 - m2 + 60) `mod` 60
        hours = if ((h1 - h2 + 12) `mod` 12) == 0 then 12 else (h1 - h2 + 12) `mod` 12
    in DigitalTime (hours, minutes, seconds)


  fromInteger n =
    let hours = fromIntegral ((n `div` 3600) `mod` 12)
        minutes = fromIntegral ((n `div` 60) `mod` 60)
        seconds = fromIntegral (n `mod` 60)
    in DigitalTime (if hours == 0 then 12 else hours, minutes, seconds)