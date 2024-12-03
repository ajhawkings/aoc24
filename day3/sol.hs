import Text.Regex.TDFA ((=~))

-- part 1
solution1 :: String -> Int
solution1 input = mul (input =~ regex :: [[String]])
    where 
      mul ([_, a, b]:xs) = read a * read b + mul xs
      mul _ = 0
      regex = "mul\\(([0-9]+),([0-9]+)\\)"

-- part 2
solution2 :: String -> Int
solution2 input = mul True (input =~ regex :: [[String]])
  where 
    mul good ([instr, _, a, b]:xs) 
      | instr == "don't()" = mul False xs
      | instr == "do()"    = mul True xs
      | good               = read a * read b + mul good xs
      | otherwise          = mul good xs
    mul _ _ = 0
    regex = "(do\\(\\)|don't\\(\\))|mul\\(([0-9]+),([0-9]+)\\)"

-- print
main :: IO ()
main = do
  content <- readFile "input.txt"
  print (solution1 content)
  print (solution2 content)

-- example input "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"