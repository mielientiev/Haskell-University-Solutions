module Program2
        (
            welcomeUser
        ) where

welcomeUser :: IO()
welcomeUser = do
    putStrLn "Hello, what is your name?"
    name <- getLine
    putStrLn $ "Nice to meet you " ++ name