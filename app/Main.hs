module Main where

import Lib
import System.Console.ArgParser
import Control.Applicative
{-
data MyTest = MyTest Int Int

myTestParser :: ParserSpec MyTest
myTestParser = MyTest
  `parsedBy` reqPos "pos1" `Descr` "description for the first argument"
  `andBy` optPos 0 "pos2" `Descr` "description"

myTestInterface :: IO (CmdLnInterface MyTest)
myTestInterface =
  (`setAppDescr` "top description")
  <$> (`setAppEpilog` "bottom decription")
  <$> mkApp myTestParser

main :: IO ()
main = do
  interface <- myTestInterface
  runApp interface print -}


data MyTest = MyTest Int Int
  deriving (Show) -- we will print the values

myTestParser :: ParserSpec MyTest
myTestParser = MyTest
  `parsedBy` reqPos "pos1" `Descr` "description for the first argument"
  `andBy` optPos 0 "pos2" `Descr` "description for the second argument"

myTestInterface :: IO (CmdLnInterface MyTest)
myTestInterface =
  (`setAppDescr` "top description")
  <$> (`setAppEpilog` "bottom description")
  <$> mkApp myTestParser

main = do
  interface <- myTestInterface
  runApp interface print
