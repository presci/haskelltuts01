import qualified Data.List.NonEmpty as NE
import Data.List
import Data.Maybe
{--
https://codereview.stackexchange.com/questions/238390/hands-of-straights-leetcode-arrange-the-card/238398#238398
By - https://codereview.stackexchange.com/users/84131/gurkenglas
-}

solve :: Int -> [Int] -> Bool
solve v = helper v . NE.group . sort

helper :: Int -> [NE.NonEmpty Int] -> Bool
helper v [] = True
helper v xss =
  let (a, b) = splitAt v xss
      (straight, a') = unzip $ map NE.uncons a
  in all (==1) (zipWith subtract straight (tail straight))
  && length a == v
  && helper v (catMaybes a' ++ b)



test01::[Int] -> [Int]
test01 [] = []
test01 [x] = [x]
test01 (_:x@(_:_)) = test01 x

test02 ::[Int] -> [NE.NonEmpty Int ]
test02 = NE.group . sort
