import Data.Array

getl2r::[Int] -> Int -> [Int] -> [Int]
getl2r [] _  acc = acc
getl2r (x:xss) lastval acc =  let k = x * lastval in 
    getl2r xss k (acc ++ [k])

getG ::[Int] -> [Int] -> [Int]
getG [] acc = acc
getG (x:xss) acc = getG xss (x:acc)

solve::[Int] ->[Int]
solve xss = let k = listArray (0, ((length xss) - 1)) xss in solve' k
    where 
        solve' :: Array Int Int ->[Int]
        solve' g = mergelist (getl2r2 g) (getr2l2 g) []


makearr::[Int] -> Array Int Int
makearr xss = listArray (0, (length xss) -1) xss


mergelist::[Int] -> [Int] -> [Int] -> [Int]
mergelist [] _  acc = acc
mergelist _ [] acc = acc
mergelist (x:xss) (y:yss) acc = mergelist xss yss (acc ++ [ (y * x)])



getl2r2::Array Int Int -> [Int]
getl2r2 xss = makelist 1 1 [1]
    where 
        makelist::Int -> Int -> [Int] -> [Int]
        makelist ind lastVal acc = case ind > ((length xss) - 1) of
            True -> acc
            False -> let k = (lastVal * (xss!(ind - 1))) in makelist (ind + 1) k (acc ++ [k])

getr2l2::Array Int Int -> [Int]
getr2l2 xss = let l = ((length xss) - 1) in makelist (l -1) 1 [1]
    where 
        makelist::Int -> Int -> [Int] -> [Int]
        makelist ind lastVal acc = case ind  < 0 of
            True -> acc
            False -> let k = (lastVal * (xss!(ind + 1))) in makelist (ind - 1) k (k :acc)

