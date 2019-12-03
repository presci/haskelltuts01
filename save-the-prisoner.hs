import Control.Monad
{--
 - https://www.hackerrank.com/challenges/save-the-prisoner/problem
 -}

solve::Int -> Int -> Int -> Int
solve pri candy start
  | (pri - start') > candy = (start')  + candy
  | otherwise = solve' (candy - ( pri - start'))
  where
  start'::Int
  start' = start - 1
  solve'::Int -> Int
  solve' candy' = case candy' `mod` pri of
    0 -> pri
    n -> n

solved::[Int] -> Int
solved (x:y:z:_) = solve x y z


candies::IO()
candies= do
  nums <- getLine
  let candy = map(read::String->Int) . words $ nums
  putStrLn . show $ solved candy

main::IO()
main = do
  t <- readLn ::IO Int
  forM_ [1..t] $ \a -> do
    candies
