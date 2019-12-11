import Data.List
import Data.Ord

solve::[Int] -> [Int]
solve xss = solve' xss  
    where 
    solve' [] = []
    solve' xss = 
        let m = minimum xss
            g =  foldl (\acc x -> if (x - m)  > 0 then (x - m):acc else acc) [] xss
            in length xss:solve' g 
