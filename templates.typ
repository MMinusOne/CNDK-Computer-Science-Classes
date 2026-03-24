#let primary = rgb("#1E3A8A")
#let secondary = rgb("#3B82F6")
#let dark = rgb("#1F2937")
#let light = rgb("#F3F4F6")
#let block-bg = rgb("#EFF6FF")

#let tableStripes = (x, y, heading_color: primary.opacify(-20%), color_one: light, color_two: white) => if y == 0 {
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
