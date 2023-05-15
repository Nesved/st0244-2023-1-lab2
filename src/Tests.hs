module Main where
import PRF
import Test.QuickCheck.Instances.Natural ()
import GHC.Natural(Natural)
import Test.QuickCheck

-- El sucesor de un número natural es igual a ese número más uno
prop_succNat :: Natural -> Bool
prop_succNat n = natToNatural (succNat n') == n + 1
  where
    n' :: Nat
    n' = naturalToNat n

-- La suma de n y m es igual a la suma de m y n
prop_comm_addNat :: Natural -> Natural -> Bool
prop_comm_addNat n m = natToNatural(addNat n' m') == n + m
  where
    n', m':: Nat
    m' = naturalToNat m
    n' = naturalToNat n

-- La división de n entre m da como resultado un cociente y un residuo que, al multiplicarse por m y sumarse el residuo, se obtiene n nuevamente.
prop_divNat :: Natural -> Natural -> Property
prop_divNat n m =
  m /= 0 ==> natToNatural (divNat n' m') * m + natToNatural (modNat n' m') == n
  where
    n', m' :: Nat
    n' = naturalToNat n
    m' = naturalToNat m

-- La multiplicación de n y m es igual a la multiplicación de m y n
prop_comm_mulNat :: Natural -> Natural -> Bool
prop_comm_mulNat n m = natToNatural(mulNat n' m') == m * n
  where
    n', m':: Nat
    m' = naturalToNat m
    n' = naturalToNat n

-- La potencia de n elevado a 0 siempre es 1
--prop_powNat_zero :: Natural -> Bool
--prop_powNat_zero n = natToNatural(powNat n' Zero) == n
--  where
--    n':: Nat
--    n' = naturalToNat n


-- La potencia de n elevado a 1 siempre es n
prop_powNat_one :: Nat -> Bool
prop_powNat_one n = powNat n (Succ Zero) == n

main :: IO ()
main = do
  quickCheck prop_succNat
  quickCheck prop_comm_addNat
  quickCheck prop_subNat_if
  quickCheck prop_comm_mulNat
--  quickCheck prop_powNat_one
