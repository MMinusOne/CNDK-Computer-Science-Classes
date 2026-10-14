// ---------- page setup ----------
#set page(paper: "a4", margin: (x: 1.5cm, y: 1.5cm))
#set text(size: 10pt)

// ---------- toggle this to print the solutions ----------
#let show-answers = true

// ---------- gate functions (1 = true, 0 = false) ----------
#let NOT(a) = 1 - a
#let AND(a, b) = if a == 1 and b == 1 { 1 } else { 0 }
#let OR(a, b) = if a == 1 or b == 1 { 1 } else { 0 }
#let XOR(a, b) = if a != b { 1 } else { 0 }

// ---------- drawing helpers ----------
#let s(v) = str(v)
#let ln(x1, y1, x2, y2) = (
  "<line x1='"
    + s(x1)
    + "' y1='"
    + s(y1)
    + "' x2='"
    + s(x2)
    + "' y2='"
    + s(y2)
    + "' stroke='black' stroke-width='2' stroke-linecap='round'/>"
)
#let route(pts) = (
  "<polyline points='"
    + pts.map(p => s(p.at(0)) + "," + s(p.at(1))).join(" ")
    + "' fill='none' stroke='black' stroke-width='2' stroke-linejoin='round'/>"
)
#let dot(x, y) = "<circle cx='" + s(x) + "' cy='" + s(y) + "' r='4' fill='black'/>"
#let lbl(x, y, letter, n) = (
  "<text x='"
    + s(x)
    + "' y='"
    + s(y)
    + "' font-family='sans-serif' font-size='16' "
    + "text-anchor='middle' fill='black'>"
    + letter
    + "<tspan dy='4' font-size='10'>"
    + s(n)
    + "</tspan></text>"
)
#let box(x, y, name) = (
  "<rect x='"
    + s(x)
    + "' y='"
    + s(y)
    + "' width='80' height='60' rx='6' fill='white' "
    + "stroke='black' stroke-width='2'/>"
    + "<text x='"
    + s(x + 40)
    + "' y='"
    + s(y + 30)
    + "' font-family='sans-serif' "
    + "font-size='19' font-weight='bold' text-anchor='middle' "
    + "dominant-baseline='central' fill='black'>"
    + name
    + "</text>"
)
// same scale for every diagram, so gates have the same size everywhere
#let diagram(parts, w, h) = image(
  bytes(
    "<svg xmlns='http://www.w3.org/2000/svg' width='"
      + s(w)
      + "' height='"
      + s(h)
      + "' viewBox='-35 0 "
      + s(w)
      + " "
      + s(h)
      + "'>"
      + parts.join()
      + "</svg>",
  ),
  format: "svg",
  width: w * 0.0185cm,
)

// ---------- all input combinations, in standard order ----------
#let all-cases(n) = range(calc.pow(2, n)).map(k => range(n)
  .rev()
  .map(
    b => calc.rem(calc.quo(k, calc.pow(2, b)), 2),
  ))

