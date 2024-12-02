import Data.List.Split (splitOn)
import Data.List (subsequences)

-- part 1
solution1 :: [[Int]] -> Int
solution1 = length . filter safe

safe :: [Int] -> Bool
safe xs = all (\x-> x>0 && x<=3) (diffs xs) || all (\x-> x<0 && x>=(-3)) (diffs xs)

diffs :: [Int] -> [Int]
diffs xs = zipWith (-) (init xs) (tail xs)

-- part 2
solution2 :: [[Int]] -> Int
solution2 = length . filter (\x -> safe2 x || safe x)

safe2 :: [Int] -> Bool
safe2 xs = any safe (filter (\x -> length x == length xs-1) $ subsequences xs)

-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let parse line = map read (splitOn " " line) :: [Int]
  let parsedLines = map parse (lines content)
  print (solution1 parsedLines)
  print (solution2 parsedLines)