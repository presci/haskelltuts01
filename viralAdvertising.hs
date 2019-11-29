import Data.List
{--
 - https://www.hackerrank.com/challenges/strange-advertising/problem
 -}

fib :: Int -> Int
fib 1 = 2
fib n =  (fib (n - 1) * 3) `div` 2


fibhelper::Int -> Int
fibhelper 0 =  0
fibhelper n = foldl (\acc x -> acc + x)  0 $ fibcreate n
  where
  fibcreate :: Int -> [Int]
  fibcreate 0 = []
  fibcreate  k = fib k  : fibcreate (k - 1)

main =  do
  input1 <- getLine
  let input1' = (read input1 ::Int)
  putStrLn . show $ fibhelper input1'
