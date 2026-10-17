#let gate-svg(name, inputs: 2, width: 5cm) = {
  let ys = if inputs == 1 { (50,) } else { (30, 70) }

  // label with a subscript number, e.g. I_1
  let lbl(x, y, letter, n) = (
    "<text x='"
      + str(x)
      + "' y='"
      + str(y)
      + "' font-family='sans-serif' "
      + "font-size='13' text-anchor='middle' fill='black'>"
      + letter
      + "<tspan dy='4' font-size='9'>"
      + str(n)
      + "</tspan></text>"
  )

  let input-lines = ys
    .enumerate()
    .map(((i, y)) => (
      "<line x1='0' y1='"
        + str(y)
        + "' x2='40' y2='"
        + str(y)
        + "' stroke='black' stroke-width='2'/>"
        + lbl(18, y - 5, "I", i + 1)
    ))
    .join()

  let svg = (
    "<svg xmlns='http://www.w3.org/2000/svg' width='200' height='100' viewBox='0 0 200 100'>"
      + "<rect x='40' y='10' width='120' height='80' fill='white' stroke='black' stroke-width='2'/>"
      + "<text x='100' y='50' font-family='sans-serif' font-size='24' font-weight='bold' "
      + "text-anchor='middle' dominant-baseline='central' fill='black'>"
      + name
      + "</text>"
      + input-lines
      + "<line x1='160' y1='50' x2='200' y2='50' stroke='black' stroke-width='2'/>"
      + lbl(182, 45, "O", 1)
      + "</svg>"
  )

  image(bytes(svg), format: "svg", width: width)
}
\
\
\
\

== Logic gates

=== Introduction

A logic gate is a device that performs a boolean function (logical operation). It is the smallest unit of computation in a #ref(<CPU>, supplement: "CPU").

In this section, we will think of each logic gate as a device that has one or two inputs (NOT has one, all the others have two) and one output.

The primitive logic gates are: NOT, AND, OR.

From these we can build the derived gates: NAND, NOR, XOR. NAND and NOR are also called _universal_ gates, because any other gate can be built using only NAND gates (or only NOR gates).

#let truth-table(headers, rows) = align(center)[
  #table(
    columns: range(headers.len()).map(_ => 1fr),
    align: center,
    inset: 3pt,
    ..headers.map(h => text(black, weight: "bold", h)),
    ..rows.flatten().map(v => [$#v$]),
  )
]


=== NOT

#grid(
  columns: 2,
  grid.cell()[
    A NOT gate can be represented by the following table:

    #truth-table(
      ($I_1$, $O_1$),
      ((0, 1), (1, 0)),
    )

    - The *NOT* gate outputs the complement of A, meaning 0 if A is 1, and 1 if A is 0.

    - We will denote the operation: $not A = O_1$
    - We can also denote the operation with a bar: $overline(A) = O_1$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "NOT")[#gate-svg("NOT", inputs: 1)] <NOT>]
  ],
)

=== AND

#grid(
  columns: 2,
  grid.cell()[
    An AND gate can be represented by the following table:

    #truth-table(
      ($I_1$, $I_2$, $O_1$),
      ((0, 0, 0), (0, 1, 0), (1, 0, 0), (1, 1, 1)),
    )

    - The *AND* gate outputs 0 for all pairs of (A, B), except when both *A* AND *B* are 1.

    - We will denote the operation: $A and B = O_1$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "AND")[#gate-svg("AND")] <AND>]
  ],
)

=== NAND

#grid(
  columns: 2,
  grid.cell()[
    A NAND gate can be represented by the following table:

    #truth-table(
      ($I_1$, $I_2$, $O_1$),
      ((0, 0, 1), (0, 1, 1), (1, 0, 1), (1, 1, 0)),
    )

    - The *NAND* gate outputs the opposite of what an AND gate would produce for a pair (A, B).

    - We will denote the operation: $not (A and B) = O_1$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "NAND")[#gate-svg("NAND")] <NAND>]
  ],
)

==== De Morgan's Law

$X = not(A and B) equiv not A or not B$

=== OR

#grid(
  columns: 2,
  grid.cell()[
    An OR gate can be represented by the following table:

    #truth-table(
      ($I_1$, $I_2$, $O_1$),
      ((0, 0, 0), (0, 1, 1), (1, 0, 1), (1, 1, 1)),
    )

    - The *OR* gate outputs 1 if *A* OR *B* (or both) is 1, and 0 only when both are 0.

    - We will denote the operation: $A or B = O_1$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "OR")[#gate-svg("OR")] <OR>]
  ],
)



=== NOR

#grid(
  columns: 2,
  grid.cell()[
    A NOR gate can be represented by the following table:

    #truth-table(
      ($I_1$, $I_2$, $O_1$),
      ((0, 0, 1), (0, 1, 0), (1, 0, 0), (1, 1, 0)),
    )

    - The *NOR* gate outputs the opposite of what an OR gate would produce for a pair (A, B), meaning it outputs 1 only when both *A* and *B* are 0.

    - We will denote the operation: $not (A or B) = O_1$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "NOR")[#gate-svg("NOR")] <NOR>]
  ],
)

==== De Morgan's Law

$X = not(A or B) equiv not A and not B$

=== XOR

#grid(
  columns: 2,
  grid.cell()[
    An XOR (exclusive OR) gate can be represented by the following table:

    #truth-table(
      ($I_1$, $I_2$, $O_1$),
      ((0, 0, 0), (0, 1, 1), (1, 0, 1), (1, 1, 0)),
    )

    - The *XOR* gate outputs 1 when *A* and *B* are different, and 0 when they are the same. Unlike OR, it outputs 0 when both inputs are 1.

    - We will denote the operation: $A xor B = O_1$
  ],
  grid.cell()[
    #pad(left: 2cm)[#figure(caption: "XOR")[#gate-svg("XOR")] <XOR>]
  ],
)

#figure(caption: "Image of a 4-bit Computer built with logic-gates")[
  #image("/assets/notes/4-bit-computer-circuit-diagram-scaled.jpg")]

#pagebreak()
