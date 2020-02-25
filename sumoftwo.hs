import qualified Data.Set as Set
import Data.Maybe



sumOfTwo::Int ->[Int] -> [Int]-> Maybe (Int, Int)
sumOfTwo s  x y= find' y $ helper x Set.empty
  where
  helper::[Int] -> Set.Set Int -> Set.Set Int
  helper [] st = st
  helper (x:xss) st = helper xss  $ Set.insert (s - x ) st
  find' ::[Int] -> Set.Set Int -> Maybe (Int, Int)
  find' [] _ = Nothing
  find' (y1:y1ss) st = case Set.member y1 st of
    True -> Just (y1, s - y1)
    False -> find' y1ss st
