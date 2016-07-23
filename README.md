# Example

An example of where I find it useful:

    process :: String -> Q Exp
    process = id
      .> splitOnCommas
      .> map nameAndValue
      .> joinAsColumns
      .> wrapInParens
      .> parseHsStrToQQExp
      .> return

(source: https://github.com/Wizek/dump/blob/48443d5/src/Debug/Dump.hs#L77)
