module CheckOut
( CheckOut(..)
) where

import Fruit
import Data.Monoid
import Data.Map (Map, (!))
import qualified Data.Map as Map

data CheckOut = CheckOut {
    getTotal :: Double,
    getItems :: Map Fruit Integer
}

instance Monoid CheckOut where
    mempty = CheckOut 0 Map.empty
    CheckOut sum1 items1 `mappend` CheckOut sum2 items2 = CheckOut (sum1 + sum2) (Map.union items1 items2)