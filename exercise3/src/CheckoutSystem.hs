module CheckoutSystem
    ( checkout,
      toChecked
    , Fruit(..)
    ) where

import CheckOut
import qualified DiscountService
import Fruit
import qualified Data.Map as Map

checkout :: [Fruit] -> Double
checkout arr = totalSum
  where
    checkout = foldMap toChecked arr :: CheckOut
    totalSum = totalDiscount checkout

totalDiscount :: CheckOut -> Double
totalDiscount checkout = getTotal checkout - appleDiscount - orangeDiscount
  where
    appleDiscount = DiscountService.discount Apple (fruitPrice Apple) (getItems checkout)
    orangeDiscount = DiscountService.discount Orange (fruitPrice Orange) (getItems checkout)


fruitPrice :: Fruit -> Double
fruitPrice Apple = 0.6
fruitPrice Orange = 0.25

toChecked :: Fruit -> CheckOut
toChecked x = CheckOut (fruitPrice x) (Map.singleton x 1)