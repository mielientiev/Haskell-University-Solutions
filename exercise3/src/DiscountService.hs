module DiscountService where
import Fruit
import CheckOut
import Money
import Data.Map (Map, (!))
import qualified Data.Map as Map

discount :: Fruit -> Money -> Items -> Money
discount fruit price items =
  let numOfFruit = fromInteger (Map.findWithDefault 0 fruit items)
      numOfSkip = fromInteger (discountSkip fruit)
      discount = fromInteger (floor (numOfFruit / numOfSkip)) * price
  in discount


discountSkip :: Fruit -> Integer
discountSkip Apple = 2
discountSkip Orange = 3