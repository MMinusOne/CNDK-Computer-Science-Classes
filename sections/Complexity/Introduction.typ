
#let primary_color = rgb("#1e40af")
#let secondary_color = rgb("#0284c7")
#let dark_color = rgb("#1F2937")
#let solution_color = rgb("#d97706")
#let light_color = rgb("#F3F4F6")
#let block_bg_color = rgb("#EFF6FF")

#let tableStripes = (x, y, heading_color: primary_color.opacify(-20%), color_one: light_color, color_two: white) => if (
  y == 0
) {
  heading_color
} else if calc.odd(y) {
  color_one
} else if calc.even(y) { color_two }

Complexity theory studies the relationship between an algorithm and the resource it takes.

== What is an algorithm?

A computer algorithm is a sequence of steps a computer will take to achieve a particular outcome.

=== Example: Sequential Search

Given a sorted array $A$ of length $n$, $(A_0 <= A_1 <= A_2 <= dots <=A_(n-1))$, and a number $K$, $K in A$ sequential search is an algorithm that will go through each index in the array one by one, starting with 0, and stops when it finds the element $K$ in the array and return it's position.

For example, if I have the array $A = [1,5,9,12,60,110,120,121,500, 505]$ and the number $K = 60$, sequential search will start checking in order:
- Is $A_0 = 60$? No, keep going.
- Is $A_1 = 60$? No, keep going.
$dots$
- Is $A_4 = 60$? Yes, return 4, the desired position.

- This algorithm has a time complexity of $O(n)$, where $n = "length of the array"$, we will explain why later, but intuitively, we can think it is $O(n)$ because if the number $K$ was at the end of the array(worst case scenario), it will take $n$ steps to find $K$



  #figure(caption: "Sequential Search Diagram")[
    #image("../../assets/notes/sequential-search-diagram.svg", height: 30em)
  ] <Sequential-Search-Diagram>


  #align(center)[#figure(caption: "Sequential Search Array")[
    #image("../../assets/notes/sequential-search-array.svg", width: 20em)
  ] <Sequential-Search-Array>]


=== Example: Binary Search

For binary search, we will consider the *sorted* $10$-length array $A = [-5, -2, 0, 1, 2, 4, 5, 6, 7, 10]$, and we will start with low = 0, and high = 9, at each point, we will then repeatedly take $"midpoint" = "low" + floor(("high" - "low") / 2)$, and call that point $M$, if $A_m > K$, then $K$ is positioned before position $m$ (the array is sorted), so we will take the left half, otherwise if $A_m < K$, then $K$ is positioned after the position $m$, so we will take the right half, and repeat.

- This algorithm has $O(log_2 n)$, but is written as simply $O(log n)$ because $2$ is a constant term we don't usually consider, this is because at each step in the algorithm, we cut the amount of work we have to do by half.

#figure(caption: "Binary Search Diagram")[
  #image("../../assets/notes/binary-search-diagram.svg", height: 30em)
] <Binary-Search-Diagram>

#align(center)[#figure(caption: "Binary Search Array")[
  #image("../../assets/notes/binary-search-array.svg", width: 30em)
] <Binary-Search-Array>]

== Time vs Space complexity?

- Time complexity describes how the execution time(number of steps) of an algorithm grows as the size of it's input grows.

- Space complexity describes how much more space an algorithm will take as the size of it's input grows.

In this course we will only be interested in time complexity.

=== Big-O complexity graph
#align(center)[#figure(caption: "Big-O Complexity Chart")[
  #image("../../assets/notes/complexity-graph.webp", width: 30em)
] <Binary-Search-Array>]

These are the standard time complexities we usually encounter, but we will only talk about $O(1)$, $O(n)$ and $O(n^2)$, it is important to note here that $n >= 0$, and no negative input size exists.

=== Definition
$
  f(n) = O(g(n)) <=> exists c > 0, exists n_0 > 0, "such that"
  \
  f(n) <= c * g(n) quad forall n >= n_0
$

$f(n)$ is $O(g(n))$ if there exists a $c > 0$ and an $n_0 > 0$, such that $f(n) <= c * g(n)$ for all values of $n >= n_0$

==== Explanation

Big-O describes the "upper-bound" of time an algorithm can take.
Therefore, Big-O is always greater than or equal to the actual number of steps.

There exists other complexity-notations:


#table(
  columns: 3,
  align: (center, center, center, center),
  inset: 12pt,
  fill: (x, y) => tableStripes(x, y),

  [#text(white, weight: "bold")[
    Notation
  ]],
  [#text(white, weight: "bold")[
    Symbol
  ]],
  [#text(white, weight: "bold")[
    Meaning
  ]],

  [
    Big-O
  ],

  [
    O
  ],

  [ Upper Bound ],

  [
    Little-o
  ],

  [
    o
  ],

  [ Tight upper bound ],

  [
    Big-Omega
  ],

  [
    $Omega$
  ],

  [ Lower bound ],

  [
    Little-omega
  ],

  [
    $omega$
  ],

  [ Tight lower Bound ],

  [
    Big-Theta
  ],

  [
    $Theta$
  ],

  [ Upper + Lower bound],
)

