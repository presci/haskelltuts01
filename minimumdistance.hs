{--
 - https://www.hackerrank.com/challenges/minimum-distances/problem
 --}
import Data.List
import Data.Maybe
import qualified Data.IntMap.Strict as IntMap

test:: Int -> String -> IntMap.IntMap String
test k s =  IntMap.insert k s IntMap.empty

solve::[Int] ->  Int
solve xss = let a = zip xss [0..] in
  case finddist a  Nothing IntMap.empty of
    Nothing -> (-1)
    Just m -> m

finddist::[(Int, Int)] -> Maybe Int -> IntMap.IntMap Int -> Maybe Int
finddist [] cur mp = cur
finddist ((a, b):xs) cur mp = case IntMap.lookup a mp of
  Nothing -> finddist xs cur $ IntMap.insert a b mp
  Just k -> case (b - k) of
    1 -> Just 1
    curr1 -> case (cmpInt curr1  cur) of
      True -> finddist xs cur (IntMap.insert a b mp)
      False -> finddist xs (Just curr1) (IntMap.insert a b mp)

cmpInt::Int->Maybe Int -> Bool
cmpInt _ Nothing = False
cmpInt m (Just k) = m > k


main::IO()
main= do
  k <- getLine
  g <- getLine
  let m = map ( read ::String -> Int) . words $ g
  putStrLn . show $ solve m


