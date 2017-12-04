module CheckoutSystem
    ( checkout
    , Fruit(..)
    ) where

import CheckOut
import Fruit
import qualified Data.Map as Map

checkout :: [Fruit]  -> Double
checkout arr = getTotal (foldMap toChecked arr :: CheckOut)

fruitPrice :: Fruit -> Double
fruitPrice Apple = 0.6
fruitPrice Orange = 0.25

toChecked :: Fruit -> CheckOut
toChecked x = CheckOut (fruitPrice x) (Map.singleton x 1)