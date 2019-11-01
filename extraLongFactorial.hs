{-
 - https://www.hackerrank.com/challenges/extra-long-factorials/problem
 -}
solve::Integer -> Integer
solve n = foldl (\acc x -> acc * x) 1 [1..n]

main :: IO()
main = do
    n <- readLn :: IO Int
    putStr . show . solve  $ fromIntegral n
