#import "../typst_packages\poster.typ": *
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
#import "@preview/cetz:0.2.2"

#show: doc => conf(
  "Critical Groups of n-cube Graphs",
  "Po-Hsuan, Chen",
  advisor:"test",
  logo: "../pic/REU/logo.png",
  doc
)


= Abstract 
The critical group, also known as the sandpile group or Jacobian group, is a finite abelian group that reflects the combinatorial and algebraic properties of a graph. This project focuses on the critical group of the $n$-cube graph $Q_n$ 
, a structure central to both theoretical and applied graph theory.

= Background
We want to find the firing script of the divisor $[N,-N,0,dots, 0]$ of the $n$-cube graph $Q_n$.

= Simplified Graphs
The $n$-cube graph $Q_n$ is a graph with $2^n$ vertices, thus the original graph is too large to compute.
For this question, we found that the $n$-cube graph $Q_n$ can be simplified to a graph with $2n$ vertices.

Define the simplified graph $Q_n'$ as follows:
- Define $V_1(x)$ is a set of vertices which first bit is $1$, and the remaining $n-1$ bits have $x$ ones.
- Define $V_0(x)$ is a set of vertices which first bit is $0$, and the remaining $n-1$ bits have $x$ ones.

#set text(size: 26pt)
#figure(
  caption: [Simplified Graph of $Q_n$],
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
      node((0,1),$V_0(1)$)
      edge((0,0),(0,1),$binom(n-1,0)$)
      node((1,0),$V_0(1)$)
      node((1,1),$V_1(1)$)
      edge((1,0),(1,1),$binom(n-1,1)$)

      edge((0,0),(1,0),$binom(n-1,0)binom(n-1-0,1)$)
      edge((0,1),(1,1))

      node((2,0),$V_1(2)$)
      node((2,1),$V_0(2)$)
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
#set text(size: 30pt)
The number next to the line is the number of multiple edges between two vertices.
In general, a parte of simplified graph of $Q_n$ can be represented as follows:
#figure(
  caption: [A part fo simplified Graph of $Q_n$],
  align(center)[
  #diagram(
    spacing: (6em,5em),
    node-stroke: aqua,
    node-inset: 0.3em,
    {
    edge((-1,0),(0,0))
    edge((-1,1),(0,1))
    edge((1,0),(2,0))
    edge((1,1),(2,1))
    node((0,0),$V_0(x)$)
    node((0,1),$V_1(x)$)
    edge((0,0),(0,1),$binom(n-1,x)$)
    edge((0,0),(1,0),$binom(n-1,x)binom(n-1-x,1)$)
    edge((0,1),(1,1),$binom(n-1,x)binom(n-1-x,1)$)
    node((1,0),$V_0(x+1)$)
    node((1,1),$V_1(x+1)$)
    edge((1,0),(1,1),$binom(n-1,x+1)$)
    }
  )
  ]
)

= Firing Script
By use the simplified graph and computer program, we can find the firing script of the divisor $[N,-N,0,dots, 0]$ of the $n$-cube graph $Q_n$.




= heding1
#lorem(300)

= heding2
#lorem(500)