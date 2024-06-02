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

#show math.equation.where(block: true): e => [
		// #set block(fill: lime)
  	#block(width: 100%, inset: 0.3em)[
      #set align(center)
			#set par(leading: 1em)
      #e
	
		]
	]

= A
#lorem(240)
$
  x = y
$
#lorem(400)
#show math.equation: e =>[
  #e
]
#import "@preview/xarrow:0.3.0": xarrow, xarrowSquiggly, xarrowTwoHead

$
  a xarrow(sym: <--, QQ\, 1 + 1^4) b \
  c xarrowSquiggly("very long boi") d \
  c / ( a xarrowTwoHead("NP" limits(sum)^*) b times 4)
$