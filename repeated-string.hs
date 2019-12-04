
{-
 - https://www.hackerrank.com/challenges/repeated-string/problem
 -}

solve''::Int ->[Char] -> Int
solve'' tk charr = (solve' $ findA 'a' charr) + (findA 'a' $ take  solve2 charr)
  where
  solve' k = (k * solve1)
  solve1 = tk `div` length charr
  solve2 = tk `mod` length charr



findA::Char -> [Char] -> Int
findA ch charr = foldl (\acc x -> if x == ch then acc +1 else acc) 0 charr

solve::Int -> [Char] -> Int
solve x  ch = solve'' x ch

main::IO()
main = do
  g <- getLine
  n <- readLn ::IO Int
  putStrLn . show $ solve n g
