module FizzBuzz
    (fizzBuzz
    ) where

    fizzBuzz :: Int -> [String]
    fizzBuzz x
        | x > 0 = [isFizzBuzz y |y <- [1..x]]
        | otherwise = [""]


    isFizzBuzz :: Int -> String
    isFizzBuzz y
        | mod y 3 == 0 && mod y 5 == 0 = "FizzBuzz"
        | mod y 3 == 0 = "Fizz"
        | mod y 5 == 0 = "Buzz"
        | otherwise = show y