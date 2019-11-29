{--
 - https://www.hackerrank.com/challenges/save-the-prisoner/problem
 -}

solve::Int -> Int -> Int -> Int
solve pri candy start
  | (pri - start) > candy = (start')  + candy
  | otherwise = solve' (candy - ( pri - start'))
  where
  start':: Int
  start' = start -1
  solve'::Int -> Int
  solve' candy' = candy' `mod` pri
