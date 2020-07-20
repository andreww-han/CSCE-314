
-- CSCE 314 [Section 500] Programming Languages Spring 2020
-- Homework Assignment 1

-- Problem 1 (5 points)
-- This is head comment (single line comment should be preceded by two dashes)
-- Student Name: Andrew Han
-- UIN: 227009495 
-- (ACKNOWLEDGE ANY HELP RECEIVED HERE)
{-
https://en.wikibooks.org/wiki/Haskell/Lists_and_tuples - "Retrieving Values" section
-}

module Main where

import Test.HUnit
import System.Exit


-- Example:
-- Write a recursive function mySum that sums all the numbers
-- in a list without using the prelude function sum.
mySum :: [Int] -> Int  -- type signature of mySum. mySum accepts a list of Ints
                       -- as its argument and returns an Int
mySum []     = 0  -- def 1
mySum (x:xs) = x + mySum xs -- def 2

{- Block comment over multiple lines is enclosed within {- and -}
Explanation:
The type of mySum tells us that mySum takes a list of Ints as an argument
and returns an Int that is the sum of all the Ints in the argument list.

The def 1 of mySum is the base case of the recursion, that is,
the argument list is empty, for which case the function value is 
defined as zero (summation identity).

The def 2 is when the argument list contains at least one element, 
namely x, in which case the function is defined as the sum of x 
and the result of the recursive call of mySum applied to the rest of 
the argument list, namely xs.
-}


-- Problem 2 (10 points)
lucas :: Int -> Int
lucas 0 = 2
lucas 1 = 1
lucas x = lucas (x-1) + lucas (x-2)



-- Problem 3 (5+10 = 15 points)
qsort1 :: Ord a => [a] -> [a]
---- Question 3.1 (5 points)
qsort1 [] = []
qsort1 (x:xs) = qsort1 ys ++ [x] ++ qsort1 zs
                where
                    ys = [a | a <- xs, a >= x]
                    zs = [b | b <- xs, b < x]

---- Question 3.2 (10 points) FIX THIS - SHOULD BE 10 CALLS
{- Write your answer for Question 3.2 within this block comment.
When qsort1 is invoked with the input [3,2,3,1,4], qsort1 will be called 
recursively 10 times after the intial call. To begin, [3] will be used as the pivot 
and the left branch will contain [3,4] because they are larger/equal and the right
branch will be [2,1] because they are smaller than 3. Focusing on the left branch 
first, qsort[3,4] (1) will be called making [3] the pivot with [4] on the left and []
on the right. qsort1 [4] (2) will return [4] with [] on both sides. qsort1 [] will be called for
each, resulting in [] (3,4). The remaining empty set on the left branch will call qsort1 [] as well (5).
Concatenating the left branch with the original pivot gives us [4,3,3].
We then look at the right branch and call qsort1 [2,1] (6). 
[2] will become the pivot with [] as the left branch and [1] as the right branch. 
Calling qsort1 [] (7) yields [] and qsort1 [1] (8) yields [1] with [] on the left and the right. 
Both will call qsort1 [] resulting in [] (9,10). Concatenating this with the original list gives us [4,3,3,2,1], which is the end result.
-}


-- Problem 4 (Chapter 5, Exercise 9) (10+10=20 points)
scalarproduct :: [Int] -> [Int] -> Int
---- Question 4.1 (10 points)
scalarproduct x y = sum [x * y | (x,y) <- zip x y]

---- Question 4.2 (10 points)
{- Write your answer for Question 4.2 within this block comment.
When scalarproduct [1,2,3] [4..] is invoked, the program will zip the two lists and produce
[(1,4),(2,5),(3,6)] (Note: although the second list keeps on going, the zip function cannot 
add anymore after the first list is exhausted). Then, the function will start pulling tuples 
from this list to satisfy the (x,y) component and add x * y to another list. Once all 3 tuples 
have been iterated through, the sum function will add up the elements in the list consisting of
the products of the tuples. This will yield the result 32. 
-}

-- Problem 5 (Chapter 6, Exercise 7) (10 points)
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x < y then x: merge xs (y:ys)
                        else y: merge (x:xs) ys

{- Because the two lists are already sorted, the first elements are compared and then merge is called 
again with the remaining elements.
-}

-- Problem 6 (Chapter 6, Exercise 8) (8+7=15 points)
halve :: [a] -> ([a], [a])  -- 7 points
halve [] = ([],[])
halve x = if length x == 1 then (x,[])
            else splitAt (length x `div` 2) x 


msort :: Ord a => [a] -> [a]  -- 8 points
msort [] = []
msort x = if length x == 1 then merge x []
            else merge firsthalf secondhalf
            where 
              firsthalf = msort (fst (halve x))
              secondhalf = msort (snd (halve x))


-- Problem 7 (10 points)
isElem :: Eq a => a -> [a] -> Bool
isElem x [] = False
isElem x (y:ys) = if x == y then True
                    else isElem x ys


type Set a = [a]

-- Problem 8 (15 points)
toSet :: Eq a => [a] -> Set a
toSet [] = []
toSet (x:[]) = [x]
toSet (x:xs) = if isElem x xs then toSet(xs) 
                else x:toSet(xs)


myTestList = 
  TestList [

      "lucas 1" ~: lucas 0 ~=? 2
    , "lucas 2" ~: lucas 1 ~=? 1    
    , "lucas 3" ~: lucas 4 ~=? 7
    
    , "qsort1 1" ~: qsort1 [3, 2, 5, 1, 6] ~=? [6,5,3,2,1]
    , "qsort1 2" ~: qsort1 "howdy" ~=? "ywohd"
    
    , "scalarproduct 1" ~: scalarproduct [4,5,6] [1,2,3] ~=? 32
    , "scalarproduct 2" ~: scalarproduct [2,3] [1,-1] ~=? -1
    , "scalarproduct 3" ~: scalarproduct [1..10] [1..5] ~=? 55

    , "merge 1" ~: merge "EGG" "ABCDEFGH" ~=? "ABCDEEFGGGH" 
    , "merge 2" ~: merge "Hello" "e" ~=? "Heello"

    , "halve 1" ~: halve "" ~=? ("","")
    , "halve 2" ~: halve "halves" ~=? ("hal","ves")
    , "halve 21" ~: halve "halve" ~=? ("ha","lve")

    , "msort 1" ~: msort "Howdy all!" ~=? " !Hadllowy"
    , "msort 2" ~: msort "" ~=? ""
    , "msort 3" ~: msort "Mississippi" ~=? "Miiiippssss"

    , "isElem 1" ~: (isElem 'h' "happy") ~=? True
    , "isElem 2" ~: (isElem 'o' "happy") ~=? False

    , "mkSet 1" ~: length (toSet "aardvark") ~=? 5
    , "mkSet 2" ~: length (toSet "Bart") ~=? 4

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

