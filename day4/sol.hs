import Data.List (isPrefixOf, tails, intersect, transpose)
import Data.Universe.Helpers (diagonals)

-- part 1
solution1 :: [String] -> Int
solution1 str = countMatches [str, transpose str, diagonals str, diagonals (map reverse str)]
  where
    findInStr = length . filter (isPrefixOf "XMAS") . tails
    countMatches types = sum [sum [findInStr x + findInStr (reverse x) | x <- xs] | xs <- types]

-- part 2
solution2 :: [String] -> Int
solution2 = length . filter checkX . getAll3x3s
  where
    getAll3x3s = concatMap splitInto3s . transpose . map splitInto3s
    splitInto3s xs = [take 3 ts | ts <- tails xs, length ts >= 3]  -- take 3 from tails of xs
    checkX xs = all (any (`elem` ["SAM","MAS"])) [diagonals xs, diagonals (map reverse xs)]
--  checkX xs = (length (["SAM","MAS"] `intersect` diagonals xs) == 1) 
--           && (length (["SAM","MAS"] `intersect` diagonals (map reverse xs)) == 1)

-- print
main :: IO ()
main = do
  -- input
  input <- readFile "input.txt"
  example <- readFile "example.txt"
  -- parse
  let parse = lines
  -- output
  putStrLn ("Example 1:   " ++ show (solution1 (parse example)))
  putStrLn ("Solution 1:  " ++ show (solution1 (parse input)))
  putStrLn ""
  putStrLn ("Example 2:   " ++ show (solution2 (parse example)))
  putStrLn ("Solution 2:  " ++ show (solution2 (parse input)))

-- example
example :: [String]
example = ["MXMX","XAXX","SXSX"]