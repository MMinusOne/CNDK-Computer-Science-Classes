#import "../../templates.typ": *

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
