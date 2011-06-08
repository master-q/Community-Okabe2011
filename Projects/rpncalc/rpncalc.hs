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
  return [] -- 表示なし

showState' :: S.SimpleStack String -> [String]
showState' ss | S.isEmpty ss = []
              | otherwise = S.head ss:(showState' $ S.tail ss)

calcState :: String -> State (S.SimpleStack String) [String]
calcState "+" = calcStateOpe (+)
calcState "-" = calcStateOpe (-)
calcState "*" = calcStateOpe (*)
calcState "/" = calcStateOpe (/)
calcState "clear" = do
  put $ S.empty
  return []
calcState "drop" = do
  x <- get
  put $ S.tail x
  return []
calcState "swap" = do
  x <- get
  let h1 = S.head x
      t1 = S.tail x
      h2 = S.head t1
      t2 = S.tail t1
  put $ S.cons h2 $ S.cons h1 $ t2
  return []
calcState "display" = do
  x <- get
  return $ showState' x -- 今のスタックを表示
calcState l = do
  x <- get
  put $ S.cons (show (toFloat l)) x
  return [] -- 表示なし

rcalcState :: [String] -> [String] -> State (S.SimpleStack String) [String]
rcalcState (x:xs) r = do r1 <- calcState x
                         rcalcState xs (r ++ r1)
rcalcState [] r = return r

rpnCalc :: [String] -> [String]
rpnCalc s = evalState (rcalcState s []) S.empty

main :: IO ()
main = do
  x <- getContents
  putStr $ unlines $ rpnCalc $ lines x
