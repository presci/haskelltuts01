import Data.List (group)
{-
 - gab $ gab0 ['a', 'a', 'a', 'b', 'c', 'c','c','c','d','e','e']
"a3bc4de2"
-}


gab0 :: [Char] -> [(Char, Int)]
gab0 = map(\l@(x:xs) -> (x, length l)) . group

gab1 :: (Char, Int) -> String
gab1 (d, 1) = [d]
gab1 (d, 2) = [d] ++ [d]
gab1 (d, x) = [d] ++ show x


gab :: [(Char, Int)] -> String
gab = foldr(\x acc ->  gab1 x ++ acc) []   
