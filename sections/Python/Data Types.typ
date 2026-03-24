#import "../../templates.typ": *

== Data Types

#table(
  columns: (auto, 1fr),
  align: (left, left),
  fill: (x, y) => tableStripes(x, y, heading_color: secondary_color),
  stroke: 1pt + secondary_color,
  inset: 10pt,

  [#text(fill: white, weight: "bold")[Type]], [#text(fill: white, weight: "bold")[Description & Examples]],

  [#raw("int", lang: "python")], [Integer - a whole number. Examples: `10`, `25`, `300`, `-5`],

  [#raw("float", lang: "python")], [Decimal number. Examples: `52.6`, `19.3`, `1.0`, `5.0`],

  [#raw("bool", lang: "python")], [Boolean - either `True` or `False`],

  [#raw("str", lang: "python")], [String - sequence of characters. Examples: `"Hello"`, `"Text"`, `""`],

  [#raw("list", lang: "python")],
  [Sequence of elements. Example: `[10, 5.2, 9.8]`
    \ Lists are heterogeneous and 0-indexed
    \ List indexing is non-commutative
  ],

  [#raw("dict", lang: "python")],
  [Dictionary - key-value store. Example: `{"name": "John", "age": 30}`
    \ Access: `person["name"]` → `"John"`],

  [#raw("None", lang: "python")], [Represents a null value],
)

#v(1em)
