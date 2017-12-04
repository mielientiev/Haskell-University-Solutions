module Fruit
( Fruit(..)
) where

import Data.Ord
import Data.Map (Map, (!))
import qualified Data.Map as Map

data Fruit = Apple | Orange deriving (Eq, Show)

instance Ord Fruit where
    compare Apple Apple = EQ
    compare Apple Orange = GT
    compare Orange Orange = EQ
    compare Orange Apple = LT
