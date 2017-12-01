module Main where
    
import qualified Sorting
import qualified Utils
import qualified FizzBuzz
import System.Environment
import Data.List
import Control.Monad
    
main :: IO()
main = do 
    putStrLn "1 - sorting task \n2 - fizz bazz"
    line <- getLine
    let n = Utils.parseInt line;
    chooseCommand n
    
chooseCommand :: Int -> IO()
chooseCommand 1 = sortingTask
chooseCommand 2 = fizzBuzzTask
chooseCommand _ = putStrLn "Invalid Command" 
    
fizzBuzzTask :: IO()
fizzBuzzTask = do 
    putStrLn "Enter number:"
    line <- getLine
    let n = Utils.parseInt line;
    print (FizzBuzz.fizzBuzzList n)

sortingTask :: IO()
sortingTask = do
    putStrLn "Enter Array:"
    line <- getLine
    let numbers = Utils.parseIntArray $ Utils.split line ' '
    print $ Sorting.quickSort (>) numbers