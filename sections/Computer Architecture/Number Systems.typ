#import "../../templates.typ": *

== Number Systems

=== Base-10 <Base-10>

- Base-10 is the number system we humans use.

- It's made up of 10 digits, digits from (0 to 9): 0, 1, 2, 3, 4, 5, 6, 7, 8, 9.

- Any other number is made up from these the 10 digits.

=== Base-2 <Base-2>

- Base-2 is the number system is computers use.

- It's made up of two digits: `0` and `1`.

- Any other number is made up from these the `2` digits.

=== Relationship between base-2 and base-10

Numbers can be converted to-and-back from base-2 to base-10.

==== Converting from Base-10 to Base-2

#grid(
  columns: 2,
  grid.cell()[

    #block(
      fill: block_bg_color,
      inset: 12pt,
      radius: 4pt,
      width: 100%,
    )[
      #text(fill: primary_color, weight: "bold")[Example: Convert $(75)_(10)$ to binary]

      #v(0.5em)

      #text(fill: dark_color)[
        *Step 1:* Make a table.

        *Step 2:* Divide `75` by `2` repeatedly.

        *Step 3:* If the number is a decimal, take everything before the decimal and assign it the bit `1`; if the number is a whole number, write the number as is and assign it the bit `0`.

        *Step 4:* Construct the number by reading the bits from bottom to top.
      ]
    ]

    #v(1em)
  ],
  grid.cell()[
    #figure(
      caption: "Table for converting 75 to base-2.",
    )[
      #table(
        columns: 3,
        [number], [index], [bit],
        [37], [0], [1],
        [18], [1], [1],
        [9], [2], [0],
        [4], [3], [1],
        [2], [4], [0],
        [1], [5], [0],
        [$1/2$], [6], [1],
      )
    ] <Table-75>
  ],
)

==== Converting from Base-2 to Base-10

#grid(
  columns: 2,
  grid.cell()[
    We will take the same example as above and in #ref(<Table-75>), and we will use the indexes to remake the base-10 number.

    we had  $(75)_10 = (1001011)_2$

    We need to only consider the "1"s and their indexes as shown in #ref(<The-1s-and-their-indexes>)

    $(1001011)_2 = (2^0 + 2^1 + 2^3 + 2^6)_10 = (75)_10$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "The 1's and their indexes.")[
        #image("../../images/75-number-systems.png")] <The-1s-and-their-indexes>
    ]],
)

