module FizzBuzz
    (fizzBuzz,
     fizzBuzzList
    ) where

fizzBuzzList :: Int -> [String]
fizzBuzzList x
    | x > 0 = map fizzBuzz [1..x]
    | otherwise = [""]


fizzBuzz :: Int -> String
fizzBuzz y
    | mod y 3 == 0 && mod y 5 == 0 = "FizzBuzz"
    | mod y 3 == 0 = "Fizz"
    | mod y 5 == 0 = "Buzz"
    | otherwise = show y