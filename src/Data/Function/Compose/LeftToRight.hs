module Data.Function.Compose.LeftToRight where

import qualified Prelude as P

(.>) = P.flip (P..)
infixl 9 .>

($>) = P.flip (P.$)
infixl 1 $>
