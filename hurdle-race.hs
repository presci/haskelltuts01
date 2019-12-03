import Data.List
{-
 - https://www.hackerrank.com/challenges/the-hurdle-race/problem
 -}


solve::Int->[Int]->Int
solve k height
  | g <= k  = 0
  | otherwise = g - k
  where
    g::Int
    g = maximum height

main::IO()
main = do
  first <- getLine
  let jump = map ( read::String-> Int) . words $ first
  let k = jump!! 1
  hurd <- getLine
  let hurdles = map(read::String->Int) . words $ hurd
  putStrLn . show $ solve k hurdles
