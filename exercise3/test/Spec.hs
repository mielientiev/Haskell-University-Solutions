import qualified DiscountService
import qualified CheckoutSystem
import Fruit
import Test.QuickCheck.Gen
import Test.QuickCheck
import CheckOut
import Data.Map (Map, (!))
import qualified Data.Map as Map

genFruit :: Gen Fruit
genFruit = oneof[elements[Apple, Orange]]

instance Arbitrary Fruit where
      arbitrary = genFruit



main :: IO ()
main = quickCheck prop_discount_is_less_or_equal_total_price

prop_discount_is_less_or_equal_total_price :: Fruit -> [Fruit] -> Bool
prop_discount_is_less_or_equal_total_price fruit fruits = DiscountService.discount fruit price items <= totalPrice
        where
          items = getItems $ foldMap CheckoutSystem.toChecked fruits
          numOfFruits = Map.findWithDefault 0 fruit items
          price = 0.6
          totalPrice = price * fromInteger numOfFruits


