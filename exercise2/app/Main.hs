module Main where
    
    import qualified Sorting
    import qualified Utils
    import qualified FizzBuzz
    import System.Environment
    import Data.List
    import Control.Monad
    
    main :: IO ()
    main = do 
        putStrLn "1 - sorting task \n2 - fuzz bar"
        line <- getLine
        let n = Utils.parseInt line;
        chooseCommand n
    
    chooseCommand :: Int -> IO()
    chooseCommand 1 = sortingTask
    chooseCommand 2 = do 
        putStrLn "Enter number:"
        line <- getLine
        let n = Utils.parseInt line;
        putStrLn $ show $ FizzBuzz.fizzBuzz n
    chooseCommand _ = putStrLn "Invalid Command" 
    
    sortingTask :: IO()
    sortingTask = do
        putStrLn "Enter Array:"
        line <- getLine
        let numbers = Utils.split line ' '
        let n = Utils.parseIntArray numbers;
        print $ Sorting.quickSort (>) n