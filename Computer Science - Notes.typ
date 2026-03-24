#import "templates.typ": *


#let code-block(body, lang: str, height: auto) = {
  block(
    fill: rgb("#1F2937"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    height: height,
  )[
    #align(start)[
      #text(fill: white, font: "Courier New")[
        #raw(body, lang: lang, block: true)
      ]
    ]
  ]
}


#set page(
  paper: "a4",
  margin: (x: 1.8cm),
)
#set heading(numbering: "1.")

#show link: it => text(secondary, it)
#show ref: it => text(secondary, it)
#show heading.where(level: 1): it => block(
  text(size: 24pt, weight: "bold", fill: primary, it)
    + v(0.3em)
    + line(length: 100%, stroke: 2pt + secondary)
    + v(0.5em),
)

#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 1em,
  text(size: 18pt, weight: "bold", fill: secondary, it),
)

#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.8em,
  text(size: 14pt, weight: "bold", fill: dark, it),
)

#align(center)[
  #v(3cm)
  #text(size: 32pt, weight: "bold", fill: primary)[Computer Science]
  #v(0.5cm)
  #text(size: 20pt, fill: secondary)[Full Study Notes]

]

#pagebreak()

#outline(title: text(size: 20pt, weight: "bold", fill: primary)[Table of Contents])

#pagebreak()


#include "sections/Computer Architecture/main.typ"

= Python

== Introduction
#block(
  fill: secondary.lighten(80%),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  #text(size: 12pt, fill: dark, weight: "bold")[
    Definition: Python is a "high-level", "interpreted", "general-purpose" scripting language.
  ]
]

#v(1em)

\
#table(
  columns: (auto, 1fr),
  align: (left, left),
  fill: (x, y) => tableStripes(x, y, color_one: block-bg, color_two: white),
  stroke: 1pt + secondary,
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
      #figure(caption: "Compiled languages process.")[#image("./images/compiler.png", height: 8cm)] <Compiled-Process>
    ],
    grid.cell()[#figure(caption: "Abstractions.")[#image("./images/abstractions.png", height: 8cm)] <Abstractions>
    ],
  )
]




== Data Types

#table(
  columns: (auto, 1fr),
  align: (left, left),
  fill: (x, y) => tableStripes(x, y, heading_color: secondary),
  stroke: 1pt + secondary,
  inset: 10pt,

  [#text(fill: white, weight: "bold")[Type]], [#text(fill: white, weight: "bold")[Description & Examples]],

  [#raw("int", lang: "python")], [Integer - a whole number. Examples: `10`, `25`, `300`, `-5`],

  [#raw("float", lang: "python")], [Decimal number. Examples: `52.6`, `19.3`, `1.0`, `5.0`],

  [#raw("bool", lang: "python")], [Boolean - either `True` or `False`],

  [#raw("str", lang: "python")], [String - sequence of characters. Examples: `"Hello"`, `"Text"`, `""`],

  [#raw("list", lang: "python")],
  [Sequence of elements. Example: `[10, 5.2, 9.8]`
    \ Lists are heterogeneous and 0-indexed
    \ List indexing is non-commutative
  ],

  [#raw("dict", lang: "python")],
  [Dictionary - key-value store. Example: `{"name": "John", "age": 30}`
    \ Access: `person["name"]` → `"John"`],
)

#v(1em)

== Variables <Variables>

Variables in Python are #text(fill: primary, weight: "bold")[mutable] (can change) and #text(fill: primary, weight: "bold")[untyped] (no specific type restriction).

examples:

#code-block(
  ```python
    name = "Johnny"
    johnny_age = 20
    grades = [10, 5.2, 9.8, 12.5, 13.2]
    person = {"name": "John", "age": johnny_age}
  ```.text,
  lang: "Python",
)


== Operators

=== Arithmetic operators

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary,
  inset: 8pt,

  [#text(fill: white, weight: "bold")[Operator]],
  [#text(fill: white, weight: "bold")[Name]],
  [#text(fill: white, weight: "bold")[Example]],

  [#text(size: 14pt, weight: "bold")[`+`]], [Addition], [`10 + 5 = 15`],
  [#text(size: 14pt, weight: "bold")[`-`]], [Subtraction], [`10 - 5 = 5`],
  [#text(size: 14pt, weight: "bold")[`*`]], [Multiplication], [`10 * 5 = 50`],
  [#text(size: 14pt, weight: "bold")[`/`]], [Division], [`10 / 5 = 2.0`],
)

#v(0.5em)

#block(
  fill: block-bg,
  inset: 10pt,
  radius: 4pt,
)[
  #text(fill: dark)[
    *Important:* Division always returns a float: `int / int → float`
  ]
]

#v(1em)


=== Comparison operators

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary,
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
  fill: block-bg,
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
    #figure(caption: "Right bitshift")[#image("./images/right-bitshift.png")]
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


== Loops

Loops are used for repeated actions.

=== A visual

#code-block(
  ```python
  accumulator = 0 # A variable that accumulates

  for current_number in range(0, 10): # A loop over the range 0 to 10 (10 exclusive), and current_number is how many loops we have made so far
    accumulator += current_number # Mutating accumulator and adding current_number to it
  ```.text,
  lang: "python",
)

After this, `accumulator` will be $0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45$.
\  \ \ \
=== Example: Using lists to match two n-length lists

#code-block(
  ```python
  names  = ["John", "Johnnathan", "Jay", "Jane", "Jake"] # List of n names
  grades = [9, 7.5, 6, 3.5, 6] # List of n grades
  n      = 5

  for i in range(0, n): # Looping n times
    name = names[i] # Accessing the n-th name from the names list
    grade = str(grades[i]) # Accessing the n-th grade from the grades list, and converting it to a string, the same way we would do with an int(...)
    print(name + " has a grade of " + grade) # Concatenating (Adding) the strings together to make a sentence, here we see why we turned grade into a "str", because str + int is not possible
  ```.text,
  lang: "python",
)

The output is as shown below:

#code-block(
  ```bat
  John has a grade of 9
  Johnnathan has a grade of 7.5
  Jay has a grade of 6
  Jane has a grade of 3.5
  Jake has a grade of 6
  ```.text,
  lang: "python",
)

=== Using lists without the range function

Until now, we are still using the `range` function, but are *iterable* by default.
An iterator allows any object to be *iterated over* by a loop. Let's compare:

#grid(
  columns: (1fr, 0.5fr, 1fr),
  grid.cell()[
    #figure(caption: "Looping over lists with range", supplement: "Code")[
      #code-block(
        ```python
        nums = [1,2,3,4,5]
        n = 5

        for i in range(0, n):
          print(nums[i])
        ```.text,
        lang: "python",
        height: 8em,
      )
    ]
  ],
  grid.cell()[],
  grid.cell()[
    #figure(caption: "Looping over lists with the list's iterative property", supplement: "Code")[
      #code-block(
        ```python
        nums = [1,2,3,4,5]

        for num in nums:
          print(num)
        ```.text,
        lang: "python",
        height: 8em,
      )
    ]
  ],
)

== Functions

Functions should be thought as machines that take an input and give us an output.

#figure(caption: "Function diagram")[
  #image("images/Functions-definition.svg", width: 30em)
]
\ \ \
=== A visual

