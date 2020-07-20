
-- CSCE 314 [Sec. 500] Programming Languages Spring 2020 Hyunyoung Lee
-- Homework Assignment 4A: Exercise 12.7
-- This is an individual assignment.  Remembr the Aggie Honor Code!
-- You will earn total 40 points in this assignment.
-- Deadline: 10:00 p.m. Monday, March 2, 2020

-- Problem 1 (3 points)
-- Student Name: Andrew Han
-- UIN: 227009495
-- (ACKNOWLEDGE ANY HELP RECEIVED HERE)

module Main where

import Test.HUnit
import System.Exit


-- Chapter 12 Exercise 7 (37 points)
data Expr a = Var a | Val Int | Add (Expr a) (Expr a)
              deriving Show

instance Functor Expr where
-- fmap :: (a -> b) -> Expr a -> Expr b
-- P1. [10 points] Give three definitions for fmap for Expr 
   fmap g (Var x) = Var (g x)
   fmap _ (Val y) = Val y
   fmap g (Add (x) (y)) = Add (fmap g x) (fmap g y)

instance Applicative Expr where
-- pure :: a -> Expr a
   pure = Var

-- <*> :: Expr (a -> b) -> Expr a -> Expr b
-- P2. [10 points] Give three definitions for (<*>) for Expr
   (<*>) (Var g) x = fmap g x
   (<*>) (Val x) _ = Val x
   (<*>) (Add (f) (g)) z = Add (f <*> z) (g <*> z)
{-
let es1 = Add (Var "Hi") (Var "5")
let es2 = Add (Var " you") (Var " there")
Var (++) <*> es1 <*> es2
Add (Add (Var "Hi you") (Var "Hi there")) (Add (Var "5 you") (Var "5 there"))
Var (++) <*> es1 <*> Add (Var " you") (Val 3)
Add (Add (Var "Hi you") (Val 3)) (Add (Var "5 you") (Val 3))
-}


instance Monad Expr where
-- (>>=) :: Expr a -> (a -> Expr b) -> Expr b
-- P3. [10 points] Give three definitions for (>>=) for Expr
   (>>=) (Var x) g = g x 
   (>>=) (Val x) _ = Val x
   (>>=) (Add (x) (y)) g = Add (x >>= g) (y >>= g)

-- P4. [7 points] Using the Expr object e1x and the first definition
-- of function g (see below), explain what the (>>=) operator for
-- the Expr type does when you do 
-- > e1x >>= g
-- in GHCi. Be as specific as possible!
{- Write your answer here.
	The (>>=) operator for the Expr type looks for which definition matches the object type of e1x and applies that definition with the function g,
	which looks like this: e1x >>= g. Because e1x = Add (Val 1) (Var 'x'), it will apply the third definition of (>>=). This results in 
	Add (x >>= g) (y >>= g). x = Val 1, so it will use the second definition of (>>=), returning Val 1. y =2
	 Var 'x', so the first definition of
	(>>=) is used, returning g 'x'. Using the definitions of the function g below, g 'x' returns Val 2. Therefore, Add (Val 1) (Val 2) is the 
	result of e1x >>= g.
-}

-- Expr objects 
e1x = Add (Val 1) (Var 'x')
e2y = Add (Val 2) (Var 'y')
ez3 = Add (Var 'z') (Val 3) 
exyz = Add (Add (Var 'x') (Var 'y')) (Add (Var 'z') (Var 'y'))

-- Function g definitions
g 'x' = Val 2   -- definition 1
g 'y' = Val 3
g 'z' = Val 4

-- A simplest eval function for tests below
eval :: Expr a -> Int
eval (Val n) = n
eval (Add a b) = eval a + eval b

-- (TestCase assertEqual "e bind g" (e >>= g) e_g)
myTestList = 
  TestList [
     "test 1" ~: eval (e1x >>= g)  ~?= 3
    ,"test 2" ~: eval (e2y >>= g)  ~?= 5
    ,"test 3" ~: eval (ez3 >>= g)  ~?= 7
    ,"test 4" ~: eval (exyz >>= g) ~?= 12
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

