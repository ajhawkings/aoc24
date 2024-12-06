import Data.List.Split (splitOn)

-- part 1
solution1 :: [[Int]] -> Int
solution1 = undefined

-- part 2
solution2 :: [[Int]] -> Int
solution2 = undefined


-- output
parseInput :: String -> [[Int]]
parseInput content = map (map read . splitOn " ") (lines content)

main :: IO ()
main = do
  -- input
  input <- readFile "input.txt"
  example <- readFile "example.txt"
  -- output
  putStrLn ("Example 1:   " ++ show (solution1 (parseInput example)))
  putStrLn ("Solution 1:  " ++ show (solution1 (parseInput input)))
  putStrLn ""
  putStrLn ("Example 2:   " ++ show (solution2 (parseInput example)))
  putStrLn ("Solution 2:  " ++ show (solution2 (parseInput input)))