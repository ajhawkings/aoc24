import Prelude
import Data.Char (ord)

-- solution
solution :: [String] -> Int
solution = product . map (ord . head)


-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  let sol = solution (lines content)
  print sol

-- readDB :: IO [String]
-- readDB = do dbl <- readFile "input.txt"
--             let db = map readLine (lines dbl)
--             putStrLn (force (show db) `seq` "Done")
--             return db

-- readLine :: String -> (String,String)
-- readLine str = (a,(c,b))
--     where
--       (a,str2) = splitUpon ',' str
--       (b,c)    = splitUpon ',' str2

-- splitUpon :: Char -> String -> (String,String)
-- splitUpon _ "" = ("","")
-- splitUpon c (x:xs) | x == c    = ("",xs)
--                    | otherwise = (x:ys,zs)
--                    where
--                      (ys,zs) = splitUpon c xs
