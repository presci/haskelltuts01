{-
 - https://www.hackerrank.com/challenges/counting-valleys/problem
 -}


import Data.List

solution::[Char] -> Int
solution = solve .  group


solve::[[Char]] -> Int
solve = g' .  q'
        where
        q'::[[Char]] -> [Int]
        q' = map (\x -> if head x == 'D' then length x * (-1) else length x * 1)
        g':: [Int] -> Int
        g' lst0 = valley 0 0 lst0




valley::Int -> Int -> [Int] -> Int
valley _ k [] = k
valley curr k (x:xs) = if curr >= 0 && 0 > curr +  x then
                                  valley (curr + x) (k + 1) xs
                       else  valley (curr + x)  k xs


main::IO()
main = do
       no <- getLine
       valleyline <- getLine
       let valleys = valleyline
       putStr . show $ solution valleys
