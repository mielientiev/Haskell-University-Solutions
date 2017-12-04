module Main where

import CheckoutSystem

main :: IO ()
main = print $ checkout [Apple,  Orange, Apple, Apple]
