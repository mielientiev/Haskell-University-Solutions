module CheckOut
( CheckOut(..),
  Items
) where

import Fruit
import Data.Monoid
import Money
import Data.Map (Map, (!))
import qualified Data.Map as Map

type Items = Map Fruit Integer

data CheckOut = CheckOut {
    getTotal :: Money,
    getItems :: Items
}

instance Monoid CheckOut where
    mempty = CheckOut 0 Map.empty
    CheckOut sum1 items1 `mappend` CheckOut sum2 items2 = CheckOut (sum1 + sum2) (Map.unionWith (+) items1 items2)
