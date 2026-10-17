// #set page(
//   paper: "a4",
//   margin: (x: 1cm, y: 1cm),
// )

#let code-block(body, height: auto) = {
  block(
    inset: 0pt,
    radius: 4pt,
    width: 100%,
    height: height,
  )[
    #align(start)[
      #text(fill: black, font: "Courier New")[
        #raw(body, block: true)
      ]
    ]
  ]
}

== Section 1 : Choose the correct answer (6 points)

=== 1-) Random Access Memory is volatile storage because:

A) It loses all stored data instantly when electrical power is disconnected \
B) Its speed changes unpredictably depending on software load\
C) Data can only be written once and never modified\
D) It is highly fragile and physically breaks easily\

=== 2-) What is the primary role of the Central Processing Unit:

A) To permanently save files when the machine loses power\
B) To connect the computer to local networks and routers\
C) To display monitor output\
D) To execute sequences of instructions

=== 3-) Python is interpreted because:

A) A compiler translates the code into instructions the CPU can run \
B) A program called the interpreter executes the code line by line\
C) It bypasses the CPU entirely and executes code directly inside the computer's RAM \

== Section 2 (3 points):

1-) Convert $01000011$ to base-10\
2-) Compare arguments and parameters in a function \
3-) Compare the integer and a float data-type \
4-) Copy and complete the truth table

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (center, center, center, center),
    inset: 3pt,

    [#text(black, weight: "bold")[$a$]],
    [#text(black, weight: "bold")[$b$]],
    [#text(black, weight: "bold")[
      $a$ AND $b$
    ]],
    [#text(black, weight: "bold")[
      $a$ OR $b$
    ]],
    [#text(black, weight: "bold")[
      NOT $a$
    ]],
    [#text(black, weight: "bold")[
      NOT $b$
    ]],

    [False], [False], [], [], [], [],
    [True], [False], [], [], [], [],
    [True], [True], [], [], [], [],
    [False], [True], [], [], [], [],
  )
]


== Section 3: Identify the pieces of code (3 points)

For each of the functions below, determine/identify the following:
- The name of the function
- The parameters they accept
- The procedure (steps) the function does
- The output (result) of the procedure

#table(
  rows: 2,
  columns: 3,

  [
    *Function A*:
    #image("Python1.png", width: 10em)
  ],

  [
    *Function B*:
    #image("Python2.png", width: 10em)
  ],

  [
    *Function C*:
    #image("Python3.png", width: 10em)
  ],

  [
    *Function D*:
    #image("Python4.png", height: 2em)
  ],

  [
    *Function E*:
    #image("Python7.png")
  ],

  [
    *Function F*:
    #image("Python8.png")
  ],
)

== Section 4: From The Text (8 points)


#align(center)[
  #pad(y: 1em)[
    #figure(caption: "Inside The Machine - Jon Stokes")[
      #image("text.png", height: 30em)
    ]
  ]
]

1-) State 4 examples of arithmetic instructions? \
2-) State 2 memory-access instructions? \
3-) What does a load, add, and store instruction  tell the computer to do? \
4-) What does the text refer to an ordered list of instructions as?


== Section 5: Bonus

1-) What is a deterministic function? State an example of a function that is deterministic, and why?\
2-) Write 4 examples of comparison operators \
3-) The following function takes an _n_-length number list, express the total amount of arithmetic operations done by the function(algorithm) in terms of _n_ \
(Note: Each addition, subtraction, division and multiplication is an arithmetic operation and the only operation that should be accounted for)


#image("Python5.png", height: 6em)
4-)
4.1-) What is the main purpose of time complexity analysis? \
4.2-) What is the theoretical minimum time \ complexity of finding the i-th largest element \


#image("text3.png", height: 11cm, width: 12cm)



