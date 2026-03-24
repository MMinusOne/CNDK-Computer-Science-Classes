#let primary_color = rgb("#1e40af")
#let secondary_color = rgb("#0284c7")
#let dark_color = rgb("#1F2937")
#let solution_color = rgb("#d97706")
#let light_color = rgb("#F3F4F6")
#let block_bg_color = rgb("#EFF6FF")

#let tableStripes = (x, y, heading_color: primary_color.opacify(-20%), color_one: light_color, color_two: white) => if (
  y == 0
) {
  heading_color
} else if calc.odd(y) {
  color_one
} else if calc.even(y) { color_two }

#let code-block(body, lang: str, height: auto) = {
  block(
    fill: rgb("#1F2937"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    height: height,
  )[
    #align(start)[
      #text(fill: white, font: "Courier New")[
        #raw(body, lang: lang, block: true)
      ]
    ]
  ]
}

#let exercise(title: "", it) = {
  box(
    inset: 15pt,
    fill: primary_color.opacify(-80%),
    stroke: (
      left: 3pt + primary_color.opacify(-20%),
      right: 1pt + primary_color.opacify(-20%),
      bottom: 1pt + primary_color.opacify(-20%),
      top: 1pt + primary_color.opacify(-20%),
    ),
    width: 100%,
  )[
    #text(
      size: 11pt,
      fill: primary_color.opacify(-20%),
      font: "Arial",
      tracking: 0.5pt,
      weight: "bold",
      upper("exercise: " + title),
    )

    #text(primary_color.darken(50%), font: "Arial")[#it]
  ]
}

#let solution(it) = {
  box(
    inset: 15pt,
    fill: solution_color.opacify(-80%),
    stroke: (
      left: 3pt + solution_color.opacify(-20%),
      right: 1pt + solution_color.opacify(-20%),
      bottom: 1pt + solution_color.opacify(-20%),
      top: 1pt + solution_color.opacify(-20%),
    ),
    width: 100%,
  )[
    #text(
      size: 11pt,
      fill: solution_color.opacify(-20%),
      font: "Arial",
      tracking: 0.5pt,
      weight: "bold",
      upper("solution: "),
    )

    #text(solution_color.darken(50%), font: "Arial")[#it]
  ]
}

