-- |
-- License   : MIT
-- Maintainer: Nagy Milán <123.wizek@gmail.com>
--
-- compose-ltr introduces alternatives to @('$')@ and @('.')@ that compose
-- left-to-right.
--
-- Consider the following example:
--
-- @
-- mapM_ print $ reverse $ filter (\x -> x `mod` 2 == 0) $ [1..10]
-- @
--
-- The list @[1..10]@ is filtered, reversed, and printed. With this package,
-- that order can be written left-to-right which can be more intuitive:
--
-- @
-- [1..10] $> filter (\x -> x `mod` 2 == 0) $> reverse $> mapM_ print
-- @
module Data.Function.Compose.LeftToRight (
  -- * Left to Right
  ($>),
  (.>),
  -- * Right to Left Aliases
  (<$),
  (<.)
) where

import Prelude hiding ((<$))

-- | Left-to-right version of function composition @('.')@.
--
-- Instances of "@a . b@" can be changed to "@b . a@".
(.>) = flip (.)
infixl 9 .>
{-# INLINE (.>) #-}

-- | Left-to-right version of the application operator @('$')@.
--
-- Instances of "@a $ b@" can be changed to "@b $ a@".
($>) = flip ($)
infixl 0 $>
{-# INLINE ($>) #-}

-- | Alias of @('$')@, useful to indicate when right-to-left is being used.
(<$) = ($)
infixr 1 <$
{-# INLINE (<$) #-}

-- | Alias of @('.')@, useful to indicate when right-to-left is being used.
(<.) = (.)
infixr 9 <.
{-# INLINE (<.) #-}
