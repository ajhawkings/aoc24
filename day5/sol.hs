{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}

import Data.List (elemIndex, permutations, sortBy)
import Data.List.Split (splitOn)

-- part 1
solution1 :: ([(Int, Int)], [[Int]]) -> Int
solution1 (instrs, updates) = sum . map middle . filter (correctOrder instrs) $ updates

correctOrder :: [(Int, Int)] -> [Int] -> Bool
correctOrder instrs update = all (`checkRule` update) instrs
  where
    checkRule (e1, e2) u
      | e1 `notElem` u = True
      | e2 `notElem` u = True
      | elemIndex e1 u < elemIndex e2 u = True
      | otherwise = False

middle :: [a] -> a
middle xs = xs !! (length xs `div` 2)

-- part 2
solution2 :: ([(Int, Int)], [[Int]]) -> Int
solution2 (instrs, updates) = sum . map (middle . findCorrect instrs) . filter (not . correctOrder instrs) $ updates

findCorrect :: [(Int, Int)] -> [Int] -> [Int]
findCorrect instrs update = sortBy (compare instrs) update
  where compare rules e1 e2
          | (e1, e2) `elem` rules = LT -- e1 should come before e2
          | (e2, e1) `elem` rules = GT -- e2 should come before e1
          | otherwise             = EQ -- order doesn't matter


-- output
parseInput :: String -> ([(Int, Int)], [[Int]])
parseInput content = (map ((\[x, y] -> (read x, read y)) . splitOn "|") a, map (map read . splitOn ",") b)
  where [a, b] = splitOn [""] (lines content)

main :: IO ()
main = do
  -- input
  input <- readFile "input.txt"
  example <- readFile "example.txt"
  -- output
  putStrLn ("Example 1:   " ++ show (solution1 (parseInput example)))
  putStrLn ("Solution 1:  " ++ show (solution1 (parseInput input)));
  putStrLn ""
  putStrLn ("Example 2:   " ++ show (solution2 (parseInput example)))
  putStrLn ("Solution 2:  " ++ show (solution2 (parseInput input)))
