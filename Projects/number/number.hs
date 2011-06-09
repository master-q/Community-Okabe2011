import Prelude
import Control.Monad.State

addNumber :: String -> State Int String
addNumber l = do modify (+1)
                 x <- get
                 return (show x ++ ": " ++ l)

main :: IO ()
main = interact $ unlines . flip evalState 0 . mapM addNumber . lines
