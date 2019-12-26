-- Enter your code here. Read input from STDIN. Print output to STDOUT
import Control.Applicative
import Control.Monad
import System.IO


main :: IO ()
main = do
    n_temp <- getLine
    let [n,k]  = map  (\x -> read x :: Int) $ words n_temp 
    arr_temp <- getLine
    let arr = map  (\x -> read x :: Int) $ words arr_temp
    print $ unique $ workBook arr k

(n,k) = (5,3) :: (Int, Int)
arr = [4,2 ,6,1, 10] :: [Int]
workBook :: [Int] -> Int -> [[Int]]
workBook arr k = concat $ map (multipleSplit k) $ map (\x -> [1..x]) arr

unique workBook = length $ filter (==True) $ zipWith elem [1..length workBook] $  workBook

multipleSplit :: Int  -> [a]  -> [[a]]
multipleSplit  x arr 
    | length arr <= x = [arr]
    | otherwise = [a] ++ multipleSplit x b
        where (a,b) = splitAt x arr
