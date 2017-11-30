import qualified Sorting
import Test.QuickCheck
import Data.List

prop_right_sort_order_integer xs = sort xs == Sorting.quickSortInteger xs

prop_right_sort_order_for_any_types :: Ord a => [a] -> Bool
prop_right_sort_order_for_any_types xs = sort xs == Sorting.quickSort (>) xs

prop_quick_sort_idempotency :: Ord a => [a] -> Bool
prop_quick_sort_idempotency xs = Sorting.quickSort (>) xs == Sorting.quickSort (>) (Sorting.quickSort (>) xs)

main :: IO ()
main = sequence_ 
        [
            quickCheck prop_right_sort_order_integer,
            quickCheck (prop_right_sort_order_for_any_types :: [String] -> Bool),
            quickCheck (prop_right_sort_order_for_any_types :: [Int] -> Bool),
            quickCheck (prop_right_sort_order_for_any_types :: [Double] -> Bool),
            quickCheck (prop_quick_sort_idempotency :: [Int] -> Bool),
            quickCheck (prop_quick_sort_idempotency :: [String] -> Bool)
        ]
