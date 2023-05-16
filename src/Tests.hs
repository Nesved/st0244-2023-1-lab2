-- The PRF, Test.QuickCheck.Instances.Natural, -
-- and GHC.Natural(Natural)ibraries are imported.

-- These libraries provide functionalities related to property testing -
-- and manipulation of natural numbers.

-- The Main module performs tests using the PRF and Test.QuickCheck libraries.

module Main where
import PRF
import Test.QuickCheck.Instances.Natural ()
import GHC.Natural(Natural)
import Test.QuickCheck

-- The double of a natural number is equal to the sum of the number with itself
-- The double of n is equal to n + n.
prop_doubleNat :: Natural -> Bool
prop_doubleNat n = natToNatural (doubleNat n') == n + n
  where
    n' :: Nat
    n' = naturalToNat n

-- Check that the sum of two natural numbers is commutative.
-- The sum of n and m is equal to the sum of m and n.
prop_comm_addNat :: Natural -> Natural -> Bool
prop_comm_addNat n m = natToNatural(addNat n' m') == m + n
  where
    n', m':: Nat
    m' = naturalToNat m
    n' = naturalToNat n

-- Application of identity. any natural number should return the same number.
prop_identity :: Natural -> Bool
prop_identity n = natToNatural (identity n') == n
  where
    n' :: Nat
    n' = naturalToNat n

-- Verify that the multiplication of two natural numbers is commutative.
-- The multiplication of n and m is equal to the multiplication of m and n.
prop_comm_mulNat :: Natural -> Natural -> Bool
prop_comm_mulNat n m = natToNatural(mulNat n' m') == m * n
  where
    n', m':: Nat
    m' = naturalToNat m
    n' = naturalToNat n

-- Verify that the predecessor of a natural number is equal to n - 1.
-- If the number is zero, consider it true.
-- The predecessor of n is equal to n - 1.
prop_predNat :: Natural -> Bool
prop_predNat n
  | n == 0 = True
  | otherwise = natToNatural (predNat n') == n - 1
  where
    n' :: Nat
    n' = naturalToNat n

--The main function.
--Tests are executed using the quickCheck function for each of the properties.
main :: IO ()
main = do
  quickCheck prop_doubleNat
  quickCheck prop_comm_addNat
  quickCheck prop_identity
  quickCheck prop_comm_mulNat
  quickCheck prop_predNat
