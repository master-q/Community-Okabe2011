module Stack (Stack(..), SimpleStack) where
import Prelude hiding (head, tail)

class Stack s where
  empty   :: s a
  isEmpty :: s a -> Bool
  cons    :: a -> s a -> s a
  head    :: s a -> a
  tail    :: s a -> s a

data SimpleStack a = SS [a]
                     deriving (Eq)

instance Stack SimpleStack where
  empty = SS []
  isEmpty (SS ss) = null ss
  cons x (SS ss) = SS (x : ss)
  head (SS (x:xs)) = x
  head (SS []) = error "empty SimpleStack"
  tail (SS (x:xs)) = SS xs
  tail (SS []) = error "empty SimpleStack"
