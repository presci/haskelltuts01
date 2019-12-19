import Data.List
import Control.Monad
{--
 - https://www.hackerrank.com/challenges/service-lane/problem
 - --}
solve::[(Int,Int)] -> Int -> Int -> Int
solve xss g m =  foldl (\acc x ->if
  g<= snd x &&
  snd x <= m &&
  fst x < acc
    then (fst x) else acc )  10  xss

solveMain::[[Int]] -> [(Int,Int)] -> [Int]
solveMain [] _ = []
solveMain (x:xs) lane  = let a  = solve lane (x!!0) (x!!1)
  in a:solveMain xs lane

main::IO()
main = do
  initLine <-  getLine
  let nth = map (read::String->Int) . words $ initLine
  let t = nth!!1
  lanes <- getLine
  let numLane = map ( read::String->Int) . words $ lanes
  teststrings <-  replicateM t getLine
  let tests = map(map(read::String->Int) . words) teststrings
  putStr $ intercalate "\n" $ map show $ solveMain  tests ( zip numLane [0..])
