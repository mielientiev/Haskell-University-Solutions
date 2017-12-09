import qualified DiscountService
import qualified CheckoutSystem
import Fruit
import CheckOut
import Data.Map (Map, (!))
import qualified Data.Map as Map


main :: IO ()
main = print (DiscountService.discount Apple 0.6 (getItems checkout))
    where checkout = CheckoutSystem.toChecked Apple `mappend` CheckoutSystem.toChecked Apple `mappend` CheckoutSystem.toChecked Apple `mappend` CheckoutSystem.toChecked Apple
