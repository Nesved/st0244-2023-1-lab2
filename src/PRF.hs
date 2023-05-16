module PRF where

--GHC.Natural allows working with natural numbers by providing the Natural type
import GHC.Natural (Natural)

--An algebraic data type Nat is defined.
data Nat = Zero | Succ Nat deriving (Show, Eq)

--primitive recursion function over natural numbers.
recNat :: a -> (Nat -> a -> a) -> Nat -> a
recNat z _ Zero = z
recNat z s (Succ n) = s n (recNat z s n)

-- The function natToNatural is defined, which converts a Nat to a GHC Natural.
natToNatural :: Nat -> Natural
natToNatural Zero     = 0
natToNatural (Succ n) = 1 + natToNatural n

-- The function naturalToNat is defined, which converts a Natural to a Nat.
naturalToNat :: Natural -> Nat
naturalToNat 0 = Zero
naturalToNat n = Succ (naturalToNat(n - 1))

-- Implementation of the double function.
doubleNat :: Nat -> Nat
doubleNat = recNat Zero addOne
  where
    addOne :: Nat -> Nat -> Nat
    addOne _ acc = Succ (Succ acc)

-- Implementation of the sum function.
addNat :: Nat -> Nat -> Nat
addNat n m = recNat m addOne n
  where addOne :: Nat -> Nat -> Nat
        addOne _ acc = Succ acc

-- Implementation of the identity function.
identity :: Nat -> Nat
identity n = recNat Zero successor n
  where
    successor :: Nat -> Nat -> Nat
    successor _ acc = Succ acc

-- Implementation of the multiplication function.
mulNat :: Nat -> Nat -> Nat
mulNat n m = recNat Zero (mulStep m) n
  where
    mulStep :: Nat -> Nat -> Nat -> Nat
    mulStep _ _ acc = addNat m acc

-- Implementation of the predecessor function.
predNat :: Nat -> Nat
predNat Zero = Zero
predNat (Succ n) = n
