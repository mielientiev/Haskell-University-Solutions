module Sorting
    ( quickSortInteger
    , quickSort
    ) where


import Data.List

quickSortInteger :: [Int] -> [Int]
quickSortInteger [] = []
quickSortInteger (x:xs) = quickSortInteger left ++ [x] ++ quickSortInteger right
         where
            partitionedArr = partition (<x) xs
            left = fst partitionedArr
            right = snd partitionedArr


quickSort :: Ord a => (a -> a -> Bool) -> [a] -> [a]
quickSort _ [] = []
quickSort prd (x:xs) = quickSort prd left ++ [x] ++ quickSort prd right
        where
            partitionedArr = partition (prd x) xs
            left = fst partitionedArr
            right = snd partitionedArr
