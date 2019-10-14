import Data.List
{-
 - https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem
 -}

{- scoreboard
 - alice Score
 - sample Input
 - 6
 - 100 90 90 80 75 60
 - 5
 - 50 65 77 90 102

  - sample Output
  - 6
  - 5
  - 4
  - 2
  - 1
 -}

{-
 - alicescore scoreboard ladder
 -}
makeScore::[Int]->[Int] -> [Int]
makeScore alsco scobo = makeScore' . reverse $ zipWith (\x y -> (x, y)) [1..] $  scobo
                        where
                        makeScore' :: [(Int, Int)] -> [Int]
                        makeScore' xs = solve alsco xs




makeScore1'::[Int] -> [(Int, Int)]
makeScore1' = reverse . zipWith(\x y ->(x,y)) [1..]

{-
 - 60 75 80 90 100
 - 50 65 77 90 102
 - 6 5 4 2 1
 -}
solve::[Int] -> [(Int, Int)] -> [Int]
solve [] _ = []
solve xc@(x:xs) yc@(y:ys) = if x < snd y then fst y +  1: solve xs yc
                            else if x >= snd y && ys == [] then 1:solve xs yc
                            else if x == snd y && ys /= [] then fst y : solve xs ys
                            else solve xc ys



alignScores ls0 = alignscore . group $ ls0
  where
    alignscore::[[Int]] -> [Int]
    alignscore = map (\x -> head x)

show':: [Int] -> [String]
show' [] = []
show' (x:xs) = show x: show' xs


main::IO()
main = do
  scorecount <- readLn :: IO Int
  scoretmp <- getLine
  let scores = alignScores . map (read::String -> Int) . words $ scoretmp
  aliceCount <- readLn :: IO Int
  alicetmp <- getLine
  let aliceScore =  map (read::String ->Int) . words $ alicetmp
  putStr $ intercalate "\n" $ show'  $ makeScore aliceScore scores
