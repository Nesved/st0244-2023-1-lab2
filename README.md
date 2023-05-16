# st0244-2023-1-lab2

Members: NESVED LONDOÑO QUINTERO
Operatyng System: Windows 11 Pro 21H1
GHC version: version 9.6.1
QuickCheck version: 2.14.2
QuicCheck-intances version: 0.3.29.1

Implementation of Functions on Natural Numbers in Haskell

In this report, we will describe the solution implemented to solve the project of implementing five functions on natural numbers using the Nat data type and primitive recursion in Haskell. Additionally, tests were conducted using the QuickCheck library to verify the correct implementation of the functions.

1. Definition of the Nat Data Type
The first step was to define the Nat data type, which represents natural numbers. An algebraic approach was used to define the Nat type with two constructors: Zero to represent zero and Succ to represent the successor of another natural number.

data Nat = Zero | Succ Nat deriving (Show, Eq)

With this definition, we were able to work recursively on natural numbers using the Zero and Succ constructors.

2. Primitive Recursion Functions
The recNat function was implemented, which allows performing recursive operations on natural numbers. The recNat function takes a base value, a function that combines the recursive result with the current number, and a natural number on which to apply recursion.

recNat :: a -> (Nat -> a -> a) -> Nat -> a
recNat z _ Zero = z
recNat z s (Succ n) = s n (recNat z s n)

This function is essential for implementing the other functions on natural numbers as it provides a structured recursion mechanism.

3. Implementation of Functions on Natural Numbers
Five functions were implemented using primitive recursion and the Nat data type. Each of the implemented functions is briefly described below:

- doubleNat: Calculates the double of a natural number using primitive recursion. It applies the recNat function with a base value of Zero and a function that adds two successors to the accumulator at each step.
- addNat: Performs the addition of two natural numbers using primitive recursion. It applies the recNat function with the second number as the base value and a function that adds a successor to the accumulator at each step.
- identity: Returns the same natural number that is passed as an argument. It uses primitive recursion with a base value of Zero and a function that adds a successor to the accumulator at each step.
- mulNat: Calculates the product of two natural numbers using primitive recursion. It applies the recNat function with a base value of Zero and a function that adds the second number to the accumulator at each step.
- predNat: Returns the predecessor of a natural number. If the number is zero, the same number is returned.

4. QuickCheck Testing
Property tests from the QuickCheck library were used to verify the correct implementation of the functions on natural numbers. Five properties were defined, one for each implemented function. Brief descriptions of the defined properties are provided below:

- prop_doubleNat: Verifies that the double of a natural number is equal to the sum of the number with itself.

- prop_comm_addNat: Verifies that the addition of two natural numbers is commutative.

- prop_identity: Verifies that the identity applied to any natural number returns the same number.

- prop_comm_mulNat: Verifies that the multiplication of two natural numbers is commutative.

- prop_predNat: Verifies that the predecessor of a natural number is equal to n - 1. If the number is zero, it is considered true.

These properties were tested using the quickCheck function from QuickCheck, which generated random test cases and verified that the properties held.

Conclusion

In this project, five functions on natural numbers were implemented using the Nat data type and primitive recursion in Haskell. The functions were verified using property testing with QuickCheck, ensuring their correctness in different test cases. The use of primitive recursion allowed for structured operations on natural numbers, and the implementation of the functions met the requirements stated in the project description.
