mport Data.List
{-
https://leetcode.com/problems/minimum-absolute-difference/
--}

solve::[Int]->[(Int, Int)]
solve [] = []
solve [x] = []
solve k = 
  let (x:y:xss) = sort k  
  in helper [(x, y)] (x `subtract` y)  (y:xss)

helper::[(Int, Int)] -> Int-> [Int] -> [(Int, Int)]
helper acc _ [] = acc
helper acc _  [x] = acc
helper acc curr (x:y:xs)
  | x `subtract` y > curr = helper acc curr (y:xs)
  | x `subtract` y == curr = helper ((x, y):acc) curr (y:xs)
  | otherwise = helper [(x, y)] (x `subtract` y)  (y:xs)
