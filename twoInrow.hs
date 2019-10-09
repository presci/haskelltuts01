solve::(Eq a, Num a)=> [a]->Maybe a
solve [] = Nothing
solve (x:[]) = Nothing
solve (x:xs) =  if x == head xs then
                Just x
                else solve xs
