import Data.Maybe

norepeat::[Char]-> Maybe Char
norepeat chs = norepeat' chs
    where
    norepeat' [] = Nothing
    norepeat' (x:y:[]) = case x == y of
        True -> Nothing
        False -> Just x
    norepeat' (x:y:xss) = case x == y of
        True -> drop' x (xss)
        False ->  Just x
    drop' k [] = Nothing
    drop' k (x:xss) = case k == x of
        True -> drop' k xss
        False -> norepeat' (x:xss)
        
