import Data.List

{-
solve 3 [1,1,2,2,2,3,3,3,4]
True

solve 3 [1,1,2,2,2,3,3,3]
False

solve 4 [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4]
True
-}

solve::Int -> [Int] -> Bool
solve v xss = helper v $ group $ sort xss

helper::Int ->[[Int]] -> Bool
helper v [] = True
helper v xss = let (a, b) = splitAt v xss 
    in case verify a  && ((length a) `mod` v == 0)  of
        True -> helper v $ (removeHead a []) ++ b
        False -> False

verify::[[Int]] -> Bool
verify [] = True
verify (x:[]) = True
verify (x:y:zx) 
    | head y == succ (head x) = verify $ y:zx
    | otherwise = False

removeHead::[[Int]] -> [[Int]]-> [[Int]]
removeHead [] acc = acc
removeHead (x:xss) acc = case null (tail x) of
    True -> removeHead xss acc
    False -> removeHead xss (acc ++ [tail x])