#figure(caption: "A function that adds two numbers, x and y.", supplement: "Code")[
  #code-block(
    ```python
    def add(x, y):
      return x + y
    ```.text,
    lang: "Python",
  )
] <Functions-Visual>

Now, to use this function we just *defined*, we will need to *call* it, as such:

#figure(supplement: "Code", caption: "Calling the function add")[
  #code-block(
    ```python
    result = add(10, 5)
    print(result)
    ```.text,
    lang: "Python",
  )
] <Function-Calling>


The output of result will now be `15`, since the function handled the addition of `x` and `y`, and `x` was `10`, and y was `5`.

=== Parameters & Arguments

- The parameters of a function is what we label the inputs. Consider #ref(<Functions-Visual>), the parameters of that function are `x` and `y`.

- The arguments of a function is what is supplied for the labels of the inputs. Consider #ref(<Function-Calling>), the arguments are `10` and `5`.

=== Returning Values

The *return value* of a function is what the function outputs. Taking as example #ref(<Functions-Visual>), the return value can be described as `x + y`, or also the sum of its inputs.

The return value is also what comes after the *return* keyword.

=== Deterministic & Pure function

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary,
  align: (left, left),

  [#text(white)[Function Characteristic]], [#text(white)[Definition]],
  [Deterministic Function],
  [
    A deterministic function is a function that returns the same outputs for the same inputs, and has no randomness in the determination of future states.
  ],

  [Pure Function],
  [
    A pure function is a function that obeys two properties:
    - It is deterministic
    - The function has no side effect, meaning no mutation of non-local variables.
  ],
)

=== Generator Functions

=== Function signature & body
\ \ \
=== Using functions to calculate the hypotenuse of a right triangle ABC

#code-block(
  ```python
  def calculate_hypotenuse(AB, AC):
    BC = (AB**2 + AC ** 2) ** 0.5
    return BC
  ```.text,
  lang: "python",
)

We can describe this function as follows:

- This function is called `calculate_hypotheneuse`.
- It takes two parameters: AB and AC, which are supposed to be either int's or floats.
- It returns the hypotheneuse of the triangle ABC.

== Control Flow

Control flow describes how execution progresses from one command to the next.

=== A visual

