module Program3
    (
        welcomeUser
    ) where

import Control.Monad
import qualified Program2 

welcomeUser :: IO()
welcomeUser = forever Program2.welcomeUser