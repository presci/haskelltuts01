{--
 - https://www.hackerrank.com/challenges/circular-array-rotation/problem
 - --}

import Data.List
import Control.Monad



rotate::Int -> [Int] -> [Int]
rotate n xss = take (length xss) $ drop ((length xss) - n) $ cycle xss



solve::Int -> [Int] -> [Int]
solve n xss = case g of
  0 -> xss
  a -> rotate a xss
  where
  g = case  length xss > n of
    True -> n
    False -> n `mod` (length xss)

solvefin::[Int] -> [Int] -> [Int]
solvefin [] _ = []
solvefin (i:ind) xss = xss!!i : solvefin ind xss

main::IO()
main = do
  nkq <- getLine
  let (n:k:q:_) = map(read::String->Int) . words $ nkq
  ele <- getLine
  let elements = map(read::String->Int) . words $ ele
  let b = solve k elements
  queries <- replicateM q getLine
  let q = map(read::String->Int)  $ queries
  putStr $ intercalate "\n" $ map show $ solvefin q b
