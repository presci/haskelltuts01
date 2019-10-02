{--
- https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem
-
-}
mxscore::(a,a,a,a) -> a
mxscore (_,a,_,_) = a
mnscore::(a,a,a,a) -> a
mnscore (a,_,_,_) = a
lscore :: (a, a,a,a) -> a
lscore (_,_,a,_) = a
hscore :: (a, a,a,a) -> a
hscore (_,_,_,a) = a


main = interact $ show1  .solve . map read . tail . words 

show1::(Int, Int, Int, Int) -> String
show1 (_,_,a,b) = show b ++ " " ++ show a


solve::[Int] -> (Int, Int, Int, Int)
solve (x:xs) =  solve1 x xs
    where solve1 d dx = foldl(\acc x -> if x > mxscore acc 
                        then (mnscore acc, x, lscore acc, hscore acc + 1) 
                        else if x < mnscore acc then (x, mxscore acc, lscore acc  + 1, hscore acc) else acc ) (d,d,0,0) dx 
