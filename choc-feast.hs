import Data.List
import Control.Monad
{--
 - https://www.hackerrank.com/challenges/chocolate-feast/problem
 - --}
solve::[Int] -> Int
solve (x:y:z:_) =  let a = x `div` y in
  a + (wrapper a  z)



wrapper::Int -> Int -> Int
wrapper x z = case x >= z of
  True -> let (a, b)  = (x `div` z, x `mod` z)  in a + wrapper (a + b) z
  False -> 0

solveMain::[[Int]] -> [Int]
solveMain = map solve

main::IO()
main = do
  nkq <- readLn ::IO Int
  m <-  replicateM nkq getLine
  let g = map (map( read::String->Int)  . words ) m
  putStr $ intercalate "\n" $ map show $ solveMain g
