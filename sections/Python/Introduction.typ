#import "../../templates.typ": *

== Introduction
#text-block()[
  Definition: Python is a "high-level", "interpreted", "general-purpose" scripting language.
]

#v(1em)

\
#table(
  columns: (auto, 1fr),
  align: (left, left),
  fill: (x, y) => tableStripes(x, y, color_one: block_bg_color, color_two: white),
  stroke: 1pt + secondary_color,
  inset: 10pt,

  [#text(fill: white, weight: "bold")[Characteristic]], [#text(fill: white, weight: "bold")[Explanation]],

  [#text(weight: "bold")[High-Level]],
  [Built on many lower-level abstractions. Python provides an easy-to-use language by building upon harder programming concepts and technologies.],

  [#text(weight: "bold")[Interpreted]],
  [An external program (the interpreter) reads and executes instructions line by line. Unlike compiled languages, Python code is interpreted at runtime.],

  [#text(weight: "bold")[General-Purpose]],
  [Can be used for most use-cases. Python is versatile: web development, data science, automation, etc.],

  [#text(weight: "bold")[Sequential]], [Executes instructions from top to bottom by default.],

  [#text(weight: "bold")[Imperative]], [Uses imperative programming style to maintain state.],
)

#v(1em)

#align(center)[
  #grid(
    columns: 2,
    grid.cell()[
      #figure(caption: "Compiled languages process.")[#image(
        "../../images/compiler.png",
        height: 8cm,
      )] <Compiled-Process>
    ],
    grid.cell()[#figure(caption: "Abstractions.")[#image("../../images/abstractions.png", height: 8cm)] <Abstractions>
    ],
  )
]

