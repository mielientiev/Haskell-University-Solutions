module ConsoleIO(
    readConsoleIO,
    writeIO,
    runConsoleIO
) where

import Control.Monad
import Control.Applicative

data ConsoleIO a = Return a
                | ReadConsoleIO (String -> ConsoleIO a)
                | WriteIO String (ConsoleIO a)


readConsoleIO :: ConsoleIO String
readConsoleIO = ReadConsoleIO Return

writeIO :: String -> ConsoleIO ()
writeIO s = WriteIO s (Return ())

bindConsole :: ConsoleIO a -> (a -> ConsoleIO b) -> ConsoleIO b
bindConsole (Return a) f    = f a
bindConsole (ReadConsoleIO g) f = ReadConsoleIO (\s -> bindConsole(g s) f)
bindConsole (WriteIO str io) f = WriteIO str (bindConsole io f)


mapConsole :: (a -> b) -> ConsoleIO a -> ConsoleIO b
mapConsole f (Return a) = Return (f a)
mapConsole f (ReadConsoleIO g)  = ReadConsoleIO (mapConsole f . g)
mapConsole f (WriteIO str io) = WriteIO str (mapConsole f io) 

instance Monad ConsoleIO where 
    return = Return
    (>>=) = bindConsole

instance Functor ConsoleIO where
    fmap = mapConsole


instance Applicative ConsoleIO where
        pure = return
        (<*>) = ap

runConsoleIO :: ConsoleIO a -> IO a       
runConsoleIO (Return a) = return a
runConsoleIO (WriteIO s io) = putStrLn s >> runConsoleIO io
runConsoleIO (ReadConsoleIO f) = getLine >>= runConsoleIO . f