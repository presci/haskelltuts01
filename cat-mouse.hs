import Control.Monad

{--
 - https://www.hackerrank.com/challenges/cats-and-a-mouse/problem
 -}

solve::[Int] -> String
solve (x:y:z:_)
  |  catA < catB = "Cat A"
  |  catA > catB = "Cat B"
  |  otherwise = "Mouse C"
  where
  catA::Int
  catA = max x z - min x z
  catB::Int
  catB = max y z - min y z

catmouse = do
  line <- getLine
  putStrLn $ solve . map (read::String->Int) . words $ line

main::IO()
main = do
  num <- readLn ::IO Int
  forM_ [1..num] $ \a -> do
    catmouse
