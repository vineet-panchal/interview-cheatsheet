-- Part 1 Practice

module Part1 where
  lst = [-15, 4, -3, 18, -1, -10, 7, -2]

  -- Question 1
  -- find and print the sum of the positive integers, and the sum of the negative integers of a given list
  sumPosneg :: [Integer] -> (Integer, Integer)
  sumPosneg xs = (sum positives, sum negatives)
    where
      positives = filter (> 0) xs
      negatives = filter (< 0) xs



  -- Question 2
  -- find the subsequence whose elements produce the largest sum
  -- print the subsequence and the sum of the subsequence
  reorderPosneg :: [Int] -> [Int]
  reorderPosneg xs = negatives ++ zeros ++ positives
    where
      negatives = filter (< 0) xs
      zeros = filter (== 0) xs
      positives = filter (> 0) xs