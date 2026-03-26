#import "../../templates.typ": *
\
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

*else* statements are chained with *if* statements, and are executed in case the previous *if statement* turns out to be falsy, the structure is as such:

#code-block(
  ```
  if boolean:
    branch instructions
  else:
    branch instructions
  ```.text,
  lang: "",
)

One thing possible with *else* statements is chaining them with if statements, as such:

#code-block(
  ```
  if boolean:
    branch instructions
  elif boolean:
    branch instructions
  elif boolean:
    branch instructions
  else:
    branch instructions
  ```.text,
  lang: "",
)

Here, we have an if statement, chained with else statements, and a default case.

=== Using control flow to categorize age

#code-block(
  ```py
  age = 30

  if age >= 60:
      print("You're a senior!")
  elif age >= 40:
      print("You're an adult!")
  elif age >= 20:
      print("You're a young adult!")
  elif age >= 13:
      print("You're a teenager!")
  elif age >= 3:
      print("You're a child!")
  else:
      print("You're an infant!")
  ```.text,
  lang: "Python",
)


