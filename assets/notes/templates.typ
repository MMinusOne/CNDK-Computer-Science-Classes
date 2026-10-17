// Set to false for the original blue/yellow screen styling.
#let print_mode = true

#let primary_color = rgb("#1e40af")
#let secondary_color = rgb("#0284c7")
#let dark_color = rgb("#1F2937")
#let solution_color = rgb("#d97706")
#let light_color = rgb("#F3F4F6")
#let block_bg_color = rgb("#EFF6FF")

#let tableStripes = (
  x,
  y,
  heading_color: if print_mode { luma(70) } else { primary_color.opacify(-20%) },
  color_one: light_color,
  color_two: white,
) => if (
  y == 0
) {
  heading_color
} else if calc.odd(y) {
  color_one
} else if calc.even(y) { color_two }

#let code-block(body, lang: str, height: auto) = {
  block(
    fill: if print_mode { luma(246) } else { rgb("#1F2937") },
    stroke: if print_mode { 0.5pt + luma(150) } else { none },
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    height: height,
  )[
    #align(start)[
      #text(fill: if print_mode { black } else { white }, font: "Courier New")[
        #raw(body, lang: lang, block: true)
      ]
    ]
  ]
}

#let exercise(title: "", it) = {
  let accent = if print_mode { luma(30) } else { primary_color.opacify(-20%) }
  let frame = if print_mode { 0.75pt + luma(110) } else { 1pt + primary_color.opacify(-20%) }
  let bg = if print_mode { white } else { primary_color.opacify(-80%) }
  let body_color = if print_mode { black } else { primary_color.darken(50%) }

  block(
    inset: 10pt,
    fill: bg,
    stroke: (left: 3pt + accent, rest: frame),
    width: 100%,
    breakable: true,
    above: 0.9em,
    below: 0.9em,
  )[
    #set list(spacing: 0.55em)
    #set enum(spacing: 0.55em)
    #set figure(gap: 0.4em)
    #show figure: set block(spacing: 0.6em)

    #text(
      size: 11pt,
      fill: accent,
      font: "Arial",
      tracking: 0.5pt,
      weight: "bold",
      upper("exercise: " + title),
    )

    #text(fill: body_color, font: "Arial")[#it]
  ]
}

#let solution(it) = {
  let accent = if print_mode { luma(110) } else { solution_color.opacify(-20%) }
  let frame = if print_mode {
    (paint: luma(90), thickness: 0.75pt, dash: "dashed")
  } else {
    1pt + solution_color.opacify(-20%)
  }
  let bg = if print_mode { luma(240) } else { solution_color.opacify(-80%) }
  let body_color = if print_mode { black } else { solution_color.darken(50%) }

  block(
    inset: 10pt,
    fill: bg,
    stroke: (left: 3pt + accent, rest: frame),
    width: 100%,
    breakable: true,
    above: 0.9em,
    below: 0.9em,
  )[
    #set list(spacing: 0.55em)
    #set enum(spacing: 0.55em)
    #set figure(gap: 0.4em)
    #show figure: set block(spacing: 0.6em)

    #text(
      size: 11pt,
      fill: if print_mode { luma(60) } else { solution_color.opacify(-20%) },
      font: "Arial",
      tracking: 0.5pt,
      weight: "bold",
      upper("solution: "),
    )

    #text(fill: body_color, font: "Arial")[#it]
  ]
}

#let text-block(it) = {
  block(
    fill: if print_mode { luma(244) } else { secondary_color.lighten(80%) },
    stroke: if print_mode { (left: 3pt + luma(90)) } else { none },
    inset: 12pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(size: 12pt, fill: dark_color, weight: "bold", it)
  ]
}
