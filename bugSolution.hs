{-# LANGUAGE FlexibleInstances #-}

module Main where

main :: IO ()
main = do
  print (return 1 :: [Int])
  print (return 1 :: Maybe Int)
  print (return 1 :: IO Int)
  print $ (return 1 :: [Int]) >>= (\x -> return (x + 1))
  print $ (return 1 :: Maybe Int) >>= (\x -> return (x + 1))
  print $ (return 1 :: IO Int) >>= (\x -> return (x + 1))