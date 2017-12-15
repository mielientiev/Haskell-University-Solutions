module CheckoutSystem
    ( checkout
      , toChecked
      , Fruit(..)
    ) where

import CheckOut
import Money
import qualified DiscountService
import Fruit
import qualified Data.Map as Map

checkout :: [Fruit] -> Money
checkout arr = totalDiscount checkout
  where
    checkout = foldMap toChecked arr :: CheckOut

totalDiscount :: CheckOut -> Money
totalDiscount checkout = getTotal checkout - appleDiscount - orangeDiscount
  where
    appleDiscount = DiscountService.discount Apple (fruitPrice Apple) (getItems checkout)
    orangeDiscount = DiscountService.discount Orange (fruitPrice Orange) (getItems checkout)


fruitPrice :: Fruit -> Money
fruitPrice Apple = 0.6
fruitPrice Orange = 0.25

toChecked :: Fruit -> CheckOut
toChecked x = CheckOut (fruitPrice x) (Map.singleton x 1)