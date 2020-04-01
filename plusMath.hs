import Control.Monad
import System.Random
plusproblems::IO()
plusproblems = forM_[1..25] $ \_ ->do
  int0 <- randomRIO (10, 20::Int)
  int1 <- randomRIO (1, 9::Int)
  putStrLn ((show int0) ++ " + " ++ (show int1))
  let g = (+) int0 int1
  added <- getLine
  let val = (read added::Int)
  putStrLn ( show ( g == val) )

--putStrLn("hello world") >>
--  randomRIO (10, 25::Int) >>= \x  -> randomRIO (10, 25::Int) >>= \y ->
--  putStrLn( (show x) ++ " + " ++ (show y)) -> getLine >>= \g -> (read::Int 

main::IO()
main = undefined