The following would be true for Big-O, but not for little-o:

$ x^2 in O(x^2) $
$ x^2 in O(x^2 + x) $
$ x^2 in O(200x^2) $

We will only be responsable for *Big-O* in this course.

*A tip:* You can look at the highest degree of the function, and already be aware of what time complexity it is .

=== Ways of solving f(n) = O(g(n))



#table(
  columns: (1fr, 1fr),
  align: (center, center, center, center),
  inset: 12pt,
  fill: (x, y) => tableStripes(x, y),

  [#text(white, weight: "bold")[
    Substitution
  ]],
  [#text(white, weight: "bold")[
    Rebuilding
  ]],

  [
    - If we want to prove
    \ $f(n) = n^2 + 5n + 3 = O(n^2)$

    - We identify $g(n) = n^2$
    We will need, by definition: $ n^2 +5n + 3 <= c * g(n) $
    $ n^2 +5n + 3 <= c * n^2 $

    - For all $n >= 1$, we have: $ n <= n^2 $
    $ 5n <= 5n^2 $
    $ 3 <= 3n^2 $

    - And since these are all bigger than the terms in $f(n)$, we can say:

    $ n^2 + 5n + 3 <= n^2 + 5n^2 + 3n^2 $
    $ n^2 + 5n + 3 <= 9n^2 $

    - So using $c = 9$ and $n_0 = 1$, we got a solution.
  ],

  [
    - If we want to prove
    \ $f(n) = n^2 + 5n + 3 = O(n^2)$

    - We will take: $ n_0 = 5 $
    $ n >= n_0 $
    $ n >= 5 $
    $ 5 <= n $

    - Multiplying by $n$, we get the middle term:
    $ 5n <= n^2 $

    - For the constant term, since $n >= 5$ we have $3 <= n$, and $n <= n^2$, so:
    $ 3 <= n^2 $

    - And we replace:

    $ n^2 + 5n + 3 <= n^2 + n^2 + n^2 $
    $ n^2 + 5n + 3 <= 3n^2 $

    So using $c = 3$ and $n_0 = 5$, we got a solution.
  ],
)

=== Why is knowing the time complexity of an algorithm important?

Let's imagine a sorted array $A$ like we did before, and let's say that array has a length of $N = 10^9$ (1 billion elements).

Using *sequential search* $O(n)$, would mean an upper-bound of $"operations" = o = 10^9$ operations (billion operations), to estimate how long that takes, we count CPU cycles per micro-operation:

#table(
  columns: 2,
  align: (center, center, center, center),
  inset: 12pt,
  fill: (x, y) => tableStripes(x, y),

  [#text(white, weight: "bold")[
    Operation
  ]],
  [#text(white, weight: "bold")[
    Theoretical CPU Cycles
  ]],

  [
    Load $A[i]$ from memory
  ],

  [
    1
  ],

  [ Compare $A[i] == K$ ],

  [
    1
  ],

  [
    Branch on result (if true stop, if false continue)
  ],

  [ 1 ],

  [
    Increment $i$
  ],

  [
    1
  ],

  [ Check if $i < n$ and branch ],

  [1],
)

These are $c approx 5$ cycles, and the time for the $n$ operations in relation with clock speed and 5-cycles:

$ T(o) = ("cycle count" * "operation count" )/ "Clock Speed Frequency" = (5o)/f $

Where $f$ is the clock-speed of the CPU (the speed of operation cycling) in "Hz". and $o$ is the operation count.
If we consider a theoretical CPU of clock speed $0.295 "GHz"$ (Same speed as a PlayStation 2).

$ T(o) = T(10^9) = (5(10^9) )/((0.295)(10^9)) approx 16.94 "s" $

It would take 16.94 seconds on a 0.295GHz CPU to execute the algorithm.

Oh the other hand, if we considered *binary search* instead with: $N = 10^9$, we would have an upper bound of: $ o' = log_2 N = log_2 10^9 approx 30 $

And so:
$ T(o') = T(log_2 N) = (5(log_2 10^9))/((0.295)(10^9)) approx 5 * 10^(-7) "s" approx 0.0000005 "s" $

Comparing the two times: $T(o) / T(o') = 16.94/ (5 * 10^(-7)) approx 33880000$, that's 33 million times faster. Now, realistically, there is one more operation cycle binary search does (calculating the midpoint), but I have omitted that in this calculation. This improvement in runtime cost is an *asymptotic improvement*

If I were to consider the actual CPU cycles per operations of binary search, the result would be like:

$ T_"seq" (o) = (5o)/f quad quad quad quad T_"bin" (o) = (6o)/f $

$T_"seq" (o) = T_"seq" (10^9) = (5(10^9))/((0.295)(10^9)) approx 16.94 "s" quad quad quad quad T_"bin" (o') = T_"bin" (log_2 N) = (6(log_2 10^9)) / ((0.295)(10^9)) approx 0.0000006 "s"$

*($T_"bin"$ has 6 cycles per operation, one extra for calculating the mid-point)*

Which still, isn't a big difference from the original estimation.
