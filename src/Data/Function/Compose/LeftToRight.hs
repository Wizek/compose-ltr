module Data.Function.Compose.LeftToRight (($>), (.>), (<$), (<.)) where

(.>) = flip (.)
infixl 9 .>

($>) = flip ($)
infixl 0 $>

(<$) = ($)
infixl 1 <$

(<.) = (.)
infixl 9 <.
