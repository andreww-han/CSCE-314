
-- CSCE 314 [Section 500] Programming Languages Spring 2020
-- Homework Assignment 2

-- Problem 1 (5 points)
-- This is head comment (single line comment should be preceded by two dashes)
-- Student Name: Andrew Han
-- UIN: 227009495
-- (ACKNOWLEDGE ANY HELP RECEIVED HERE)


module Main where

import Prelude hiding ((&&))

import Test.HUnit
import System.Exit
import Data.Char


-- Problem 2 (5 points) Chapter 4, Exercise 5
(&&) :: Bool -> Bool -> Bool
(&&) a b = if a == False then False
            else if b == False then False
             else True


-- Problem 3 (10+10 = 20 points) Chapter 4, Exercise 8
luhnDouble :: Int -> Int  -- 10 points
luhnDouble x = if x >= 5 then ((2*x)-9)
                else 2*x

luhn :: Int -> Int -> Int -> Int -> Bool  -- 10 points
luhn w x y z = if (sum a `mod` 10) == 0 then True
                else False
                where a = [luhnDouble w, x, luhnDouble y, z]


-- Problem 4 (10 points) Chapter 5, Exercise 6
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum(init (factors x)) == x]



-- Problem 5 (7+7+6 = 20 points) Chapter 6, Exercise 5
{- Write your answer in this block comment neatly and clearly.

1. length [1,2,3]
= 		{applying length}
	1 + length [2,3]
=		{applying length}
	1 + 1 + length[3]
=		{applying length}
	1 + 1 + 1 + length[]
=		{applying length}
	1 + 1 + 1 + 0
=		{applying +}
	3
2. drop 3 [1,2,3,4,5]
=		{applying drop}
	drop 2 [2,3,4,5]
=		{applying drop}
	drop 1 [3,4,5]
=		{applying drop}
	drop 0 [4,5]
=		{applying drop}
	[4,5]
3. init [1,2,3]
=		{applying init}
	1 : init [2,3]
=		{applying init}
	1 : 2 : init [3]
=		{applying init}
	1 : 2 : []
=		{applying :}
	[1,2]

-}



-- Problem 6 (8+7=15 points)
halve :: [a] -> ([a], [a])
halve [] = ([],[])
halve x = if length x == 1 then (x,[])
            else splitAt (length x `div` 2) x

mergeBy :: (a -> a -> Bool) -> [a] -> [a] -> [a]  -- 8 points
mergeBy (_) xs [] = xs
mergeBy (_) [] ys = ys
mergeBy (a) (x:xs) (y:ys) = if x `a` y then x: mergeBy (a) xs (y:ys)
                        else y: mergeBy (a) (x:xs) ys

msortBy :: (a -> a -> Bool) -> [a] -> [a]  -- 7 points
msortBy (_) [] = []
msortBy (a) x = if length x == 1 then mergeBy (a) x []
                 else mergeBy (a) firsthalf secondhalf
                 where 
                  firsthalf = msortBy (a) (fst (halve x))
                  secondhalf = msortBy (a) (snd (halve x))


-- Problem 7 (10+5 = 15 points) Chapter 7, Exercise 9
altMap :: (a -> b) -> (a -> b) -> [a] -> [b]  -- 10 points
altMap (_) (_) [] = []
altMap (a) (b) (x:xs) = a x : altMap (b) (a) xs

{- (5 points)
   Explain how your altMap works when it is applied as below.
   > altMap (*2) (`div` 2) [0..6]
=		{applying altMap}
	(0*2) : altMap (*2) (`div` 2) [1..6]
=		{applying altMap}
	(0*2) : (1 `div` 2) : altMap (*2) (`div` 2) [2..6]
=		{applying altMap}
	(0*2) : (1 `div` 2) : (2*2) : altMap (*2) (`div` 2) [3..6]
=		{applying altMap}
	(0*2) : (1 `div` 2) : (2*2) : (3 `div` 2) : altMap (*2) (`div` 2) [4..6]
=		{applying altMap}
	(0*2) : (1 `div` 2) : (2*2) : (3 `div` 2) : (4*2) : altMap (*2) (`div` 2) [5,6]
=		{applying altMap}
	(0*2) : (1 `div` 2) : (2*2) : (3 `div` 2) : (4*2) : (5 `div` 2) : altMap (*2) (`div` 2) [6]
=		{applying altMap}
	(0*2) : (1 `div` 2) : (2*2) : (3 `div` 2) : (4*2) : (5 `div` 2) : (6*2) : altMap (*2) (`div` 2) []
=		{applying altMap}
	(0*2) : (1 `div` 2) : (2*2) : (3 `div` 2) : (4*2) : (5 `div` 2) : (6*2) : []
=		{applying (*) and (div)}
	0 : 0 : 4 : 1 : 8 : 2 : 12 : []
=		{applying :}
	[0,0,4,1,8,2,12]

-}


-- Problem 8 (10 points)
concatenateAndUpcaseOddLengthStrings :: [String] -> String
concatenateAndUpcaseOddLengthStrings (x) = concat ((map.map) toUpper (filter a x))
                                            where a x = odd(length x)



myTestList = 
  TestList [
  
      "&& 1" ~: (&&) True True ~=? True
    , "&& 2" ~: (&&) True False ~=? False    
    , "&& 3" ~: (&&) False True ~=? False
    , "&& 4" ~: (&&) False False ~=? False
    
    , "luhnDouble 1" ~: luhnDouble 3 ~=? 6
    , "luhnDouble 2" ~: luhnDouble 6 ~=? 3
    , "luhnDouble 3" ~: luhnDouble 5 ~=? 1

    , "luhn 1" ~: luhn 1 7 8 4 ~=? True
    , "luhn 2" ~: luhn 4 7 8 3 ~=? False
    
    , "perfects 1" ~: perfects 500 ~=? [6,28,496]

    , "mergeBy 1" ~: mergeBy (>) "FED" "GBA" ~=? "GFEDBA"
    , "mergeBy 2" ~: mergeBy (<) "Howdy" "Maui" ~=? "HMaouiwdy"
      
    , "msortBy 1" ~: msortBy (<) "gig 'em" ~=? " 'eggim" 
    , "msortBy 2" ~: msortBy (>) "Jack be nimble" ~=? "nmlkieecbbaJ  "
    , "msortBy 3" ~: msortBy (<) "" ~=? ""

    , "altMap 1" ~: altMap (* 10) (* 100) [1,2,3,4,5] ~=? [10,200,30,400,50]
    , "altMap 2" ~: and (altMap even odd [1..10]) ~=? False
    , "altMap 3" ~: altMap toLower toUpper "Haskell IS fun!" ~=? "hAsKeLl iS FuN!"

    , "concatenateAndUpcaseOddLengthStrings" ~:
         concatenateAndUpcaseOddLengthStrings ["here's ", "an ", "a ", "example"] ~=? "HERE'S AN EXAMPLE" 

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

