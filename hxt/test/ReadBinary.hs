module Main where

import Data.ByteString.Lazy.UTF8 (fromString)
import Data.Tree.NTree.TypeDefs
import Text.XML.HXT.Core
import qualified Text.XML.HXT.DOM.ShowXml
import Text.XML.HXT.DOM.TypeDefs

main :: IO ()
main = do
  let good = fromString "emăil"
      bad = Text.XML.HXT.DOM.ShowXml.xshowBlob [NTree (XText "emăil") []]
  if bad /= good
    then error $ "ByteStrings don't match: " ++ show good ++ " /= " ++ show bad
    else pure ()
