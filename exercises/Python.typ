#set page(
  margin: 2em,
)

#import "../templates.typ": *

#exercise(title: "An algorithm that satisfies: nums[i] - 10 = k")[
  Suppose we have a list `nums` and a constant $k$.

  You must find the first index `i` such that ```python nums[i] - 10 == k```. If there is no such index that satisfies the property, return ```python None```.

  Example cases:

  *Case 1*:
  - *Inputs*: nums = [5, 20, 35, 23, 2, 5, 30, 6, 2, 3], k = 20 \
  - *Output*: 6 \
  - *Explanation*: nums[6] is 30, 30 - 10 = 20, and k = 20. \

  *Case 2*:
  - *Inputs*: nums = [5, 2, 60, 50, 20], k = 15 \
  - *Output*: None \
  - *Explanation*: There is no index $i$ such that `nums[i] - 10 = k`. \

  1. Write a multi-step strategy towards solving the problem.
  2. Write an algorithm to solve this problem.
  3. Describe the upper-bound time and space complexity of your solution.
]

#solution()[
  1. \
    - We must make a function that accepts two parameters: `nums` and  `k`.
    - Then we need to loop the `range(n)` where n is the length of `nums`, while accessing the index `i`, and for each `nums[i] - 10`, see if it is `==` to `k`.
    - If an index is found, and the property is satisfied, we immediately return the index and exit the function.
    - Otherwise, we keep looping, and if the loop ends and no index is found, we return `None`.

    2.

    #code-block(
      ```python
      def solution(nums, k):
        for i in range(len(nums)):
          if nums[i] - 10 == k:
            return i

        return None
      ```.text,
      lang: "python",
    )

    3. The solution's time complexity is $O(n)$: Because the amount of instructions scale linearly ($y = a x + b$) with the input's size. \
      The solution's space complexity is $O(1)$: Because we are only storing constant data regardless of input size).
]

#v(1cm)

#exercise(title: "The two sum problem")[
  Suppose we have a list `nums` and a constant `k`.

  You must find two indices `i` and `j` such that `nums[i] + nums[j] = k` and $i != j$, if there are no such indices, return `None`.

  Multiple solutions may be valid.

  Example cases:

  *Case 1*:
  - *Inputs*: [3,2,4], k = 6
  - *Outputs*: [1,2]
  - *Explanation*: nums[1] + nums[2] == 6, we return [1,2] (or [2,1])

  *Case 2*:
  - *Inputs*: nums = [2,7,11,15], k = 9
  - *Outputs*: [0, 1]
  - *Explanation*: Because nums[0] + nums[1] == 9, we return [0, 1]

  1. Write a multi-step strategy towards solving the problem.
  2. Write an algorithm to solve this problem.
  3. Describe the upper-bound time and space complexity of your solution.
]


#solution()[
  1. \
    - We must make a function that accepts two parameters: `nums` and `k`.
    - We will make a dict of numbers we have seen already, the keys will be numbers we've seen and the values will be indices.
    - We will loop over `nums`, accessing `i` and `nums[i]`.
    - Assuming we have `nums[i]`, `c = k - nums[i]` will be the number we need such that `nums[i] + c = k`, we will calculate that compliment `c`.
    - If the compliment is inside the dict, then we can return the index of the compliment and `i`. (In other words, if the number $c$ we need for `c + nums[i] = k` is inside the dict, we will return the indices of it and $i$).

  2. #code-block(
      ```python
      def solution(nums, k):
          seen = {}

          for i in range(len(nums)):
              num = nums[i]
              compliment = k - nums[i]

              if compliment in seen:
                  j = seen[compliment]
                  return [i, j]

              seen[num] = i

          return None
      ```.text,
      lang: "python",
    )

    3. The time complexity of the algorithm is: $O(n)$ \
      The space complexity of the algorithm is: $O(n)$
]

#solution()[
  1. \
    - We must make a function that accepts two parameters: `nums` and `k`.
    - We will loop over `range(len(nums))` and access `i` and `nums[i]`.
    - For each `num` at `i`, we will loop over `range(i + 1, len(nums))`, to check the numbers in-front of `nums[i]` excluding `nums[i]` itself, from that loop we will access `j`.
    - In the previous loop, if `nums[i] + nums[j] == k`, then we can return `[i, j]`

  2. #code-block(
      ```python
      def solution(nums, k):
        for i in range(len(nums)):
          for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == k:
              return [i, j]

        return None
      ```.text,
      lang: "python",
    )

    3. The time complexity of the algorithm is: $O(n^2)$: The function scales quadratically with it's input. \
      The space complexity of the algorithm is: $O(1)$: We are only storing constant data.
]

