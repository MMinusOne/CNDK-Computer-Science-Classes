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
  #text(size: 20pt, fill: secondary_color)[Instructor's Note]
]

#pagebreak()

#outline(title: text(size: 20pt, weight: "bold", fill: primary_color)[Table of Contents])

#pagebreak()

= Instructor's Guide

This is a Computer Science course that can be given in any level in highschool, be it grade 10, grade 11, or grade 12. And will probably be the first time these students will be exposed to Computer Science. Here are a few things to keep in mind when serving this course:

1) You can and should be somewhat selective about what you want to serve, especially in the freshmen classes, the first time this course material was served for an S2S class, time complexity and logic gates were fully omitted, and pure functions wasn't talked about, and bitshift operations were not required for tests, as well as many other things.

2) Be aware that some classes might need smaller side-notes and introductions to some particular concepts, may it be logarithms, function growth, inequality, or such.

3) Regarding exercises, the first time the course was served, many, many exercises were omitted, all of the Monte Carlo exercises were never really served, however, it is probably of interest to try and serve those to SG classes.

4) Regarding exams, I recommend starting really slow, maybe a quiz with multiple choice about computer architecture definitions, and don't include logic gates right off the bat, then make them slowly more complicated, but always include definition questions so that there are attainable questions in case a student fails all other questions, also, during the first time I served this course, I always included a bonus question, so theoretically, students can get more than 20/20 on an exam, but that was obviously never counted, it just made up for lost grades.

All the material is available at #link("https://github.com/MMinusOne/CNDK-Computer-Science-Classes"), and will be for the far future, modification of this PDF is suggested based on what the instructor feels like should be in the course.

The sourcecode is in Typst, a relatively new markup language(alternative to LaTeX), so it might take a while and some getting used to before changing anything, however the Typst documentation is clear and available at #link("https://typst.app/docs/")

#pagebreak()

#include "sections/Computer Architecture/main.typ"
#include "sections/Python/main.typ"
#include "sections/Complexity/main.typ"
// #include "sections/Miscellaneous/main.typ"

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

#text()[
  Good Luck! I want good grades.
]
#align(right)[
  #text()[Author: Michael Salloum]
]
