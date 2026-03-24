#import "../../templates.typ": *

== Memory

#block(
  fill: light,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  #text(fill: dark)[
    Memory in the context of a computer system is the place where "data" will be stored. Data can be for example: images, text, files, #ref(<Variables>, supplement: "Variables"), etc...
  ]
]

#v(0.5em)

We will discuss:
- Two types of memory: Primary Memory and Secondary Memory
- Data units: bit, byte, KB, MB, GB
\ \ \
#table(
  columns: (1fr, 1fr),
  inset: 10pt,
  fill: (x, y) => tableStripes(x, y),
  stroke: 1pt + secondary,
  align: (left, left),

  [#text(fill: white, weight: "bold")[Primary Memory]], [#text(fill: white, weight: "bold")[Secondary Memory]],

  [Fast access speed], [Slower access speed],
  [Volatile (data lost on restart)], [Non-volatile (data persists)],
  [Example: #strong[RAM]], [Example: #strong[HDD, SSD]],
  [Used for active tasks], [Used for long-term storage],
)

=== RAM <RAM>


#grid(
  columns: 2,
  grid.cell(align: left)[
    - RAM (#strong()[R]andom-#strong()[A]ccess-#strong()[M]emory) is the a type of memory. It's the green sticks I've shown you in class.
    - RAM is primary memory.
  ],
  grid.cell()[#pad(x: 1cm)[
      #figure(caption: "A physical stick of RAM")[
        #image("../../images/ram.png", width: 5cm)]],
  ],
)

=== HDD

#grid(
  columns: 2,
  grid.cell()[
    - HDD (Hard-Disk-Drive) is a type of memory. It's the metal square Ive shown you in class.

    - HDD is secondary-memory.
  ],
  grid.cell()[#pad(x: 1cm)[
      #figure(caption: "An HDD")[
        #image("../../images/hdd.jpg", height: 3cm)]
    ]
  ],
)
