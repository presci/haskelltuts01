import Data.Maybe
import qualified Data.Map.Strict as Map

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
        


norepeat2::[Char] -> Maybe Char
norepeat2 xss = getnorepeat xss $ getMappedChars xss Map.empty
    where
        getMappedChars::[Char] -> Map.Map Char Integer -> Map.Map Char Integer
        getMappedChars [] g = g
        getMappedChars (x:xss) g = case Map.lookup x g of
            Nothing -> getMappedChars xss (Map.insert x 1 g)
            Just a -> getMappedChars xss (Map.insertWith (+) x 1 g)
        getnorepeat::[Char] -> Map.Map Char Integer -> Maybe Char
        getnorepeat [] _ = Nothing
        getnorepeat (x:xss) g = case Map.findWithDefault 2 x g == 1 of
            True -> Just x
            False -> getnorepeat xss g 
