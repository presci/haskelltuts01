{-
 - https://www.hackerrank.com/challenges/utopian-tree/problem
 -}

import Control.Monad
import Data.List



solve::[Int]->[Int]
solve = map solve'
      where
      solve':: Int -> Int
      solve' 0 = 1
      solve' l  = foldl (\acc x -> if x `mod` 2 == 0 then
        acc + 1
        else acc * 2 ) 1 [1..l]

main::IO()
main = do
  nooflines <- getLine
  inputs <- replicateM (read nooflines) getLine
  let yrs = map (read::String->Int) inputs
  putStr $  intercalate "\n" $ map show $ solve yrs
