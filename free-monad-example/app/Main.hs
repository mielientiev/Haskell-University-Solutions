module Main where

import qualified ConsoleIO

main :: IO ()
main = ConsoleIO.runConsoleIO helloWorld

helloWorld = do ConsoleIO.writeIO "What is your name?"
                name <- ConsoleIO.readConsoleIO
                ConsoleIO.writeIO $ "Nice to meet you, " ++ name

