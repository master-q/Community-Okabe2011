import Prelude
import Control.Monad.State

numState :: State Int Int -- カウンタ制御がここに集中してる
numState = do x <- get
              put (x + 1)
              return (x + 1)

addNumber :: Int -> [String] -> [String] -- これで、、、いいわけない、、、
addNumber n (l:ls) = [show a ++ ": " ++ l] ++ addNumber s ls
                     where (a, s) = runState numState n
addNumber _ [] = []

main :: IO ()
main = do
  x <- getContents
  putStr $ unlines $ addNumber 0 $ lines x
