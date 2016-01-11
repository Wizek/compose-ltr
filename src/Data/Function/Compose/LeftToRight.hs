module Data.Function.Compose.LeftToRight (($>), (.>), (<$), (<.)) where

import Prelude hiding ((<$))

(.>) = flip (.)
infixl 9 .>

($>) = flip ($)
infixl 0 $>

(<$) = ($)
infixr 1 <$

(<.) = (.)
infixr 9 <.
