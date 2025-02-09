{-# LANGUAGE FlexibleInstances #-}

module Main where

class MyMonad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

instance MyMonad [] where
  return x = [x]
  xs >>= f = concatMap f xs

instance MyMonad Maybe where
  return x = Just x
  Nothing >>= f = Nothing
  Just x >>= f = f x

instance MyMonad IO where
  return = return
  (>>=) = (>>=)

main :: IO ()
main = do
  print (return 1 :: [Int])
  print (return 1 :: Maybe Int)
  print (return 1 :: IO Int)
  print ((return 1 :: [Int]) >>= (\x -> return (x + 1)))
  print ((return 1 :: Maybe Int) >>= (\x -> return (x + 1)))
  print ((return 1 :: IO Int) >>= (\x -> return (x + 1)))