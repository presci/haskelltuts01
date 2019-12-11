{--
 - https://www.hackerrank.com/challenges/cut-the-sticks/problem
 --}
import Data.List


solve::[Int] -> [Int]
solve xss = solve' xss  
    where 
    solve' [] = []
    solve' xss = 
        let m = minimum xss
            g =  foldl (\acc x -> if (x - m)  > 0 then (x - m):acc else acc) [] xss
            k = foldl (\acc x -> if x > 0 then acc + 1 else acc) 0 xss
            in k:solve' g 

