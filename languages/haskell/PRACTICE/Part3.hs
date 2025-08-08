module Part3 where
  
  -- Question 1
  -- given an integer, return the nth fibonacci number
  fib :: Int -> Int
  fib 0 = 0
  fib 1 = 1
  fib n = fib (n-1) + fib (n-2)



  -- Question 2
  -- given a number representing an amount of money, and a list of coin values (in descending order)
  -- return a list containing the minimum number of coins necessary to represent the money amount
  -- the returned list should be in descending order
  -- if not possible, state its an error
  -- Test 1: Input => Amount: 64, coins: [20, 25, 10, 5, 1], Output => [50, 10, 1, 1, 1]
  -- Test 2: Input => Amount: 100, coins: [42, 17, 11, 6, 1], Output => [42, 42, 11, 1, 1, 1, 1, 1]
  -- Test 3: Input => Amount: 64, coins: [50, 25, 10, 5], Output => :error
  minCoins :: Int -> [Int] -> [Int]
  minCoins amount coins
    | amount == 0 = []
    | amount < 0 = error "Amount cannot be negative"
    | null coins = error "No coins available"
    | head coins > amount = minCoins amount (tail coins)
    | otherwise = (head coins) : (minCoins (amount - head coins) (tail coins))
    




