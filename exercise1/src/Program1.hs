module Program1
    (
        helloWorld
    ) where

import Control.Monad

helloWorld :: IO()
helloWorld = putStrLn("Hello World")