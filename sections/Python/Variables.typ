#import "../../templates.typ": *

== Variables <Variables>

Variables in Python are #text(fill: primary_color, weight: "bold")[mutable] (can change) and #text(fill: primary_color, weight: "bold")[untyped] (no specific type restriction).

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