#v(1cm)

#exercise(title: "Approximate pi using Monte Carlo methods")[
  Monte Carlo methods are computational algorithms based on *repeated random sampling*, used to solve *deterministic* problems through *randomness*.


  - *Area of a circle*: $a_c = pi r^2$, where $r$ is the radius.
  - *Area of a square*: $a_t = a^2$, where $a$ is the side-length of the square.
  - *Equation of a circle*: $x^2 + y^2 = r^2$
  - *Point $P(x_p, y_p)$ is inside the circle*: $x_p^2 + y_p^2 <= r^2$
  - *Point $P(x_p, y_p)$ is outside the circle*: $x_p^2 + y_p^2 > r^2$

  Now, imagine a circle of radius $r$ centered at $(0,0)$, inscribed in a square, the square would have side-length $a = 2r$. The area of the square would then be $a_t = (2r)^2 = 4r^2$.

  Now, imagine within the constraints of this square, we are randomly choosing $n$ amount of points, and we will consider two cases:
  - Points that landed in the circle
  - Points that landed in the square

  If you think about it, the proportion of points inside the circle approximates the proportion of the circle's area to the square's area. We will compute $a_c / a_t$ to get a formula for $pi$.

  $
    a_c / a_t = (pi r^2) / (4r^2) = pi/4
  $

  Now, we will consider the amount of points that landed in the circle as the area of the circle ($a_c$), and the points that landed in the square as the area of the square ($a_t$), so we get:

  $
    "amount of points in the circle" / "amount of points in the square" approx pi/4 \
    pi approx 4 ("amount of points in the circle" / "amount of points in the square")
  $

  The way we will resolve this equation using Monte Carlo is as following: for a number $n$, we will generate $n$ points with random $x$ and $y$ coordinates, then, for each of these points, we will use the formulas to check if they landed in the circle or not, then we could resolve this equation.

  Now, because `random.random()` only provides values between `0` and `1`, we will work with a quarter-circle (first-quadrant only) where: $0 <= x <= 1$ and $0 <= y <= 1$, which simplifies the process (no need to generate negative coordinates).

  Here are the visuals:

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 1em,
    grid.cell()[
      #figure(caption: $n = 100$)[
        #image("/assets/n-100-monte-carlo-circle.png")
      ]
    ],
    grid.cell()[
      #figure(caption: $n = 500$)[
        #image("/assets/n-500-monte-carlo.png")
      ]
    ],
    grid.cell()[
      #figure(caption: $n = 1000$)[
        #image("/assets/n-1000-monte-carlo.png")
      ]
    ],
    grid.cell()[
      #figure(caption: $n = 5000$)[
        #image("/assets/n-5000-monte-carlo.png")
      ]
    ],
  )

  The purple points are the points _inside the circle_, and the green points are _outside the circle_.

  1. Write a multi-step strategy towards solving the problem.
  2. Write the algorithm to solve this problem.
  3. Describe the upper-bound time and space complexity of your solution.
]

#solution()[
  1. \
    - We must make a function that takes a parameter: `amount_of_points`, the number of points to be generated.
    - We will consider arbitrarly that $r = 1 "unit"$.
    - We will make a variable called `points_in_circle` to accumulate how many points landed in the circle.
    - We must loop `n` times.
    - For each loop, each time, we will generate a random `x_p` and `y_p` point that lies between 0 and 1 with `random.random()` from the `random` package.
    - We will then calculate `x_p**2 + y_p**2` for that point, and check if it is less than $r^2$, if it is, then it is inside the circle, and we will add `+1` point to `points_in_circle`.
  2. #code-block(
      ```python
      import random

      def solution(amount_of_points):
          points_in_circle = 0
          r = 1

          for i in range(n):
              x_p = random.random()
              y_p = random.random()

              distance = x_p**2 + y_p**2

              if distance <= r**2:
                  points_in_circle += 1

          pi = 4 * (points_in_circle / amount_of_points)
          return pi
      ```.text,
      lang: "python",
    )

    3. This algorithm has a time complexity of: $O(n)$: Because instructions increase linearly with input size. \
      And has a space complexity of: $O(1)$: Because the amount of data we are storing is not proportional and independant of the input size.

    *Note*: We could of also solved this using a full circle with `randrange`.
]

