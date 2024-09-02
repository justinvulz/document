#import "../typst_packages/drawimg.typ": *

#show: doc => conf(doc)

#figure(
  // caption: [Simplified Graph of $Q_n$],
  gap: 1em,
  grid(
    columns: 3,
    align: center+horizon,
    gutter: 1em,
    diagram(
      spacing: (6em,3em),
      node-stroke: aqua,
      node-inset: 0.3em,
      {
      node((0,0),$V_0(0)$)
      node((0,1),$V_1(0)$)
      edge((0,0),(0,1),$binom(n-1,0)$)
      node((1,0),$V_0(1)$)
      node((1,1),$V_1(1)$)
      edge((1,0),(1,1),$binom(n-1,1)$)

      edge((0,0),(1,0),$binom(n-1,0)binom(n-1-0,1)$)
      edge((0,1),(1,1))

      node((2,0),$V_0(2)$)
      node((2,1),$V_1(2)$)
      edge((2,0),(2,1),$binom(n-1,2)$)  

      edge((1,0),(2,0),$binom(n-1,1)binom(n-1-1,1)$)
      edge((1,1),(2,1))
      }
    ),
    $dots$,
    diagram(
      spacing: (8em,3em),
      node-stroke: aqua,
      node-inset: 0.3em,
      {
      node((0,0),$V_0(n-2)$)
      node((0,1),$V_1(n-2)$)
      edge((0,0),(0,1),$binom(n-1,n-2)$)
      edge((0,0),(1,0),$binom(n-1,n-2)binom(n-1-(n-2),1)$)
      edge((0,1),(1,1))
      node((1,0),$V_0(n-1)$)
      node((1,1),$V_1(n-1)$)
      edge((1,0),(1,1),$binom(n-1,n-1)$)
      }
    )
  )
)