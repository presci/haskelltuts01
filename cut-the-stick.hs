import Data.List
import Data.Ord

solve::[Int] -> [Int]
solve xss = solve' xss
  where
  solve'::[Int]->[Int]
  solve' [] = []
  solve' xss =
    let m = minimum xss
        g =  foldl (\acc x -> if (x - m)  > 0 then (x - m):acc else acc) [] xss
          in length xss:solve' g

main::IO()
main = do
  k <- readLn ::IO Int
  g <- getLine
  let pro = map(read::String-> Int) . words $ g
  putStr $ intercalate "\n" $ map show $ solve pro
