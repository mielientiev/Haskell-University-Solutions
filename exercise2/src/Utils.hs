module Utils
    (split
    ,parseIntArray
    ,parseInt
    ) where

    split :: String -> Char -> [String]
    split [] _ = [""]
    split (x:xs) delim
            | x == delim = "" : rest
            | otherwise = (x : head rest) : tail rest
            where 
                rest = split xs delim

    parseInt :: String -> Int
    parseInt x = read x

    parseIntArray :: [String] -> [Int]
    parseIntArray = map parseInt
