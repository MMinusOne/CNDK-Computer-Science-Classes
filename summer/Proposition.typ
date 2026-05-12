#set page(margin: 0.5in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)

#align(center)[
  #text(size: 22pt, weight: "bold")[
    Activity Options for the Robotics Summer Camp
  ]
  #v(0.5em)
  #line(length: 100%, stroke: 0.5pt)
]

#v(1em)

#let course_section(title, budget, target, description, has_image: false, content) = {
  block(
    width: 100%,
    inset: (left: 0pt, right: 0pt, top: 0.8em, bottom: 1.2em),
    breakable: true,
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("#1a5490"))[#title]
    #v(0.5em)

    #grid(
      columns: if has_image { (60%, 38%) } else { (100%,) },
      column-gutter: 2%,
      [
        #set par(leading: 0.55em)

        #text(weight: "semibold")[Budget:] #budget

        #text(weight: "semibold")[Target Audience:] #target

        #v(0.4em)
        #text(weight: "semibold")[Course Overview:]
        #description
      ],
      if has_image {
        align(center + horizon)[
          #rect(
            width: 100%,
            height: 140pt,
            stroke: 1pt + gray,
            fill: rgb("#f5f5f5"),
            radius: 4pt,
          )[
            #align(center + horizon)[
              #text(fill: gray, size: 9pt, style: "italic")[
                #content
              ]
            ]
          ]
        ]
      }
    )
  ]
}

#course_section(
  [Lego Robotics],
  [\$75 per 4 students],
  [Grades 4–7],
  [
    - Build robots using Wedo 2.0 kits-versatile, education-focused robotics sets designed for hands-on learning
    - Learn fundamental Scratch programming concepts through interactive projects
    - Work collaboratively in small groups; individual laptops not required
  ],
  has_image: true,
  image("wedo.webp"),
)

#course_section(
  [Arduino Robotics],
  [\$15 per student],
  [Grades 7–12],
  [
    - Master Arduino microcontroller programming and circuit design
    - Develop practical Python skills for embedded systems
    - Create custom robotic projects from concept to completion
    - *Requires:* Each student must bring their own laptop
  ],
  has_image: true,
  image("arduino.webp"),
)

#course_section(
  [General Programming & Computer Science],
  [\$0 per student],
  [Grades 7–12],
  [
    - An introduction to diverse programming domains: web development, embedded systems, algorithms, networking, and more
    - Building personal projects demonstrating learned concepts
    - *Requires:* Each student must bring their own laptop
  ],
  image("wedo.webp"),
)

#course_section(
  [AI and Video Game Programming],
  [\$0 per student],
  [Grades 9–12],
  [
    - Learn Python programming with a focus on game development and machine learning integration
    - Design and build an interactive game that integrates ML algorithms
    - Understand practical AI applications in entertainment technology
    - *Requires:* Each student must bring their own laptop
  ],
  image("wedo.webp"),
)

#v(1em)
#align(center)[
  #text(size: 9pt, style: "italic", fill: gray)[
    *Note:* All budgets include material costs only.
  ]
]