// ---------- answer table ----------
#let io-table(n-in, n-out, f) = table(
  columns: range(n-in + n-out).map(_ => 1fr),
  align: center + horizon,
  inset: 4pt,
  stroke: 0.5pt + luma(170),
  fill: (x, y) => if y == 0 {
    if x < n-in { luma(230) } else { luma(200) }
  } else if x >= n-in { luma(245) },
  ..range(n-in).map(k => strong($I_#(k + 1)$)),
  ..range(n-out).map(k => strong($O_#(k + 1)$)),
  ..all-cases(n-in)
    .map(c => {
      let o = f(..c)
      (..c.map(v => [#v]), ..o.map(v => if show-answers [#v] else []))
    })
    .flatten(),
)

// ---------- one exercise card ----------
#let ex(n, d, t) = block(
  stroke: 0.6pt + luma(200),
  radius: 6pt,
  inset: 9pt,
  width: 100%,
  breakable: false,
)[
  #text(weight: "bold", fill: black)[Exercise #n]
  #v(2pt)
  #align(center, d)
  #v(4pt)
  #t
]

// =====================================================
#align(center)[
  #text(size: 18pt, weight: "bold")[Logic Gate Exercises]
  #v(-2pt)
  #text(fill: luma(100))[
    $I$ = input, $O$ = output, $W$ = internal wire. Fill in the shaded cells
    for every combination of inputs.
  ]
]

#v(6pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,

  // ---- Exercise 1: one gate ----
  ex(
    1,
    diagram(
      (
        box(100, 20, "XOR"),
        ln(0, 35, 100, 35),
        ln(0, 65, 100, 65),
        ln(180, 50, 300, 50),
        lbl(-18, 40, "I", 1),
        lbl(-18, 70, "I", 2),
        lbl(322, 55, "O", 1),
      ),
      370,
      100,
    ),
    io-table(2, 1, (i1, i2) => (XOR(i1, i2),)),
  ),

  // ---- Exercise 2: NOT, then AND ----
  ex(
    2,
    diagram(
      (
        box(70, 10, "NOT"),
        box(210, 40, "AND"),
        ln(0, 40, 70, 40),
        route(((150, 40), (180, 40), (180, 55), (210, 55))),
        ln(0, 85, 210, 85),
        ln(290, 70, 370, 70),
        lbl(-18, 45, "I", 1),
        lbl(-18, 90, "I", 2),
        lbl(165, 32, "W", 1),
        lbl(392, 75, "O", 1),
      ),
      440,
      100,
    ),
    io-table(2, 1, (i1, i2) => {
      let w1 = NOT(i1)
      (AND(w1, i2),)
    }),
  ),

  // ---- Exercise 3: AND, then OR ----
  ex(
    3,
    diagram(
      (
        box(70, 20, "AND"),
        box(210, 60, "OR"),
        ln(0, 35, 70, 35),
        ln(0, 65, 70, 65),
        route(((150, 50), (180, 50), (180, 75), (210, 75))),
        ln(0, 105, 210, 105),
        ln(290, 90, 370, 90),
        lbl(-18, 40, "I", 1),
        lbl(-18, 70, "I", 2),
        lbl(-18, 110, "I", 3),
        lbl(165, 42, "W", 1),
        lbl(392, 95, "O", 1),
      ),
      440,
      130,
    ),
    io-table(3, 1, (i1, i2, i3) => {
      let w1 = AND(i1, i2)
      (OR(w1, i3),)
    }),
  ),

  // ---- Exercise 4: two gates, two outputs, shared inputs ----
  ex(
    4,
    diagram(
      (
        box(120, 20, "AND"),
        box(120, 110, "XOR"),
        ln(0, 35, 120, 35),
        route(((30, 35), (30, 125), (120, 125))),
        ln(0, 65, 120, 65),
        route(((60, 65), (60, 155), (120, 155))),
        dot(30, 35),
        dot(60, 65),
        ln(200, 50, 300, 50),
        ln(200, 140, 300, 140),
        lbl(-18, 40, "I", 1),
        lbl(-18, 70, "I", 2),
        lbl(322, 55, "O", 1),
        lbl(322, 145, "O", 2),
      ),
      370,
      190,
    ),
    io-table(2, 2, (i1, i2) => (AND(i1, i2), XOR(i1, i2))),
  ),
)
#let bits(v) = $op("bits")(#v)$

== Solve Operations:

- $not (100100)_2$
- $(101011)_2 and (100100)_2$
- $(101011)_2 or (100100)_2$
- $(101011)_2 xor (100100)_2$

== Problem: When is $x or y = c$ solvable?

You are given an arbitrary integer $x in NN$, and an integer $c in NN$.
You can choose any $y in NN$. Let:
- $a = (a_1, a_2, a_3, dots, a_(S-1), a_S) quad "be the list of bits of" x$
- $b = (b_1, b_2, b_3, dots, b_(S-1), b_S) quad "be the list of bits of" c$
- $or$ denote bit-wise OR on any two numbers.
- All numbers have the same bit-length, and S be the bit-length.
- $a_i$ and $b_i$ denote the bit at the $i$-th position ($1 <= i <= S$)
- $a_i, b_i in {0,1}$

What conditions must be satisfied at $a_i$ and $b_i$ such that: $x or y = c$?
