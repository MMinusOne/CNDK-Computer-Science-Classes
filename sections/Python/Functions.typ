#import "../../templates.typ": *

== Functions

Functions should be thought as machines that take an input and give us an output.

#figure(caption: "Function diagram")[
  #image("/assets/notes/Functions-definition.svg", width: 30em)
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
  stroke: 1pt + secondary_color,
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

=== Functions to be aware of

==== print

Output to the standard output (simplified).

#code-block(
  ```python
  >>> print("Hello World")
  --> Hello World
  ```.text,
  lang: "Python",
)

==== input

#text-block()[
  If the prompt argument is present, it is written to standard output, the function then reads a line from input and converts it to a string.
]

#code-block(
  ```python
  >>> s = input("--> ")
  --> Monty Python's Flying Circus
  >>> s
  "Monty Python's Flying Circus"
  ```.text,
  lang: "Python",
)

==== int

#text-block()[Returns an integer constructed from a number or a string.]

#code-block(
  ```python
  int(123.45) # 123
  int("123") # 123
  int("01110011", base=2) # 155
  ```.text,
  lang: "Python",
)

==== len

Returns the length (the number of items) of an object. The argument may be a sequence (such as a string, list or range), or a collection (like a dict).

#code-block(
  ```python
  len("Hello") # 5
  len([1,2,3,4]) # 4
  len(range(3, 6)) # 3
  len({
   "key_1": "value_1",
   "key_2": "value_2"
  }) # 2
  ```.text,
  lang: "python",
)

==== range

Range is technically a _class_ not a function, but we will refer to it as a function.
We will consider valid arguments to be integers.

Refer to #ref(<Loops>, supplement: "Loops") to know how to use it.

=== Standard Libraries & Functions/Properties to be aware of

Library functions are functions that are provided by libraries, and can't be used without importing them.

==== math library

#code-block(
  ```python
  import math

  math.pi # 3.14.......
  math.cos(math.pi) # -1.0
  math.sin(math.pi / 2) # 1.0
  math.sqrt(4) # 2
  ```.text,
  lang: "python",
)

==== random library

#code-block(
  ```python
    import random

    random.random() # Returns a number between 0 and 1
    random.randint(a, b) # Returns a random integer N such that a <= N <= b
    randon.randrange(start, stop, ?step=1) # Returns a randomly selected element from range(start, stop, step)
    random.uniform(start, stop) # Returns a random float between start and stop
  ```.text,
  lang: "python",
)
