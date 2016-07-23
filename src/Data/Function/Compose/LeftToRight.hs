module Data.Function.Compose.LeftToRight (($>), (.>), (<$), (<.)) where

import Prelude hiding ((<$))

(.>) = flip (.)
infixl 9 .>
{-# INLINE (.>) #-}

($>) = flip ($)
infixl 0 $>
{-# INLINE ($>) #-}


(<$) = ($)
infixr 1 <$
{-# INLINE (<$) #-}

(<.) = (.)
infixr 9 <.
{-# INLINE (<.) #-}
