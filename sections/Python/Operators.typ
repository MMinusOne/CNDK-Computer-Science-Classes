#import "../../templates.typ": *

== Operators

=== Arithmetic operators

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary_color,
  inset: 8pt,

  [#text(fill: white, weight: "bold")[Operator]],
  [#text(fill: white, weight: "bold")[Name]],
  [#text(fill: white, weight: "bold")[Example]],

  [#text(size: 14pt, weight: "bold")[`+`]], [Addition], [`10 + 5 = 15`],
  [#text(size: 14pt, weight: "bold")[`-`]], [Subtraction], [`10 - 5 = 5`],
  [#text(size: 14pt, weight: "bold")[`*`]], [Multiplication], [`10 * 5 = 50`],
  [#text(size: 14pt, weight: "bold")[`/`]], [Division], [`10 / 5 = 2.0`],
  [#text(size: 14pt, weight: "bold")[`**`]], [Exponentiation], [`3 ** 4 = 3 * 3 * 3 * 3 = 81`],
)

#v(0.5em)

#block(
  fill: block_bg_color,
  inset: 10pt,
  radius: 4pt,
)[
  #text(fill: dark_color)[
    *Important:* Division always returns a float: `int / int → float`
  ]
]

#v(1em)


=== Comparison operators

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary_color,
  inset: 8pt,

  [#text(fill: white, weight: "bold")[Operator]],
  [#text(fill: white, weight: "bold")[Name]],
  [#text(fill: white, weight: "bold")[Result]],

  [#text(size: 14pt, weight: "bold")[`==`]], [Equality], [`10 == 10` → `True`],
  [#text(size: 14pt, weight: "bold")[`!=`]], [Inequality], [`10 != 5` → `True`],
  [#text(size: 14pt, weight: "bold")[`>`]], [Greater than], [`10 > 5` → `True`],
  [#text(size: 14pt, weight: "bold")[`<`]], [Less than], [`10 < 5` → `False`],
  [#text(size: 14pt, weight: "bold")[`>=`]], [Greater or equal], [`10 >= 10` → `True`],
  [#text(size: 14pt, weight: "bold")[`<=`]], [Less or equal], [`5 <= 10` → `True`],
)


#v(1em)

=== Logical Operators
#let truthTableCase = (p: bool, q: bool) => {
  return (
    (
      if p { "True" } else { "False" },
      if q { "True" } else { "False" },
      if p and q { "True" } else { "False" },
      if p or q { "True" } else { "False" },
      if p { "False" } else { "True" },
      if q { "False" } else { "True" },
    ),
  )
}

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: (center, center, center, center),
  inset: 12pt,
  fill: (x, y) => tableStripes(x, y),

  [#text(white, weight: "bold")[$p$]],
  [#text(white, weight: "bold")[$q$]],
  [#text(white, weight: "bold")[
    Conjunction \
    $p$ and $q$ \
    $p and q$
  ]],
  [#text(white, weight: "bold")[
    Disjunction \
    $p$ or $q$ \
    $p or q$
  ]],
  [#text(white, weight: "bold")[
    Negation \
    not $p$ \
    $not p$
  ]],
  [#text(white, weight: "bold")[
    Negation \
    not $q$ \
    $not q$
  ]],

  ..truthTableCase(p: true, q: true).flatten(),
  ..truthTableCase(p: true, q: false).flatten(),
  ..truthTableCase(p: false, q: true).flatten(),
  ..truthTableCase(p: false, q: false).flatten(),
)

#v(1em)

=== Bitshift operators

- 9 .) Left-bitshift (`<<`): `x << n`, where `x` and `n` are `int`s, will shift the bits of `x` by `n` zeroes and return the base-10 `int`.

Example:

#block(
  fill: block_bg_color,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  - `5 << 2`:
  - We convert 5 to base-2: $(5)_10 = (101)_2$.
  - And left shift by 2: `(10100)` (We added two zeroes.)
  - Now if we convert back to base-10, the number becomes: $2^2 + 2^4 = 20$.
]
- 10 .) Right-bitshift (`>>`): The inverse of left-bitshift.

#grid(
  columns: 2,
  grid.cell()[
    Example:
    - `5 >> 2`
    - If we convert 5 to base-2: $(5)_10 = (101)_2$.
    - And right shift by 2: `(001)`, (The `01` that was there moved to somewhere that doesn't exist.)
    - Now we convert back to base-10, the number becomes: $2^0 = 1$.
  ],
  grid.cell()[
    #figure(caption: "Right bitshift")[#image("../../images/right-bitshift.png")]
  ],
)

=== Operation + Assignment By Examples


All the arithmetic, and bitshift operators have an assignment equivelant used to modify variables.


#code-block(
  ```python

  # We will declare these variables for example purposes
  first_number = 10
  second_number = 5
  first_string = "John"
  second_string = "Johhny"

  first_string += " Jason" # first_string will be "John Jason" after that, because "John" + " Jason" = "John Jason".
  second_number -= 6 # second_number will be -1 after that, because 5 - 6 = -1.
  second_number *= -2 # second_number will be 2 after that, because (-1)(-2) = 2.
  first_number /= 5 # first_number will be 2.0 after that, because 10 / 5 = 2.0.
  first_number = 5 # first_number will be 5 after that, normal assignment.
  first_number <<= 2 # first_number will be 20 after that, because 5 << 2 = 20
  first_number >>= 3 # first_number will be 2 after that, because 20 >> 3 is 2.
  ```.text,
  lang: "python",
)

