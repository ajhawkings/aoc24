import Data.List.Split (splitOn)

-- part 1
solution1 :: [[Int]] -> Int
solution1 = undefined

-- part 2
solution2 :: [[Int]] -> Int
solution2 = undefined

-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let parse line = map read (splitOn " " line) :: [Int]
  let parsedLines = map parse (lines content)
  print (solution1 parsedLines)
  print (solution2 parsedLines)