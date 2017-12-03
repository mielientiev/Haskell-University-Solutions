module CheckoutSystem
    ( checkout
    , Fruit(..)
    ) where

import Data.Ord 
import Data.Monoid
import Data.Map (Map, (!))
import qualified Data.Map as Map


data Fruit = Apple | Orange deriving (Eq, Show)

instance Ord Fruit where
    compare Apple Apple = EQ
    compare Apple Orange = GT
    compare Orange Orange = EQ
    compare Orange Apple = LT

checkout :: [Fruit] -> Double
checkout arr = total (foldMap toChecked arr)


fruitPrice :: Fruit -> Double
fruitPrice Apple = 0.6
fruitPrice Orange = 0.25


data Checked = Checked {
                total :: Double,
                items :: Map Fruit Integer
            }

toChecked :: Fruit -> Checked
toChecked x = Checked (fruitPrice x) (Map.singleton x 1)
            
instance Monoid Checked where
    mempty = Checked 0 Map.empty
    Checked sum1 m1 `mappend` Checked sum2 m2 = Checked (sum1 + sum2) (Map.unionWith (+) m1 m2)
