
-- CSCE 314 [Section 500] Programming Languages Spring 2020
-- Homework Assignment 3

-- Problem 1 (5 points)
-- Student Name: Andrew Han
-- UIN: 227009495
-- (ACKNOWLEDGE ANY HELP RECEIVED HERE)

module Main where

import Test.HUnit
import System.Exit

data Nat = Zero | Succ Nat   deriving (Show, Eq)

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

-- Problem 2 (10 points) Chapter 8, Exercise 1
mult :: Nat -> Nat -> Nat
mult m Zero = Zero
mult m (Succ n) = add m (mult m n)

{- Here, write your step-by-step explanation of how 2*2=4 proceeds.
mult (Succ (Succ Zero)) (Succ (Succ Zero))
= 	{applying mult}
add (Succ(Succ Zero)) (mult (Succ(Succ Zero)) Succ Zero)
=	{applying mult}
add (Succ(Succ Zero)) (add (Succ(Succ Zero)) (mult (Succ(Succ Zero)) Zero)
=	{applying mult}
add (Succ(Succ Zero)) (add (Succ(Succ Zero)) Zero)
=	{applying add}
add (Succ(Succ Zero)) (Succ (add (Succ Zero) Zero)
=	{applying add}
add (Succ(Succ Zero)) (Succ (Succ (add Zero Zero))
=	{applying add}
add (Succ(Succ Zero)) (Succ(Succ Zero))
=	{applying add}
Succ (add (Succ Zero) (Succ(Succ Zero))
=	{applying add}
Succ (Succ (add Zero (Succ(Succ Zero)))
=	{applying add}
Succ (Succ (Succ (Succ Zero)))
-}



-- Problem 3 (25 points, see below the points distribution)
-- Chapter 16, Exercise 6 (Modified)

data Tree = Leaf Int | Node Tree Tree

--------------- Tree objects
tree1 :: Tree   -- to be used to test Problem 3.1
tree1 = Node
           (Node
              (Node (Leaf 1) (Leaf 2))
              (Leaf 3)
           )
           (Node
              (Leaf 4)
              (Node (Leaf 5) (Leaf 6))
           )

tree2 :: Tree   -- to be used to test Problem 3.1
tree2 = Node
           (Leaf 7)
           (Node
              (Node (Leaf 8) (Leaf 9))
              (Node (Leaf 10) (Leaf 11))
           )
---------------

-- Problem 3.1 (5 + 5 = 10 points)
leaves :: Tree -> Int
leaves (Leaf _) = 1
leaves (Node left right) = leaves left + leaves right

nodes :: Tree -> Int
nodes (Leaf _) = 0
nodes (Node left right) = 1 + nodes left + nodes right

-- Problem 3.2 (Base case 5 points + inductive case 10 points = 15 points)
{-- (Write your induction proof within this block comment.)
Base case:
leaves (Leaf n)
=	{specification of leaves}
nodes (Leaf n) + 1
=	{applying nodes}
0 + 1
=	{applying +}
1

Because leaves (Leaf n) = 1 and nodes (Leaf n) + 1 = 1, the statement stands
for t = (Leaf n).

Inductive case: (Make sure that you state the induction hypothesis!)
As induction hypothesis, assume that t = (Leaf n) stands for that expression.

leaves (Node left right)
=	{specification of leaves}
nodes (Node left right) + 1
=	{applying nodes}
1 + nodes left + nodes right + 1
=	{commutativity of +}
nodes left + 1 + nodes right + 1
=	{induction hypothesis on nodes}
leaves left + leaves right
=	{definition of leaves}
leaves (Node left right)

Therefore, we can conclude that the expression stands for t = (Node left right)
--}


-- Problem 4 (60 points) Chapter 8, Exercise 9
data Expr = Val Int | Add Expr Expr | Mul Expr Expr

type Cont = [Op]

data Op = EVALA Expr | ADD Int | EVALM Expr | MUL Int

eval :: Expr -> Cont -> Int
-- Give three definitions for eval.
-- First two definitions,
-- 1) for (Val n) and c as arguments and
-- 2) for (Add x y) and c as arguments
-- are already given in the text Section 8.7, but
-- you need to modify the second definition slightly
-- and give the third definition for (Mul x y)
eval (Val n) c = exec c n
eval (Add x y) c = eval x (EVALA y : c)
eval (Mul x y) c = eval x (EVALM y : c)

exec :: Cont -> Int -> Int
-- Give five definitions for exec, one for an empty list and
-- one for each of the four constructors of the data type Op 
exec [] n = n
exec (EVALA y : c) n = eval y (ADD n : c)
exec (ADD n : c) m = exec c (n+m)
exec (EVALM y : c) n = eval y (MUL n : c)
exec (MUL n : c) m = exec c (n*m)

value :: Expr -> Int
value e = eval e []

-- Following expressions are to test your eval and exec definitions
-- (2 + 3) + 4 = 9
e1 = (Val 3)    -- 3
e2 = (Add (Val 4) (Val 3))  -- 4 + 3 = 7
e3 = (Mul (Val 4) (Val 3))  -- 4 * 3 = 12
e4 = (Add (Add (Val 2) (Val 3)) (Val 4))  -- (2 + 3) + 4 = 9
e5 = (Mul (Mul (Val 2) (Val 3)) (Val 4))  -- (2 * 3) * 4 = 24
e6 = (Mul (Add (Val 2) (Val 3)) (Val 4))  -- (2 + 3) * 4 = 20
e7 = (Add (Mul (Val 2) (Val 3)) (Val 4))  -- (2 * 3) + 4 = 10
e8 = (Add (Mul (Val 2) (Val 3)) (Add (Val 4) (Val 5))) -- (2 * 3) + (4 + 5) = 15
e9 = (Mul (Add (Val 2) (Val 3)) (Add (Val 4) (Val 5))) -- (2 + 3) * (4 + 5) = 45
e10 = (Add (Mul (Add (Val 2) (Val 3)) (Mul (Val 4) (Val 5))) (Mul (Val 3) (Add (Val 4) (Val 7)))) -- ((2 + 3) * (4 * 5)) + (3 * (4 + 7)) = 133


myTestList = 
  TestList [
  
    "add 1" ~: add (Succ (Succ Zero)) (Succ Zero) ~=? Succ (Succ (Succ Zero))
  , "mult 1" ~: mult (Succ (Succ Zero)) (Succ Zero) ~=? Succ (Succ Zero)
  , "mult 2" ~: mult (Succ (Succ Zero)) (Succ (Succ Zero)) ~=? Succ (Succ (Succ (Succ Zero)))
  , "mult 3" ~: mult (Succ (Succ (Succ Zero))) (Succ (Succ Zero)) ~=? Succ (Succ (Succ (Succ (Succ (Succ Zero)))))
 
  , "leaves 1" ~: leaves tree1 ~=? 6
  , "leaves 2" ~: leaves tree2 ~=? 5
  , "nodes 1" ~: nodes tree1 ~=? 5
  , "nodes 1" ~: nodes tree2 ~=? 4

  , "value 1" ~: value e1 ~=? 3
  , "value 2" ~: value e2 ~=? 7
  , "value 3" ~: value e3 ~=? 12
  , "value 4" ~: value e4 ~=? 9
  , "value 5" ~: value e5 ~=? 24
  , "value 6" ~: value e6 ~=? 20
  , "value 7" ~: value e7 ~=? 10
  , "value 8" ~: value e8 ~=? 15
  , "value 9" ~: value e9 ~=? 45
  , "value 10" ~: value e10 ~=? 133
  
    ]

main = do c <- runTestTT myTestList
          putStrLn $ show c
          let errs = errors c
              fails = failures c
          exitWith (codeGet errs fails)
          
codeGet errs fails
 | fails > 0       = ExitFailure 2
 | errs > 0        = ExitFailure 1
 | otherwise       = ExitSuccess

