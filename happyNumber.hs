import Data.List
import Data.Maybe
{--
 - 202 https://leetcode.com/problems/happy-number/
 --}


solve::Int ->[Int]->Bool
solve 0 _ = True
solve 1 _ = True
solve x acc = let g = solve0 x
  in case find (\m -> m == g) acc of
    Nothing  ->  solve g (g:acc)
    _ -> False

solve0::Int -> Int
solve0 0 = 0
solve0 1 = 1
solve0 x = let (a, b) = (x `mod` 10, x `div` 10)
  in (a * a) + (solve0 b)
