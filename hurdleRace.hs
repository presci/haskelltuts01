{-
 - https://www.hackerrank.com/challenges/the-hurdle-race/problem
 -}
import Data.List

solve::Int ->[Int] -> Int
solve danjump lst = g .last. group $ sort lst
    where g xs 
        	| xs!!0 > danjump = xs!!0 - danjump
        	| otherwise = 0
