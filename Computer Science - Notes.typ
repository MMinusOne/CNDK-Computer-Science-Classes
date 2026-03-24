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
  #text(size: 20pt, fill: secondary_color)[Full Study Notes]

]

#pagebreak()

#outline(title: text(size: 20pt, weight: "bold", fill: primary_color)[Table of Contents])

#pagebreak()


#include "sections/Computer Architecture/main.typ"
#include "sections/Python/main.typ"
#include "sections/Miscellaneous/main.typ"

\ \ \ \ \ \ \

= Exam studying methodology <Exam-Studying-Methodology>

- Focus on understanding the concepts before memorizing them, there's not even the need to memorize them.
- 20% of the event yields 80% of the outcome, don't try and nail all the details, just focus on the most important things.
- Focus on the English parts of things and try to explain thing to yourself and other people to see if you understand.
- Regarding Python, you can try everything each step of the way, read #ref(<Try-It-Yourself>, supplement: "Try it yourself")
- Ask me in the group if there's any questions, not in private, I won't respond.

#linebreak()
#linebreak()

#text()[
  Good Luck! I want good grades.
]
#align(right)[
  #text()[Author: Michael Salloum]
]
