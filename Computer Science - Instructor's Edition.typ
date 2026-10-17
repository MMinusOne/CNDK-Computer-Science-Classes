#import "templates.typ": *


#set page(
  paper: "a4",
  margin: (x: 1.8cm),
)
#set heading(numbering: "1.")

#show link: it => text(secondary_color, it)
#show ref: it => text(secondary_color, it)
#show heading.where(level: 1): it => block(
  text(size: 24pt, weight: "bold", fill: primary_color, it)
    + v(0.3em)
    + line(length: 100%, stroke: 2pt + secondary_color)
    + v(0.5em),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 1em,
  text(size: 18pt, weight: "bold", fill: secondary_color, it),
)

#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.8em,
  text(size: 14pt, weight: "bold", fill: dark_color, it),
)

#align(center)[
  #v(3cm)
  #text(size: 32pt, weight: "bold", fill: primary_color)[Computer Science]
  #v(0.5cm)
  #text(size: 20pt, fill: secondary_color)[Instructor's Edition]
]

#pagebreak()

#outline(title: text(size: 20pt, weight: "bold", fill: primary_color)[Table of Contents])

#pagebreak()

= Instructor's Guide

== Who this course is for

This is a first course in computer science for students in grades 10-12. It assumes no prior exposure and only basic algebra and some calculus, the material is deliberately simplified in places (The CPU is just an ALU and a CU, "interpreted" as line-by-line execution). Refine these when your class is ready.

== What is inside

Part 2 covers computer architecture, number systems, logic gates. Part 3 covers Python fundementals. Part 4 covers complexity theory. Part 5 is a short unit on caching.

After those come the exercises, sample exam.

#table(
  columns: (1fr, 1fr),
  inset: 10pt,
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary_color,
  align: (left, left),

  [#text(fill: white, weight: "bold")[Core]],
  [#text(fill: white, weight: "bold")[Optional (stronger classes or extra time)]],

  [CPU, ALU, CU, memory types, and units], [Logic gates],
  [Binary and Decimal], [Bitshift operations],
  [Python types, operators, loops, functions, control flow], [Pure functions, deterministic functions],
  [], [Complexity Theory and Big-O],
  [], [Caching],
  [], [Monte Carlo Exercises],
)

In my first run with a beginner class, I left out complexity, logic gates, caching, entirely, the rest in the optional category was not examined.

== Before you assign exercises

Some exercisews rely on Python the notes don't  introduce: building and updating dictionaries, `len()`, and importing `random` and `math`. Teach these first.
Complexity Theory also benifts from an introduction to logarithms, inequalities, and how functions grow.

== Assesment

*Start slow*: Open with easy muiltiple-choice quiz on architecture, definitions, and hold logic gates until later, you can also make text-comprehension of computer-science books and blogs, include few open-ended questions.
*Add difficulty gradually*: move through code reading, short calculations, and proofs.
*Always include definition questions*: so every student has attainable marks.
*Bonus question*: include a few per test to recover lost marks, final grade is capped at 20/20.

== Using and adapting this book

The source and all PDFs live at #link("https://github.com/MMinusOne/CNDK-Computer-Science-Classes"), the source is written in Typst, and its documentation is at #link("https://typst.app/docs/"). Expect a short learning curve before editing, and adjust the content to your course.

#pagebreak()

#include "sections/Computer Architecture/main.typ"
#include "sections/Python/main.typ"
#include "sections/Complexity/main.typ"
#include "sections/Miscellaneous/main.typ"

\ \ \ \ \ \ \

= Exam studying methodology <Exam-Studying-Methodology>

- Focus on understanding the concepts before memorizing them, there's not even the need to memorize them.
- 20% of the effort yields 80% of the outcome, don't try and nail all the details, just focus on the most important things.
- Focus on the English parts of things and try to explain things to yourself and other people to see if you understand.
- Regarding Python, you can try everything each step of the way, read #ref(<Try-It-Yourself>, supplement: "Try it yourself")


= Exercises

== Computer Architecture
#include "exercises/Computer Architecture.typ"
#pagebreak()

== Logic Gates
#include "exercises/Logic Gates.typ"

== Python

#include "exercises/Python Exercises.typ"

#pagebreak()

= Exams

#include "exams/Computer Science Exam 2.typ"

