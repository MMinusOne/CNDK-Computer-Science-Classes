== CPU <CPU>

#grid(
  columns: 2,
  grid.cell(align: left)[
    - The CPU (#strong()[C]entral-#strong()[P]rocessing-#strong()[U]nit) is the square component we saw in class inside the computer.

    - It consists of many smaller units that handle different things, but in the explanation we will take, it will only contain an #ref(<ALU>, supplement: "ALU") and a #ref(<CU>, supplement: "CU"), both of their explanations will be simplified.

    - It's essentially the brain of the computer, handling all the computation (we can call them tasks) that happen on the computer.
  ],

  grid.cell()[#pad(x: 1cm)[
      #figure(caption: "A physical CPU")[
        #image("../../images/cpu.png", width: 3cm)]],
  ],
)

=== ALU <ALU>
- The ALU (#strong()[A]rithmetic-#strong()[L]ogic-#strong()[U]nit) is a component/unit of the #ref(<CPU>, supplement: "CPU")

- It handles all the arithmetic (addition, subtraction, division, multiplication, etc...)

- All the operations that happen inside the ALU are in base-2




=== CU <CU>

- The CU (#strong()[C]ontrol-#strong()[U]nit) is a component/unit of the #ref(<CPU>, supplement: "CPU")

- It will manage and execute instructions.

- For now, we will think of instructions as operations needed to perform certain actions on the computer (adding two numbers, opening an app, etc...)

=== CPU Characteristics

- A CPU has a clock speed: the speed of which instructions will execute, and it is a frequency.

- $1"GHz" = 1 * 10^(9) "Hz"$
