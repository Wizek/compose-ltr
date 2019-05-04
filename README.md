# compose-ltr

_More intuitive, left-to-right function composition_

[![Written in Haskell](https://img.shields.io/badge/language-Haskell-blue.svg)](https://haskell.org/)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-teal.svg)](https://choosealicense.com/licenses/mit/)
[![Hackage](https://img.shields.io/hackage/v/compose-ltr.svg)](https://hackage.haskell.org/package/compose-ltr)

compose-ltr introduces alternatives to `$` and `.` that compose left-to-right.

## Example

Imagine you see the following snippet of code. How quickly and easily can you
understand what it does?

```haskell
mapM_ print $ reverse $ filter (\x -> x `mod` 2 == 0) $ [1..10]
```

While the function calls are indeed flowing left to right, the data's source
is actually on the right (`[1..10]`) and the subsequent modifications flow
right to left. One has to keep a list of modifications in one's head to
understand the code. Alternatively, one could try to read the code right to
left.

In many cases, focusing on the _data_ rather than the _execution_ can lead to
far more intuitive code. Here's the same snippet written using `$>` from
compose-ltr:

```haskell
[1..10] $> filter (\x -> x `mod` 2 == 0) $> reverse $> mapM_ print
```

## How To Use

From the comparison example above, notice that all the steps are written in
reverse order (to execution). Any code that uses `$` and `.` can be reversed:

```haskell
a $ b
c . d
```

Becomes (adoptiong LTR direction):

```haskell
b $> a
d .> c
```

Should you wish to keep using `$` and `.`, compose-ltr also provides
directional equivalents for them too:

```haskell
a $ b
c . d
```

Becomes (retaining RTL direction):

```haskell
a <$ b
c <. d
```

## Real World Example

```haskell
process :: String -> Q Exp
process = id
  .> splitOnCommas
  .> map nameAndValue
  .> joinAsColumns
  .> wrapInParens
  .> parseHsStrToQQExp
  .> return
```

(source: https://github.com/Wizek/dump/blob/48443d5/src/Debug/Dump.hs#L77)
