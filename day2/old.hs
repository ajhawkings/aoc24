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

-- safe2 :: [Int] -> Bool
-- safe2 xs | safe (diffs xs) = True
--          | length (filter (<=0) (diffs xs)) == 1 = safe (removeOne (<=0) xs)
--          | length (filter (>=0) (diffs xs)) == 1 = safe (removeOne (>=0) xs)
--          | length (filter (>3) (diffs xs)) == 1 = safe (removeOne (>3) xs)
--          | length (filter (<(-3)) (diffs xs)) == 1 = safe (removeOne (<(-3)) xs)
--          | otherwise = False

-- removeOne :: (Int -> Bool) -> [Int] -> [Int]
-- removeOne f xs = let (ys,z:zs) = splitAt (fromJust $ elemIndex (head (filter f (diffs xs))) (diffs xs)) (diffs xs)
--                 in (if null ys then zs else (if null zs then ys else init ys ++ [last ys + z] ++ zs))


-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let parse line = map read (splitOn " " line) :: [Int]
  let parsedLines = map parse (lines content)
  print (solution1 parsedLines)
  print (solution2 parsedLines)