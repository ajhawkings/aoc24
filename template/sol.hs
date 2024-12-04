import Data.List.Split (splitOn)

-- part 1
solution1 :: [[Char]] -> Int
solution1 = undefined

-- part 2
solution2 :: [[Char]] -> Int
solution2 = undefined

main :: IO ()
main = do
  -- input
  input <- readFile "input.txt"
  example <- readFile "example.txt"
  -- parse
  let parse = lines
  -- let parse content = map (map read . splitOn " ") (lines content) :: [[Int]]
  -- output
  putStrLn ("Example 1:   " ++ show (solution1 (parse example)))
  putStrLn ("Solution 1:  " ++ show (solution1 (parse input)))
  putStrLn ""
  putStrLn ("Example 2:   " ++ show (solution2 (parse example)))
  putStrLn ("Solution 2:  " ++ show (solution2 (parse input)))