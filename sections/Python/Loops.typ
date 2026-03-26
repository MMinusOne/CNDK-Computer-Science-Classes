#import "../../templates.typ": *

== Loops <Loops>

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
