// #show math.equation.where(block: true): e => [
// 		// #set block(fill: lime)
//   	#block(width: 100%, inset: 0.3em)[
//       #set align(center)
// 			#set par(leading: 1em)
//       #e
//   	]
// 	]

#show math.equation: set block(spacing: 0em)
// #show figure: set block(spacing: 0em)
#show par: set block(spacing: 0em)


#set page(
  paper: "a4",
  number-align: center,
  numbering: "1",
  // footer: rect(width: 100%, height: 100%,fill: silver),		
)

= A
#lorem(240)
$
  x = y
$
#lorem(400)