{--
 - https://www.hackerrank.com/challenges/beautiful-days-at-the-movies/problem
 -}
reverseInt :: Int -> Int
reverseInt l = aux (l, 0)
        where   aux (0, y) = y
                aux (x, y) =    let (x', y') = x `quotRem` 10
                                in aux (x', 10 * y + y')

solve::Int -> Int -> Bool
solve x y = (x - reverseInt x)  `mod` y == 0

dissy::Int -> Int -> Int ->  Int
dissy a b c = foldl (\acc x -> if solve x c  then (acc + 1) else acc) 0 [a..b]

beautify :: [Int] -> Int
beautify (x:y:z:_) = dissy x y z


main :: IO()
main = interact $ show . beautify.  map (read::String-> Int) . words
