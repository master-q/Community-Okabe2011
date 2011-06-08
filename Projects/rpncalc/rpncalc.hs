import Prelude
import Control.Monad.State
import qualified Stack as S

toFloat :: String -> Float
toFloat = read

calcStateOpe :: (Float -> Float -> Float)
                -> State (S.SimpleStack String) [String]
calcStateOpe f = do
  x <- get
  let h1 = S.head x
      t1 = S.tail x
      h2 = S.head t1
      t2 = S.tail t1
  put $ S.cons (show $ f (toFloat h2) (toFloat h1)) t2
  return [] -- とくに使わない。。。

calcState :: String -> State (S.SimpleStack String) [String]
calcState "+" = calcStateOpe (+)
calcState "-" = calcStateOpe (-)
calcState "*" = calcStateOpe (*)
calcState "/" = calcStateOpe (/)
calcState l = do
  x <- get
  put $ S.cons l x
  return [] -- とくに使わない。。。

showState' :: S.SimpleStack String -> [String]
showState' ss | S.isEmpty ss = []
              | otherwise = S.head ss:(showState' $ S.tail ss)

showState :: State (S.SimpleStack String) [String]
showState = do
  x <- get
  return $ showState' x

rcalcState :: [String] -> State (S.SimpleStack String) [String]
rcalcState (x:xs) = calcState x >> rcalcState xs
rcalcState [] = showState

rpnCalc :: [String] -> [String]
rpnCalc s = evalState (rcalcState s) S.empty

main :: IO ()
main = do
  x <- getContents
  putStr $ unlines $ rpnCalc $ lines x