#figure(caption: "Control flow, if and else.", supplement: "Code")[
  #code-block(
    lang: "python",
    ```python
    your_age = 15
    adult_age = 18

    if your_age >= adult_age:
      print("You are an adult")
    else:
      print("You are a minor")
    ```.text,
  )
]

In the code above, we have two variables, `your_age` and `adult_age`.

We first compare `your_age` and `adult_age` using `>=` (Bigger than or equal to), which returns a bool type, this bool type is then considered by the *if* statement before it, and accordingly, the *branch* below if (the truthy-case branch) will be executed, otherwise, we are handling it with an *else* statement.

=== If statements

*if* executes it's branch if the statement given to it is a truthy value, a *truthy* value is a value that is not *falsy*.

Some *falsy* values in Python are: ```python None```, ```python 0``` and ```python False```

*truthy* values evaluate to *True* booleans, and *falsy* values evaluate to *False* booleans.

The structure of an *if statement* looks as such:

#code-block(
  ```
  if boolean:
    branch instructions
  ```.text,
  lang: "",
)

=== Else statements

*else* statements are chained with

== Try it yourself <Try-It-Yourself>
You can go to the website: #link("https://www.programiz.com/python-programming/online-compiler/"), and follow everything each step of the way, maybe even ask AI but Ill be pretty upset if I found out :(


= Miscellaneous
== Cache

A cache is a place of storage of temporary information that get added(*inserted*) and removed (*evicted*) based on certain criteria, the criteria to add information in the cache is called an *insertion policy*, and the word to remove something from the cache is called an *eviction policy*, this mechanism is mainly used for performance reasons, for
#figure()[
  - #strong()[Tiktok example scenario] : #text()[A Tiktok video is stored in the US, and you amongst other Lebanese people watch that video really often on their phones, Tiktok might consider that fact, and decide to insert the video in a cache (the placement of storage) that is closer to Lebanon, that way when people want to go watch that video, it goes and gets that video information from somewhere closer, resulting in faster speeds.
    ]
] <Cache-Example-Scenario>


=== The client-server model

The client server model is made up of two components, the: the client, and the server, and focuses on the relationship and communication that happens between these two components.


==== The client

The client (also the consumer in this relationship), will consume information, this can be for example: you watching Tiktok on your phone, the client is your phone.

==== The server

The server (the producer in this relationship), will produce and send information to the client, in the example of Tiktok, the Tiktok *servers* will send out the video information (title, description, comments, likes, reposts, video buffer, etc...) to your phone.

==== Illustration

#figure(caption: "The client-server model")[
  #image("images/client-server-model.png")
]

==== The caching of client-server models

Usually caching in the client-server model is based on geographical location, for this, you can imagine #ref(<Cache-Example-Scenario>, supplement: "tiktok example scenario"), let's first look at the figure #ref(<Cache-Added-On-Client-Server-Model>)

#figure(caption: "Cache added on a standard client-server-model")[
  #image("images/cache-client-server-model.png")
] <Cache-Added-On-Client-Server-Model>

Here, the Tiktok system notices that multiple people, close to each other geographically, are watching the same video very frequently, so by nature, to satisfy those people's need for performance, the system decided to implement a cache, so instead of every time having to get the video information from New York, America, the information is gathered from Paris, France, resulting in a shorter response time, naturally data is only needed to be cached once, and is only cached again if it is evicted, so for example, after some amount of time, the system might decide: "There's no one watching this, let me free up space and free it from the cache."

=== In the context of a CPU

We can also apply the idea of a cache inside a CPU, we have said before that a #ref(<Compiled-Process>, supplement: "Compiler") turns normal code into CPU code (more commonly called machine code), this machine code will have to actually *consume* this code to do something meaningful with it, so a execution process without a cache might look like #ref(<CPU-Without-Cache>), but with a cache implemented, might be like #ref(<CPU-With-Cache>), internally.

#grid(
  columns: 2,
  grid.cell()[
    #figure(caption: "CPU without cache")[
      #image("images/CPU-Without-Cache.png")
    ]<CPU-Without-Cache>
  ],
  grid.cell()[
    #figure(caption: "CPU with cache")[
      #image("images/CPU-With-Cache.png")
    ]<CPU-With-Cache>
  ],
)


==== CPU cache levels

In modern systems, usually CPUs have 3 cache levels, L1 cache, L2 cache and L3 cache, when the CPU can't find information in the L1 cache, it will go to the L2, if it can't find in the L2 it will go to L3, if it's not in the L3 it will go to primary memory, if it's not in primary memory it will go to secondary memory. This is called *propagation*.

In resume, CPU caches improve performance, #underline()[but] add complexity on an existing system.

=== Summary

A cache is an #ref(<Abstractions>, supplement: "Abstraction Layer") that is usually implemented between a producer and a consumer, a sender and a receiver, and emitter and a subscriber, that stores information temporary in a way that can be accessed faster for that consumer, such that there are performance gains.

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
