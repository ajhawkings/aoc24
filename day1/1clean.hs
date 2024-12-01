import Data.List (sort, group, sortOn)
import Data.List.Split (splitOn)
import Data.Bifunctor (bimap)
import Control.Monad (join)

-- part 1
solution1 :: [(Int, Int)] -> Int
solution1 = sum . map (abs . uncurry subtract) . uncurry zip . join bimap sort . unzip

-- part 2
solution2 :: [(Int, Int)] -> Int
solution2 xs = sum [x * length [y | y <- map snd xs, x==y] | x <- map fst xs]

-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let parse line = let [a, b] = splitOn "   " line in (read a, read b)
  let parsedLines = map parse (lines content)
  print (solution1 parsedLines)
  print (solution2 parsedLines)
