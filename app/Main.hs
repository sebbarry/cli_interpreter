import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol :: Parser Char
symbol = oneOf "!@#$%^&*|+_/:<=>?@^_" -- define the scheme

readExpr :: String -> String -- this is a function from a string to a string
readExpr input = case parse symbol "lisp" input of
    Left err -> "No match " ++ show err
    Right val -> "found value"  


main :: IO ()
main = do
    (expr:_) <- getArgs -- get the value from the input  and set to expr
    putStrLn (readExpr expr) --pass expr into thed readExpr function defined above 