#exercise(title: "Approximate an integral with monte carlo methods")[
  Think of trying to find an integral from $a$ to $b$ for $f(x)$ as trying to find the area under the curve of $f(x)$ from $x_1 = a$ to $x_2 = b$.

  - *Area of a rectangle:* $a_r = "length" * "width"$

  $ f(x) = sin(x) $

  We want to try and approximate $integral_0^pi f(x) dif x$. So what we are saying is: "We want the area under the curve from $x_1 = 0$ to $x_2 = pi$ for the curve $f(x)$."

  We know that $-1 <= sin(x) <= 1$, but since we're dealing with the first quadrant ( $x in [0, pi]$ ), we will only consider positive values: $0 <= sin(x) <= 1$.

  To use Monte Carlo methods in geometry, we need the proportion of points in a shape inside another shape, so let's consider a rectangle around the curve.

  Let's consider the rectangle:

  - *width* $w = x_2 - x_1 = pi - 0 = pi$. \
  - *height* $h = 1$ (since $0 <= sin(x) <= 1$)

  The area of the rectangle would be $a_t = w * h = pi$.

  Now, let's generate $n$ amount of random points with random $x$ and $y$'s, and check if they are under(and in this case inside) the curve or not.

  A random point $P(x_p, y_p)$ within the rectangle is only going to be under $f(x)$ if: $y_p <= f(x_p)$.

  Let's call the area of the curve: $a_c$ from now on.

  Because the proportion of points inside the curve approximates the proportion of the curve's area relative to the rectangle's area. Then we can derive this formula:
  $
    "points in the curve" / "points in the rectangle" approx "area of the curve" / "area of the rectangle" \
    "points in the curve" / "points in the rectangle" approx a_c / a_t
  $

  And since we want the area of the curve ($a_c$):

  $ a_c approx "points in the curve" / "points in the rectangle" * a_t $

  Here are the visuals:

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    grid.cell()[
      #figure(caption: $n = 100$)[
        #image("/assets/n-100-monte-carlo-sin-integral.png")
      ]
    ],
    grid.cell()[
      #figure(caption: $n = 500$)[
        #image("/assets/n-500-monte-carlo-sin-integral.png")
      ]
    ],
    grid.cell()[
      #figure(caption: $n = 5000$)[
        #image("/assets/n-5000-monte-carlo-sin-integral.png")
      ]
    ],
  )

  1. Write a multi-step strategy towards solving the problem.
  2. Write an algorithm to solve this problem.
  3. Describe the upper-bound time and space complexity of your solution.
]

// #exercise(title: "Approximate pi using an n-sided hexagon inscribed in a circle")[
//   The circumfrence of a circle is the total distance around it's edge. Archamedes started with a 6 sided hexagon inscribed in a circle, and then added more and more sides to get closer and closer to pi:

//   - *Distance formula*: $d = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2)$
//   - *Formula for point P that lies on the circle*: $(r cos(a), r sin(a))$, where $a$ is the angle of the point relative to the origin, and $r$ is the radius of the circle.
//   The circumfrence of a circle of radius $1$ is $2pi$, and the circumfrence is the total distance on the edge of the circle, if we draw smaller equi-distant lines on the edge of the circle, and sum all of them up, we can get closer and closer to pi the more sides we add.

//   Here are the visuals:

//   #grid(
//     columns: (1fr, 1fr, 1fr),
//     gutter: 1em,
//     grid.cell()[
//       #figure(caption: "n = 6")[
//         #image("/assets/6-sided-hexagon-circle-inscribed.png")
//       ]
//     ],

//     grid.cell()[
//       #figure(caption: "n = 12")[
//         #image("/assets/12-sided-hexagon-circle-inscribed.png")
//       ]
//     ],

//     grid.cell()[
//       #figure(caption: "n = 500")[
//         #image("/assets/500-sided-hexagon-circle-inscribed.png")
//       ]
//     ],
//   )
// ]

