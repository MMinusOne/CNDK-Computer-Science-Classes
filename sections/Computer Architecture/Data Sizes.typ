#import "../../templates.typ": *

== Converting data sizes (Decimal System - SI)

#table(
  columns: (auto, 1fr),
  fill: (x, y) => tableStripes(x, y),
  inset: 10pt,
  stroke: 1pt + secondary,
  align: (center, left),

  [#text(fill: white, weight: "bold")[Unit]], [#text(fill: white, weight: "bold")[Conversion]],

  [Bit], [Smallest data unit],
  [Byte], [1 byte = 8 bits],
  [Kilobyte (KB)], [1 KB = 1,000 bytes],
  [Megabyte (MB)], [1 MB = 1,000 KB],
  [Gigabyte (GB)], [1 GB = 1,000 MB],
)
