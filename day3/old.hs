import Text.Parsec
import Text.Parsec.String (Parser)
import Data.Either (fromRight)

-- part 1
solution1 :: String -> Int
solution1 input = sum $ fromRight [] $ parse parseAllMuls "" input

parseAllMuls :: Parser [Int]
parseAllMuls = many $ do
  _ <- manyTill anyChar (try (string "mul("))
  d <- many1 digit
  _ <- char ','
  e <- many1 digit
  _ <- char ')'
  return (read d * read e)

-- part 2
solution2 :: String -> Int
solution2 = undefined

-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  print (solution1 content)
  print (solution2 content)

-- example input "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"