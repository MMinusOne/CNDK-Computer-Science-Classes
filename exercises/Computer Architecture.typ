#import "../templates.typ": *

#exercise(title: "Questions About the CPU")[
  1. What two units we considered, exist inside the CPU? \
  2. What does "CPU" stand for? \
  3. What is it's function? \
  4. If a CPU has a clock speed of $2.4"GHz"$, calculate how many nanoseconds one clock cycle takes (Hint: $1"s" = 10^9"ns"$).
  \
  5. What is the function of the "ALU"? \
  6. What does ALU stand for? \
  7. Where is the ALU located? \
  8. What number system does the ALU understand? \
  \
  9. What is the function of the "CU"? \
  10. Where is the CU located? \
  11. What does CU stand for? \
]

#solution()[
  1. We considered the ALU and the CU.
  2. CPU stands for #strong()[C]entral #strong()[P]rocessing #strong()[U]nit.
  3. It's essentially the brain of the computer, handling all the computation.
  4. \ We have $1"GHz" = 10^9"Hz"$: \
    therefore $2.4"GHz" = 2.4 * 10^9"Hz"$\
    Then we consider $T = 1/f$ \
    So we get $T_c = 1/(2.4*10^9) "seconds"$, so now we have the time for one cycke $T_c$ in seconds. \
    Converting to nano seconds: $ T_c = 1/(2.4*10^9) "s" =
    1/(2.4*10^9) * 10&^9 "ns" =
    1/2.4 "ns" approx 0.417"ns" $
    \
    5. It handles all the arithmetic (addition, subtraction, division, multiplication.
    6. ALU stands for #strong()[A]rithmetic-#strong()[L]ogic-#strong()[U]nit.
    7. The ALU is located in the CPU.
    8. The number system used by the ALU is: base-2.
    \
    9. The CU manages and executes instructions.
    10. The CU is located in the CPU.
    11. CU stands for #strong()[C]ontrol-#strong()[U]nit.
]

#v(1cm)

#exercise(title: "Number Systems")[
  1. Compare base-2 and base-10.
  2. $(10011)_2 = (x)_10$, find x.
  2. $(11011011011)_2 = (x)_10$, find x.
  3. Convert $(1502)_10$, to base-2.
  5. Convert $(1103)_10$ to base-2, and state how many bits are required to store the number.
]

#solution()[
  1. Base-2 is a number system made up of two digits 0 and 1, in contrast base-10 is made up from the 10 digits (0, 1, 2, 3, 4, 5, 6, 7, 8, 9).
  2. We map each of the digits to it's index, and choose the $1$'s only, then calculate the sum using the method. \
    $2^0 + 2^1 + 2^4 = 19$
  3. $2^0 + 2^1 + 2^3 + 2^4 + 2^6 + 2^7 + 2^9 + 2^10 = 1755$
  4. $(1502)_10 = (10111011110)_2$
  5. $(1103)_2 = (10001001111)_10$, and since the base-2 version has 11 bits, it will require 11 bits to store.
]

#v(1cm)

#exercise(title: "CPU - Questions From The Text")[]

#solution()[]

#v(1cm)

#exercise(title: "ALU - Questions From The Text")[]

#solution()[]

#v(1cm)

#exercise(title: "CU - Questions From The Text")[]

#solution()[]

#v(1cm)

#exercise(title: "Memory - Questions From The Text")[]

#solution()[]
