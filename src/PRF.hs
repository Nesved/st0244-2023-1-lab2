module PRF where

import GHC.Natural (Natural)

data Nat = Zero | Succ Nat deriving (Show, Eq)

recNat :: a -> (Nat -> a -> a) -> Nat -> a
recNat z _ Zero = z
recNat z s (Succ n) = s n (recNat z s n)

natToNatural :: Nat -> Natural
natToNatural Zero     = 0
natToNatural (Succ n) = 1 + natToNatural n

naturalToNat :: Natural -> Nat
naturalToNat 0 = Zero
naturalToNat n = Succ (naturalToNat(n - 1))

-- Implementación de la función sucesor
succNat :: Nat -> Nat
succNat n = recNat (Succ Zero) addOne n
  where
    addOne :: Nat -> Nat -> Nat
    addOne _ acc = Succ acc

-- Implementación de la función suma
addNat :: Nat -> Nat -> Nat
addNat n m = recNat m addOne n
  where addOne :: Nat -> Nat -> Nat
        addOne _ acc = Succ acc

-- Implementación de la función de identidad
identity :: Nat -> Nat
identity n = recNat Zero successor n
  where
    successor :: Nat -> Nat -> Nat
    successor _ acc = Succ acc

-- Implementación de la función multiplicación
mulNat :: Nat -> Nat -> Nat
mulNat n m = recNat Zero (mulStep m) n
  where
    mulStep :: Nat -> Nat -> Nat -> Nat
    mulStep _ _ acc = addNat m acc

-- Implementación de la función potencia
powNat :: Nat -> Nat -> Nat
powNat _ Zero = Succ Zero
powNat n (Succ m) = recNat (Succ Zero) (mulStep n) m
  where
    mulStep :: Nat -> Nat -> Nat -> Nat
    mulStep _ acc _ = mulNat n acc
