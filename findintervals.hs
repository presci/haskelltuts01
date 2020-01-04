import Data.List
{--
 - Find intervals in the list
 - -}

solve::[(Int,Int)]->[(Int, Int)]
solve (a:b:[]) = case solve1 a b of
  (True, g) -> g:[]
  (False, g) -> []
solve (a:b:xss) = case solve1 a b of
  (True, g) -> g:solve(b:xss)
  (False, g) -> solve (g:xss)

solve1::(Int, Int) -> (Int, Int) -> (Bool, (Int, Int))
solve1 (a1, b1) (a2, b2)
  | a1 < a2 && b1 < b2 && b1 < a2 = (True, (b1, a2))
  | a1 < a2 && b2 < b1 = (False, (a1, b1))
  | otherwise = (False, (a1, b2))
