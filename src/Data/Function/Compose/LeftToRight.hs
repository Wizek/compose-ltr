module Data.Function.Compose.LeftToRight (($>), (.>), (<$), (<.)) where

(.>) = flip (.)
infixl 9 .>

($>) = flip ($)
infixl 0 $>

(<$) = ($)
infixr 1 <$

(<.) = (.)
infixr 9 <.
