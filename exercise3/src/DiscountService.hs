module DiscountService(
  discount
) where

import Fruit
import CheckOut
import Data.Map (Map, (!))
import qualified Data.Map as Map

type Price = Double

discount :: Fruit -> Price -> Items -> Double
discount fruit price items =
  let numOfFruit = fromInteger (Map.findWithDefault 0 fruit items)
      numOfSkip = fromInteger (discountSkip fruit)
      discount = fromInteger (floor (numOfFruit / numOfSkip)) * price
  in discount


discountSkip :: Fruit -> Integer
discountSkip Apple = 2
discountSkip Orange = 3