import Prelude
import Data.Char (ord, intToDigit, digitToInt)
import Data.List (sort)
import Data.List.Split (splitOn)
import Data.List.Extra (intersect)

-- part 1
solution :: [String] -> Int
solution = sum . map (abs . uncurry subtract) . sortFix . unzip . cnv . map (splitOn "   ")

cnv :: [[String]] -> [(Int, Int)]
cnv = map (\ x -> (strToInt (head x), strToInt (head (tail x))))

sortFix :: ([Int], [Int]) -> [(Int, Int)]
sortFix x = zip (sort (fst x)) (sort (snd x))

strToInt :: String -> Int
strToInt = foldl (\acc x -> acc * 10 + digitToInt x) 0


-- part 2
solution2 :: [String] -> Int
solution2 = similarity . unzip . cnv . map (splitOn "   ")

similarity :: ([Int], [Int]) -> Int
similarity xs = sum [x * length [True | y <- snd xs, x == y] | x <- fst xs]


-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let sol1 = solution (lines content)
  let sol2 = solution2 (lines content)
  print sol1
  print sol2


