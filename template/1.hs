import Data.List.Split (splitOn)

-- part 1
solution1 :: [(Int, Int)] -> Int
solution1 = undefined

-- part 2
solution2 :: [(Int, Int)] -> Int
solution2 = undefined

-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let parse line = let [a, b] = splitOn "   " line in (read a, read b)
  let parsedLines = map parse (lines content)
  print (solution1 parsedLines)
  print (solution2 parsedLines)