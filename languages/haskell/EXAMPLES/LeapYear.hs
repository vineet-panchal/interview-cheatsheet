module LeapYear where
  isLeap :: Integer -> Bool
  isLeap year 
    | mod year 400 == 0 = True
    | rem year 100 == 0 = False 
    | rem year 4   == 0 = True 
    | otherwise         = False 

  isLeap2 :: Integer -> Bool
  isLeap2 year = 
    if (mod year 400 == 0) then
        True 
    else if (mod year 100 == 0) then 
        False
    else if (mod year 4 == 0) then
        True 
    else 
        False