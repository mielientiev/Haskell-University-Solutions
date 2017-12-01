import qualified Sorting
import qualified FizzBuzz
import Test.QuickCheck
import Data.List

prop_right_sort_order_integer xs = sort xs == Sorting.quickSortInteger xs

prop_right_sort_order_for_any_types :: Ord a => [a] -> Bool
prop_right_sort_order_for_any_types xs = sort xs == Sorting.quickSort (>) xs

prop_quick_sort_idempotency :: Ord a => [a] -> Bool
prop_quick_sort_idempotency xs = Sorting.quickSort (>) xs == Sorting.quickSort (>) (Sorting.quickSort (>) xs)


prop_fizz_for_3 n = if ((n `mod` 3 == 0) && n > 0) then "Fizz" `isPrefixOf` FizzBuzz.fizzBuzz n else True
prop_fizz_for_5 n = if ((n `mod` 5 == 0) && n > 0) then "Buzz" `isSuffixOf` FizzBuzz.fizzBuzz n else True
prop_fizz_for_3_and_5 n = if (n `mod` 5 == 0 && n `mod` 3 == 0 && n > 0) then "FizzBuzz" == FizzBuzz.fizzBuzz n else True


main :: IO ()
main = sequence_ 
        [
            quickCheck prop_right_sort_order_integer,
            quickCheck (prop_right_sort_order_for_any_types :: [String] -> Bool),
            quickCheck (prop_right_sort_order_for_any_types :: [Int] -> Bool),
            quickCheck (prop_right_sort_order_for_any_types :: [Double] -> Bool),
            quickCheck (prop_quick_sort_idempotency :: [Int] -> Bool),
            quickCheck (prop_quick_sort_idempotency :: [String] -> Bool),
            quickCheck (prop_fizz_for_3 :: Int -> Bool),
            quickCheck (prop_fizz_for_5 :: Int -> Bool),
            quickCheck (prop_fizz_for_3_and_5 :: Int -> Bool)
        ]
