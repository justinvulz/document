#import "@preview/polylux:0.3.1": *
#import "@preview/ctheorems:1.1.2": *
#import "/typst_packages/lecture.typ": *
#import "@preview/pinit:0.1.4": *
#import "@preview/cuti:0.2.1": show-fakebold, regex-fakeitalic
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
#import "@preview/cetz:0.2.2"

#import themes.university: *
#show :show-fakebold


#let uncv = uncover
#set list(marker: listal)
#set text(font: ("Times New Roman","DFKai-SB"))
#show: thmrules
#show math.equation: set text(weight: "extralight")

#show math.equation.where(block: true): e => [
	// #set block(fill: lime)
	#block(width: 100%, inset: 0.3em)[
    #set align(center)
		#set par(leading: 0.65em)
    #e

	]
]
#let pinit-highlight = pinit-highlight.with(dy: -0.7em)

#let pinit-highlight-equation-from(height: 2em, pos: bottom, fill: rgb(0, 180, 255), highlight-pins, point-pin, body) = {
  pinit-highlight(..highlight-pins, dy: -0.6em, fill: rgb(..fill.components().slice(0, -1), 40))
  pinit-point-from(
    fill: fill, pin-dx: -0.6em, pin-dy: if pos == bottom { 0.8em } else { -0.6em }, body-dx: 0pt, body-dy: if pos == bottom { -1.7em } else { -1.6em }, offset-dx: -0.6em, offset-dy: if pos == bottom { 0.8em + height } else { -0.6em - height },
    point-pin,
    rect(
      inset: 0.5em,
      stroke: (bottom: 0.12em + fill),
      {
        set text(fill: fill)
        body
      }
    )
  )
}

#let new-section-slide(title,subtitle: none) = slide([
  #set align(horizon)
  #block(width: 100%,height: 100%)[
    #text(title,size:35pt)
    #rect(width: 100%, height: 0.1em, fill: rgb("405577"))
    #align(right)[
      #text(subtitle,size:25pt)
    ]
  ]
])

#show: university-theme.with(
  color-a :rgb("405577"),
  color-b :rgb("122264"),
  color-c :rgb("C2EBD9"),
)


#title-slide(
  authors: "陽明交通大學應數系營隊",
  title: "抽象代數",
  subtitle: "群論",
  institution-name: " ",
)

#slide(title: "群論")[
  #set align(horizon)
  #block(width: 100%,height: 100%)[
    群(Group)是一個集合，並且配上一個良好的二元運算，而群論(Group Throry)是一們研究群這種結構的數學分支。群論在許多領域上有著廣泛的應用，以下介紹一些應用。
  ]
]
#slide(title: "群論的應用")[
  倍立方、化圓為方、三等分角等，尺規作圖問題。
  #grid(
    columns: (auto, auto, auto),
    rows: (3fr,2fr,5fr),
    align: horizon+center,
    grid.cell(rowspan:2,image("pic/doublecube.png")),[],
    grid.cell(rowspan:2,image("pic/angle_trisection.jpg")),
    grid.cell(rowspan:2,image("pic/squaring_circle.png"))
  )
]
#slide(title: "群論的應用")[
  我們都知道一元二次方程 $a x^2 + b x + c =0$ 的解為
  $
    x = (-b plus.minus sqrt(b^2 - 4 a c))/(2 a)
  $
  但是對於一元五次方程 $x^5 + a x^4 + b x^3 + c x^2 + d x + e = 0$，可以用群論證明，我們無法用根式解析解來表示。

]
#slide(title: "群論的應用")[
  #grid(
    gutter: 0.65em,
    columns: (auto, 1fr),
    rows: (auto, 1fr,1fr),
    align: horizon,
    grid.cell([
      除了數學上的應用外，在其他領域也有著廣泛的應用，例如
    ],colspan: 2),
    grid.cell([
      - 密碼學 (RSA加密算法)
      - 標準粒子模型中的對稱性]),
    grid.cell([#pause#image("pic/standard_model.png")],rowspan: 2)
  )
]

#new-section-slide("群",subtitle:"Group")
#let slide = slide.with(title: "群")
#slide(title: "群",new-section: "Group")[
  #set text(size: 19pt)
  #definition(number:"1.1")[
    $angle.l G , * angle.r$是一個集合 $G$ 與一個二元運算 $* : G times G |-> G$，滿足以下條件：
    #set enum(numbering: al(n => [$cal(G)_#n$:]))
    + 對於所有的$a,b,c in G$， $ (a*b)*c = a*(b*c) quad textb("結合律") $ 

    + 存在一個元素 $e in G$，使得對於所有的 $a in G$， $ a*e = e*a = a quad textb("單位元素") $

    + 對於每一個 $a in G$，存在一個元素 $a^(-1) in G$，使得 $ a*a^(-1) = a^(-1)*a = e quad textb("反元素") $
  ]
]
#slide[
  #set table(stroke: (x,y) =>(
    bottom: if y==0  {1pt},
    right: if x==0 {1pt},
  ))
  #set text(size: 24pt)
  Example:
  - 整數集合 $ZZ$ 與加法運算 $+$ 構成一個群。 $angle.l ZZ,+ angle.r$\
    單位元素為 $0$，反元素為 $-a$。
  - 整數集合 $ZZ$ 與乘法運算 $*$ 不是一個群。\
    乘法在整數裡沒有反元素。
  - $angle.l QQ, + angle.r$,$angle.l RR, + angle.r$ 是群。
  - $C_3 = {e,a,b}$ 與下面的運算是一個群。 #table(
    columns: (2em,2em,2em,2em),
    rows: auto,
    align: center,
    $cir$, $e$, $a$, $b$,
    $e$, $e$, $a$, $b$,
    $a$, $a$, $b$, $e$,
    $b$, $b$, $e$, $a$
  
  ) 
  
]
#slide[
  #set text(size: 19pt)
  #definition(number:"1.2")[
    讓$G$是一個群，定義$abs(G)$是$G$的元素個數，稱為$G$的*order*。
  ]
  #definition(number:"1.3")[
    一個群$G$如果滿足交換率i.e. 對於所有的$a,b in G$，$ a*b = b*a $，則稱$G$是一個*交換群*(Abelian groups)。
  ]
  // #set text(size: 25pt)
  #pause
  Example:
  - 整數集合 $ZZ$ 與加法運算 $+$ 是一個交換群。
  - $C_3$ 的 order 為 $3$。
  - 可逆矩陣的集合與矩陣乘法是一個群，但不是交換群。
]
#let slide = slide.with(title: "群的基礎性質")
#slide(new-section: "Properties of Groups")[
  #set text(size: 19pt)
  #theorem(number:"1.4")[
    如果$G$是一個群，那*消去率*成立，即對於所有的$a,b,c in G$，
    $ a*b = a*c => b = c \
       b*a = c*a => b = c $
  ]
  #pause
  #proof[
    讓$G$是一個群，$a,b,c in G$。假設$a*b = a*c$。
    #uncv("3-")[
      因為$a in G$，所以$a$的反元素$a^(-1)$存在，且$a*a^(-1) = a^(-1)*a = e$。
    ]
    $
      &a*b = a*c \
      #uncv("3-")[
        $=> &#pin(1)a^(-1)*a#pin(2)*b = #pin(3)a^(-1)*a#pin(4)*c \ $
      ]
      #uncv("5-")[
        $=> &e*b = e*a\ $
      ]
      #uncv("2-")[
        $=> &b = a$
      ] 
    $
  ]
  #uncv("4-")[
    #pinit-highlight(1,2)
    #pinit-highlight(3,4)
  ]
  
]
#slide(new-section: "Properties of Groups")[
  #set text(size: 19pt)
  #theorem(number: "1.5")[
    群$G$的單位元素$e$唯一。
  ]
  #pause
  #proof[
    假設存在第二個單位元素$e_2$，滿足對於所有$a in G$
    $ e_2*a = a*e_2 = a $
    因為$e in G$，所以
    #only(2)[
      $ e_2 * a = a $
    ]
    #only("3-")[ 
      $ #pin(1)e_2 * e#pin(2) = e $
    ]
    #uncv("4-")[
      #pinit-highlight-equation-from((1,2),2)[$= e_2$]
    ]
    #uncv("5-")[
      我們得到$e_2 = e$
    ]
  ]
  
]
#slide[
  #set text(size: 19pt)
  #theorem(number:"1.6")[
    讓$G$是一個群，$a b in G$，那麼
    $
      (a b)^(-1) = b^(-1) a^(-1)
    $
  ]
  #only("1")[我們有時候會省略運算符號，寫成$a b$代表$a*b$。]
  #only("2-")[
    #proof[
      我們直接相乘
      $
          (a b)b^(-1) a^(-1) &= a (b b^(-1)) a^(-1) \
                            &= a e a^(-1)\
                          &= a a^(-1)\
                          &= e
      $
      根據反元素的定義，$(a b)^(-1) = b^(-1) a^(-1)$
    ]
    我們只證明了$(a b)^(-1)b^(-1) a^(-1) =e$，但是$b^(-1) a^(-1)(a b)^(-1) =e$也是成立的。
  ]
]
#let slide = slide.with(title: none)
#new-section-slide("置換群",subtitle:"Permutation Group")
#slide(title:"置換")[
  $
    A = {1,2,3,4,5}\
    #uncv("2-")[
      $ 
        arrow.b  sigma textr("排列")\
        A = {3,1,5,2,4}
      $
    ]
  $
  #pause
  #pause
  #figure(
    $
      1 -> 3\
      2 -> 4\
      3 -> 5\
      4 -> 2\
      5 -> 1
    $,
    caption: [$sigma$],
  ) <fig1>
]

#slide(title:"置換")[
  #set text(size: 19pt)
  #definition(number:"2.1")[
    一個$A$的是*置換*是一個一一對應的函數 $phi : A -> A$。 (one-one and onto)
  ]
  #set text(size: 25pt)
  #grid(
    columns: (1fr,1fr),
    rows: (auto),
    align: center,
    [#figure(
      $
        1 -> 3\
        2 -> 4\
        3 -> 5\
        4 -> 2\
        5 -> 1
      $,
      caption: [一個置換 $sigma$], 
    ) <fig1>],
    [#figure(
      $
        1 -> 2\
        2 -> 3\
        3 -> 2\
        4 -> 5\
        5 -> 1\
      $,
      caption: "不是置換",
    )<fig2>]
  )
]
#slide(title:"置換的合成")[
  #set text(size: 19pt)
  #definition(number:none)[
    讓$sigma$和$tau$是兩個置換，定義$sigma$和$tau$的*合成*是一個新的置換$sigma cir tau$，使得對於所有的$a in A$，
    $ (sigma cir tau)(a) = sigma(tau(a)) $
  ]
  #pause
  #set text(size: 25pt)
  $ 
  (sigma cir tau)(x) = sigma(tau(x)) \
  A -->^tau A -->^sigma A
  $
  因為$sigma$和$tau$都是一一對應的函數，所以$sigma cir tau$也是一一對應的函數。\
  所以 $sigma cir tau$ 是一個置換。
]
#let msigma = $mat(
    1, 2, 3, 4, 5;
    3, 4, 5, 2, 1
  )$
#let mtau = $mat(
    1, 2, 3, 4, 5;
    2, 3, 4, 5, 1
  )$
#slide(title:"Eaxmple 置換")[
  #grid(
    columns: (1fr,1fr),
    rows: (auto),
    align: center,
    $ sigma = msigma $,
    $ tau = mtau $
  )
  #pause
  #v(-0.5em)
  $
    sigma cir tau 
    = msigma cir mtau 
    = mat(
      1, 2, 3, 4, 5;
      4, 5, 2, 1, 3
    )
  $
  #pause
  #align(center)[
    #diagram(spacing: (5em,0.3em),{
      let nd(x) = ((x,0), (x,1), (x,2), (x,3), (x,4))
      for x in range(3){
        for y in range(5){
          node((x,y), [#(y+1)])
        }
      }
      node((0.5,0),[#show math.equation: set text(fill: teal);$tau$])
      node((1.5,0),[#show math.equation: set text(fill: red);$sigma$])
      node(enclose:nd(0)+nd(1),stroke: teal)
      node(enclose:nd(1)+nd(2),stroke: red)
      let edgearr = (
        ((0,0),(1,1)),
        ((0,1),(1,2)),
        ((0,2),(1,3)),
        ((0,3),(1,4)),
        ((0,4),(1,0)),

        ((1,0),(2,2)),
        ((1,1),(2,3)),
        ((1,2),(2,4)),
        ((1,3),(2,1)),
        ((1,4),(2,0))
      )
      for e in edgearr{
        edge(e.at(0),e.at(1),"->")
      }
    })
  ]
]
#slide(title: "循環表示法(Cycle)")[
  $ sigma = mat(1, 2, 3, 4, 5; 3, 4, 5, 2, 1) $
  #pause
  #v(1em)
  #only(2)[
    #grid(
      columns: (1fr,1fr),
      rows: (auto),
      align: center,
      diagram(
        {
          // traingle
          let (p1,p3,p5) = ((0,0),(1,0),(0.5,0.866))
          node(p1,[*1*])
          node(p3,[*3*])
          edge(p1,p3,"->",bend: 55deg)

        }
      ),
      diagram(
        {
          // traingle
          let (p2,p4) = ((0,0),(1,0))
          node(p2,[*2*])
          node(p4,[*4*])
          edge(p2,p4,"->",bend: 55deg)
        }
      )
    )
  ]
  #only(3)[
    #grid(
      columns: (1fr,1fr),
      rows: (auto),
      align: center,
      diagram(
        {
          // traingle
          let (p1,p3,p5) = ((0,0),(1,0),(0.5,0.866))
          node(p1,[*1*])
          node(p3,[*3*])
          node(p5,[*5*])
          edge(p1,p3,"->",bend: 55deg)
          edge(p3,p5,"->",bend: 55deg)
        }
      ),
      diagram(
        {
          // traingle
          let (p2,p4) = ((0,0),(1,0))
          node(p2,[*2*])
          node(p4,[*4*])
          edge(p2,p4,"->",bend: 55deg)
          edge(p4,p2,"->",bend: 55deg)
        }
      )
    )
  ]
  #only("4-")[
    #grid(
      columns: (1fr,1fr),
      rows: (auto),
      align: center,
      diagram(
        {
          // traingle
          let (p1,p3,p5) = ((0,0),(1,0),(0.5,0.866))
          node(p1,[*1*])
          node(p3,[*3*])
          node(p5,[*5*])
          edge(p1,p3,"->",bend: 55deg)
          edge(p3,p5,"->",bend: 55deg)
          edge(p5,p1,"->",bend: 55deg) 
        }
      ),
      diagram(
        {
          // traingle
          let (p2,p4) = ((0,0),(1,0))
          node(p2,[*2*])
          node(p4,[*4*])
          edge(p2,p4,"->",bend: 55deg)
          edge(p4,p2,"->",bend: 55deg)
        }
      )
    )
  ]
  #uncv("5-")[
    $
      sigma = (1,3,5)(2,4)
    $
  ]
]
#slide(title: "循環表示法(Cycle)")[
  $ sigma = mat(1, 2, 3, 4, 5; 3, 4, 5, 2, 1)  =  (1,3,5)(2,4) = (3,5,1)(4,2) $
  $ tau = mat(1,2,3,4,5;2,3,4,5,1) = (1,2,3,4,5) = (3,4,5,1,2) $
  $ phi = mat(1,2,3,4,5;1,2,4,5,3)= (3,4,5)(1)(2) = (3,4,5) $
]

#slide(title: "循環表示法(Cycle)")[
  $ sigma = (1,3,5)(2,4) $
  #only("2")[#grid(
    columns: (1fr,1fr),
    rows: (auto),
    align: center,
    diagram(
      {
        // traingle
        let (p1,p3,p5) = ((0,0),(1,0),(0.5,0.866))
        node(p1,[*1*])
        node(p3,[*3*])
        node(p5,[*5*])
        edge(p1,p3,"->",bend: 55deg)
        edge(p3,p5,"->",bend: 55deg)
        edge(p5,p1,"->",bend: 55deg) 
      }
    ),
    diagram(
      {
        // traingle
        let (p2,p4) = ((0,0),(1,0))
        node(p2,[*2*])
        node(p4,[*4*])
        edge(p2,p4,"->",bend: 55deg)
        edge(p4,p2,"->",bend: 55deg)
      }
    )
  )]
  #only("3-")[#grid(
    columns: (1fr,1fr),
    rows: (auto),
    align: center,
    diagram(
      {
        // traingle
        let (p1,p3,p5) = ((0,0),(1,0),(0.5,0.866))
        node(p1,[*1*])
        node(p3,[*3*])
        node(p5,[*5*])
        edge(p3,p1,"->",bend: -55deg)
        edge(p5,p3,"->",bend: -55deg)
        edge(p1,p5,"->",bend: -55deg) 
      }
    ),
    diagram(
      {
        // traingle
        let (p2,p4) = ((0,0),(1,0))
        node(p2,[*2*])
        node(p4,[*4*])
        edge(p2,p4,"->",bend: -55deg)
        edge(p4,p2,"->",bend: -55deg)
      }
    )
  )]
  #only("3-")[
    $
      sigma^(-1) = (5,3,1)(2,4)
    $
  ]
]

#slide(title: "置換群")[
  #set text(size: 19pt)
  #definition(number:"2.2")[
    一個集合$A$的所有置換構成一個_群_，稱為$A$的*置換群*，記為$S_A$。
  ]
  #pause
  我們驗證$S_A$確實是一個群。 (單位元素、結合律、反元素)
  #pause
  #set text(size: 19pt)
  #remark[
    $n$個元素的集合的置換群計為$S_n$的order為$n!$。
  ]
  #pause
  #example[
    \
    上述的例子中，$tau$和$sigma$是$S_5$的元素。\
    $S_5$的order為$5! = 120$。
    並且$sigma$和$tau$的反元素
    $ sigma^(-1) = (5,3,1)(2,4) \ 
     tau^(-1) = (5,4,3,2,1) $
  ]
]


#new-section-slide("空間對稱群",subtitle:"Symmetry Group")
#let (p1,p2,p3) = ((0,0),(1,0),(0.5,-0.866))

#slide(title:"對稱群")[
  #set figure(supplement: none)
  我們接下來考慮一個正三角形，他有那些對稱性？

]
#slide[
  #grid(
    columns :(1fr,1fr,1fr),
    rows: (1fr,1fr),
    align: center,
    [#figure(
      diagram(
        {
          node(p1,[*1*])
          node(p2,[*2*])
          node(p3,[*3*])
          edge(p1,p2,"-")
          edge(p2,p3,"-")
          edge(p3,p1,"-")
        }
      ),
    )],
    [#figure(
      diagram({
        node(p1,[*2*])
        node(p2,[*3*])
        node(p3,[*1*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")

      }),
    )],
    [#figure(
      diagram(
        {
          node(p1,[*3*])
          node(p2,[*1*])
          node(p3,[*2*])
          edge(p1,p2,"-")
          edge(p2,p3,"-")
          edge(p3,p1,"-")
        }
      ),
    )],
    [#figure(
      diagram({
        node(p1,[*2*])
        node(p2,[*1*])
        node(p3,[*3*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")
        edge(p3,(0.5,0.1),stroke: red)
      }),
    )],
    [#figure(
      diagram({
        node(p1,[*3*])
        node(p2,[*2*])
        node(p3,[*1*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")
        let mid = ((p3.at(0)+p1.at(0))/1.9,(p3.at(1)+p1.at(1))/1.9)
        edge(p2,mid,stroke: red)
      }),
    )],
    [#figure(
      diagram({
        node(p1,[*1*])
        node(p2,[*3*])
        node(p3,[*2*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")
        let mid = ((p3.at(0)+p2.at(0))/1.9,(p3.at(1)+p2.at(1))/1.9)
        edge(p1,mid,stroke: red)
      }),
    )],

  )
]

#slide(title:[$D_3$])[
  把上面正三角形的對稱性的置換收集起來，我們得到一個群，稱為正三角形的*對稱群*$D_3$。

  那$D_3$的order是多少？只有$6$個嗎？
]

#slide(title:[$D_4$])[

  #grid(
    columns: (1fr,1fr),
    rows: (auto,auto),
    align: center,
    [
      #v(20%)
      #figure(
        diagram({
          node((0,0),[1])
          node((1,0),[2])
          node((1,1),[3])
          node((0,1),[4])
          edge((0,0),(1,0),"-")
          edge((1,0),(1,1),"-")
          edge((1,1),(0,1),"-")
          edge((0,1),(0,0),"-")

          node((0.5,-0.5),[#set text(fill: red);$tau_3$])
          edge((0.5,-0.1),(0.5,1.1),"-",stroke: red)
          
          node((-0.5,0.5),[#set text(fill: lime);$tau_4$])
          edge((-0.1,0.5),(1.1,0.5),"-",stroke: lime)
          
          node((1.5,-0.5),[#set text(fill: teal);$tau_2$])
          edge((1,0),(0,1),"-",stroke: teal)
          
          node((-0.5,-0.5),[#set text(fill: purple);$tau_1$])
          edge((0,0),(1,1),"-",stroke: purple)
        })
      )
    ],
    [
      #set text(size: 21pt)
      $
        e &= (1)(2)(3)(4) \
        rho_1 &= (1,2,3,4)\
        rho_2 &= (1,3)(2,4)\
        rho_3 &= (1,4,3,2)\
        tau_1 &= (1)(2,4)(3)\
        tau_2 &= (1,3)(2)(4)\
        tau_3 &= (1,2)(4,3)\
        tau_4 &= (1,4)(2,3)\
      $
    ],
    [#pause 那$D_4$的order是多少？ \ 只有$8$個嗎？]
  )
]
// #slide(title:[$D_4$])[
//   #set figure(supplement: none)

//   值得注意的是 $sigma = (1,2)(4)(3)$ 他是一個置換，但不是一個對稱置換，因為他不能把正方形打回自身。
//   #v(20%)
//   #let (p1,p2,p3,p4) = ((0,0),(1,0),(1,1),(0,1))
//   #grid(
//     columns: (1fr,1fr,1fr),
//     rows: (auto),
//     figure(
//       diagram({
//         node(p1,[*1*])
//         node(p2,[*2*])
//         node(p3,[*3*])
//         node(p4,[*4*])
//         edge(p1,p2,"-")
//         edge(p2,p3,"-")
//         edge(p3,p4,"-")
//         edge(p4,p1,"-")
//       }),
//       caption: "正方形"
//     ),
//     figure(
//       diagram({
//         node(p1,[*3*])
//         node(p2,[*4*])
//         node(p3,[*1*])
//         node(p4,[*2*])
//         edge(p1,p2,"-")
//         edge(p2,p3,"-")
//         edge(p3,p4,"-")
//         edge(p4,p1,"-")
//       }),
//       caption: [$rho_2$]
//     ),
//     figure(
//       diagram({
//         node(p1,[*2*])
//         node(p2,[*1*])
//         node(p3,[*3*])
//         node(p4,[*4*])
//         edge(p1,p2,"-")
//         edge(p2,p4,"-")
//         edge(p3,p4,"-")
//         edge(p3,p1,"-")
//       }),
//       caption: [$sigma$ 不是一個對稱置換]
//     )
//   ) 
// ]
#slide(title: "如何計算空間對稱群")[

  + 先找到圖形的不動點$c$
  + 畫一條通過不動點的直線。
  + 假設有$m$個對稱稱使得這條線不動，而條線在對稱性下會被打到$n$個不同的位子。
  + 那麼這個對稱群的order就是$n times m$。

  下一節會證明這個方法是正確的。
]
#slide(title: "如何計算空間對稱群")[
  正$n$邊形的對稱群的order是#only("1")[多少?]。\
  立方體的有#only("1")[多少]不同的旋轉。
  #set align(center)
  #cetz.canvas(length: 90pt,{
      import cetz.draw:*
      ortho(x:20deg,y:45deg,z:0deg,{
        
        on-xy(z:-1,{
          rect((-1,-1),(1,1),fill: rgb("e8e8f8"))
        })
        on-xy(z:1,{
          rect((-1,-1),(1,1),fill: rgb(silver))
        })
        on-yz(x:-1,{
          rect((-1,-1),(1,1))
        })
        on-yz(x:1,{
          rect((-1,-1),(1,1))
        })
        on-xz(y:-1,{
          rect((-1,-1),(1,1))
        })
        on-xz(y:1,{
          rect((-1,-1),(1,1))
        })
      })
    })
]
#new-section-slide("群作用",subtitle:"Group Action")
#let gset = $G negspace textb("-set")$
#slide(title: "群作用")[
  #set text(size: 19pt)

  #definition(number:"4.1")[
    一個群$angle.l G,* angle.r$對一個集合$A$的*作用*是一個映射 $phi : G times A -> A$，滿足以下條件：
    #set enum(numbering: al("1."))
    + 對於所有 $a in A quad phi(e,a) = a$
    + 對於所有 $a in A$ 和 $g,h in G$，$phi(g*h,a) = phi(g,phi(h,a))$

    在這個情況下，我們稱$A$是一個#gset。
  ]
  為了簡化，我們有時候會省略運算符號，寫成$g a$代表$phi(g,a)$。
  所以上述的條件可以寫成
  $
    e a = a \
    (g h) a = g (h a)
  $
  像是在上一章節中，我們考慮了對稱群$D_3$對正三角形的作用。
]
#slide(title:"Example")[
  $rho_1 = (1,2,3) in D_3$
  #grid(
    columns: (auto,auto,auto,auto),
    column-gutter: 1em,
    rows: (auto),
    align: center+horizon,
    $rho_1$,
    diagram(
    { 
      node(p1,[*1*])
      node(p2,[*2*])
      node(p3,[*3*])
      edge(p1,p2,"-")
      edge(p2,p3,"-")
      edge(p3,p1,"-")
    }),
    $=$,
    diagram(
    {
      node(p1,[*2*])
      node(p2,[*3*])
      node(p3,[*1*])
      edge(p1,p2,"-")
      edge(p2,p3,"-")
      edge(p3,p1,"-")
    })
  )
  $tau = (1)(2,3) in D_3$
  #grid(
    columns: (auto,auto,auto,auto),
    column-gutter: 1em,
    rows: (auto),
    align: center+horizon,
    $tau$,
    diagram(
    { 
      node(p1,[*1*])
      node(p2,[*2*])
      node(p3,[*3*])
      edge(p1,p2,"-")
      edge(p2,p3,"-")
      edge(p3,p1,"-")
    }),
    $=$,
    diagram(
    {
      node(p1,[*1*])
      node(p2,[*3*])
      node(p3,[*2*])
      edge(p1,p2,"-")
      edge(p2,p3,"-")
      edge(p3,p1,"-")
    })
  )
]
#slide(title:"作用群")[
  #set text(size: 19pt)
  #theorem(number:"4.2")[
    讓$X$是一個#gset。如果$g x_1 = g x_2$，那$x_1 = x_2$
  ]
  #proof[
    假設 $g x_1 = g x_2$，那麼 $g^(−1)g x_1 = g^(−1) g x_2$，所以 $e x_1 = e x_2$，所以 $x_1 = x_2$。
  ]
  #remark[
    如果$x != y$，那$g x != g y$
  ]
]
#slide(title: "軌道 Orbits")[
  #set text(size: 19.5pt)
  #theorem(number:"4.3")[
    讓$X$是一個#gset，我們定義一個在$X$上的關係$tilde.op$，對於所有的$x,y in X$，$x tilde.op y$當且僅當存在$g in G$，使得$g x = y$。這個關係是一個等價關係。
  ] <relation>
  #pause
  #proof[
    自反性、對稱性、傳遞性
    #uncv("3-")[\ *自反性*：對於所有的$x in X$，$x tilde.op x$，因為$e x = x$。]
    
    #uncv("4-")[\ *對稱性*：如果$x tilde.op y$，那麼存在$g in G$，使得$g x = y$，所以$g^(-1) y = x$，所以$y tilde.op x$。]
    
    #uncv("5-")[\ *傳遞性*：如果$x tilde.op y$且$y tilde.op z$，那麼存在$g,h in G$，使得$g x = y$且$h y = z$，所以$h g x = z$，所以$x tilde.op z$。]
  ] 
]
#slide(title: "軌道 Orbits")[
  #set text(size: 19pt)
  #definition(number:"4.4")[
    讓$X$是一個#gset，每一個在 Therorem 4.2 下的等價類稱為一個*軌道*。如果$x in X$，包含$x$的分割是$x$的軌道，記作$G_x$。
  ]
  #remark()[
    讓 $X$ 是一個 #gset，$x in X$，那麼 $x$ 的軌道 $G_x = {g x mid(|) g in G}$。
  ]
]
#let Stab = math.op("Stab")
#slide(title: "不動點、穩定子群")[
  *Fixed point, Stabilizers subgroup *
  #set text(size: 19pt)

  #definition(number: "4.5")[
    讓$X$是一個#gset，讓$x in X$，$g in G$。我們定義；
    $
      Stab_G (x) = {g in G | g x = x} \
      X^g = {x in X | g x = x}
    $
    $Stab_G (x)$稱為$x$的*穩定子群*，$X^g$稱為$g$的*不動點*。
  ]
  #pause
  #v(1.5em)
  - $X^e = X$
  
]

#slide(title: "軌道-穩定子定理")[
  #set text(size: 20pt)
  #theorem([軌道-穩定子定理 (Orbit-Stabilizer Theorem)],number:"4.6")[
    讓$G$是一個有限群，讓 $X$ 是一個 #gset，$x in X$，那麼 $abs(G) = abs(G_x) abs(Stab_G (x))$。
  ] <orbit-stabilizer>
  #figure(
      image("pic/obstab.jpg",height: 250pt)
  )
]
#slide(title:"Proof")[
  #set text(size: 19pt)

  定義$f:G -> G_x$，$f(g) = g x$。我們證明每一個在$G_x$裡的元素都被打到$abs(Stab_G (x))$這麼多次。\
  給定一個$y in G_x$，那麼存在$h in G$使得$y = h x$。\
  
  #pause

  我們先證明這個引理:  $f(g) = y <==> h^(-1) g in Stab_G (x)$。

  #pause

  \ $=>$：如果$f(g) = y$，那麼$g x = h x$，所以$h^(-1)g x = x$，所以$h^(-1)g in Stab_G (x)$。
  #pause

  \ $arrow.l.double$：如果$h^(-1) g in Stab_G (x)$，那麼$h^(-1) g x = x$，所以$g x = h x$，所以$f(g) = y$。\
  
] 
#slide[
  #set text(size: 19pt)
  接著我們來討論有多少 $g in G$ 使得 $h^(-1)g in Stab_G (x)$。
  #pause
  $
    h^(-1) g in Stab_G (x) &<==> exists tilde(g) in Stab_G (x) st h^(-1) g = tilde(g)\ 
    &<==> exists tilde(g) in Stab_G (x) st g = h tilde(g)\
    &<==> g in {h tilde(g) | tilde(g) in Stab_G (x)}
  $
  #pause
  所以，$f(g) = y <==> g in {h tilde(g) | tilde(g) in Stab_G (x)}$。因此，每個$y in G_x$ 都 $abs(Stab_G (x))$ 個 $g in G$ 使得 $f(g) = y$。\
  所以，$abs(G) = abs(G_x) abs(Stab_G (x))$。
]
#slide(title: "伯恩賽德引理 (Burnside’s Lemma)")[
  #set text(size: 19pt)
  #lemma([*伯恩賽德引理*],number:"4.7")[
    讓$G$是一個有限群，讓$X$是一個#gset。讓$r$是$X$的軌道數，那麼
    $
      r dot abs(G) = sum_(g in G) abs(X^g)
    $
  ]
  #set text(size: 23pt)
  #pause
  我們通過雙重計數來證明這個引理。考慮所有滿足$g x = x$的序組$(g,x)$，我們用兩種方式計數這些序組，這樣就會有一個很自然的等式。
]
#slide(title: "Proof")[
  #set text(size: 19pt)
  我們考慮序組$(g,x)$，其中$g x = x$。假設這樣的序組有$N$個。
  對於每一個$g in G$，我們計算$(g,x)$的數量，這個數量是$abs(X^g)$。所以
  $
    N = sum_(g in G) abs(X^g)
  $
  #pause
  另一方面，對於每一個$x in X$，我們計算$(g,x)$的數量，這個數量是$abs(Stab_G (x))$。所以
  $
    N = sum_(x in X) abs(Stab_G (x))
  $
]
#slide[
  #set text(size: 19pt)
  根據 @orbit-stabilizer[*軌道穩定子定理* Thm]，$abs(Stab_G (x))abs(G_x) = abs(G)$，所以，
  $
    N = sum_(x in X) abs(Stab_G (x)) = sum_(x in X) abs(G) / abs(G_x) = abs(G) sum_(x in X) 1 / abs(G_x)
  $ 
  對於在相同軌道的元素，$abs(G_x)$是相同的。讓$cal(O)$是一個軌道，我們有
  $
    sum_(x in cal(O)) 1 / abs(G_x) = sum_(x in cal(O)) 1 / abs(cal(O)) = 1
  $ 
  因此，$ sum_(x in X) 1 / abs(G_x) = (textr("軌道的數量")) $
]
#slide[
  $
    N = abs(G) dot (textr("軌道的數量")) = abs(G) dot r
  $ 

  $ r dot abs(G) = sum_(g in G) abs(X^g) $
]
#slide(title: "Example")[
  #set text(size: 19pt)
  用$4$個顏色對一個正三角形的三個邊進行著色，有幾種不同的著色方法？(兩種著色方式被認為是相同的，如果他們可以通過旋轉、鏡射相互變換)
  
  #pause
  
  我們讓$G = D_3$是三角型的對稱群，$X$是所有著色的結果($abs(X) = 4^3$)，所以我們要求$X$在$G$下有幾個軌道。根據前的討論，我們知道$abs(G) = 6$，然後我們計算不動點的個數：
  $
    abs(X^(rho_0)) = 4^3\
    abs(X^(rho_1)) = 4\
    abs(X^(rho_2)) = 4\
    abs(X^(tau_1)) = 4^2\
    abs(X^(tau_2)) = 4^2\
    abs(X^(tau_3)) = 4^2\
  $

]
#slide[
  #set text(size: 21pt)
  根據*伯恩賽德引理*，我們有
  $
    6r &= 4^3 +4 +4 +4^2 +4^2 + 4^2 = 120\
    r &= 20
  $
  所以正三角形的相異著色方法有$20$種。
]
#slide(title: "著色多項式")[
  #set text(size: 19pt)
  我們考慮我們有$n$個顏色，幫一個有對稱性的圖形上色，我們假設在對稱性下有$r$種上色方式。
  讓$X$是所有上色方法的集合，讓$G$是該圖形的對稱群，根據博恩賽德引理，我們有
  $
    r = 1/abs(G) sum_(g in G) abs(X^g)
  $
  其中$X^g$是在$g$下的不動點的集合。
  #pause
  $
    g = underbrace((1,2,3)(5,4) dots (\#,\#),m_g)
  $
  「每個循環內的顏色都一樣」   
  $abs(X^g) = n^(m_g)$
  #pause
  $
    r = 1/abs(G) sum_(g in G) abs(X^g) =  1/abs(G) sum_(g in G) n^(m_g)
  $
]
#slide(title: "Example")[
  #set text(size: 19pt)
  #let mg = $m_g$
  我們考慮有$n$個顏色，對一個正四邊形的頂點上色，我們要求在對稱性下有幾種不同的著色方法。

  #pause

  我們讓$G = D_4$是正四邊形的對稱群，$X$是所有著色的結果($abs(X) = n^4$)，我們知道$abs(G) = 8$
  
  #pause
  #set text(size: 21pt)
  #v(3em)
  - 單位變換 $mg = 4$
  - $2$個$mg = 1$的旋轉($90 degree, 270 degree$)，e.x. $g = (1,2,3,4)$   
  - $1$個$mg = 2$的旋轉($180 degree$)，e.x. $g = (1,2)(3,4)$  
  - $2$個$mg = 3$的鏡射(對角線的鏡射)，e.x. $g = (1)(3)(2,4)$ 
  - $2$個$mg = 2$的鏡射(中線的鏡射)，e.x. $g = (1,3)(2,4)$  
]
#slide[
  #set text(size: 21pt)
  所以我們有
  $
    r &= 1/8 (n^4 + 2n + n^2 + 2n^3 +2n^2) \
    r &= 1/8 (n^4 + 2n^3 + 3n^2 +2n)
  $
]
#slide(title: "Example")[
  我們現在有$n$個顏色，幫一個正六面體上色，可以通過旋轉變換得到視為相同的著色方式。總共有多少種不同的著色方式？
  #grid(
    columns: (1fr,1fr),
    rows: (auto),
    align: center,
    cetz.canvas(length: 3em,{
      import cetz.draw:*
      ortho(x:20deg,y:45deg,z:0deg,{
        
        on-xy(z:-1,{
          rect((-1,-1),(1,1),fill: rgb("e8e8f8"))
        })
        on-xy(z:1,{
          rect((-1,-1),(1,1),fill: rgb(silver))
        })
        on-yz(x:-1,{
          rect((-1,-1),(1,1))
        })
        on-yz(x:1,{
          rect((-1,-1),(1,1))
        })
        on-xz(y:-1,{
          rect((-1,-1),(1,1))
        })
        on-xz(y:1,{
          rect((-1,-1),(1,1))
        })
        // line((0,0,0),(2,0,0),stroke: red)
        // line((0,0,0),(0,2,0),stroke: green)
        // line((0,0,0),(0,0,2),stroke: blue)
      })
    }),
    cetz.canvas(length: 3em,{
      import cetz.draw:*
      rect((0,0),(1,1),name: "1")
      rect((1,0),(2,1))
      rect((2,0),(3,1))
      rect((3,0),(4,1))
      rect((1,1),(2,2))
      rect((1,0),(2,-1))
      content((0.5,0.5),[*1*])
      content((1.5,0.5),[*2*])
      content((2.5,0.5),[*3*])
      content((3.5,0.5),[*4*])
      content((1.5,1.5),[*5*])
      content((1.5,-0.5),[*6*])
      
    })
  )
]
#slide[
  #let mg = $m_g$
  #set text(size: 21pt)
  我們讓$G = D$是正六面體的對稱群，$X$是所有著色的結果($abs(X) = n^6$)，我們知道$abs(G) = 24$
  
  #pause
  #v(3em)
  - 單位變換 $mg = 4$
  - $2$個$mg = 1$的旋轉($90 degree, 270 degree$)，e.x. $g = (1,2,3,4)$   
  - $1$個$mg = 2$的旋轉($180 degree$)，e.x. $g = (1,2)(3,4)$  
  - $2$個$mg = 3$的鏡射(對角線的鏡射)，e.x. $g = (1)(3)(2,4)$ 
  - $2$個$mg = 2$的鏡射(中線的鏡射)，e.x. $g = (1,3)(2,4)$ 
]
#slide[
  #set text(size: 21pt)
  所以我們有
  $
    r &= 1/24 (n^6 + 6n^3 + 3n^4 + 6n^3 + 8n^2) \
    r &= 1/24 (n^6 + 3n^4 + 12n^3 + 8n^2)
  $
]
#slide(title:"Example")[
  #set text(size: 21pt)
  在旋轉的對稱姓下，用$n$個顏色對一個正四面體的*邊*上色，總共有多少種不同的著色方式？
  #figure[
    #image("/pic/image.png",width: 11em)
  ]

  我們讓$G$是正四面體的對稱群，我們通過軌道-穩定子定理，我們可以得到$abs(G) =12$

]
#slide[
  
  我們討論裡面的對置換：
  - 單位變換:$(1)(2)(3)(4)(5)(6)$
  - $8$個以一面中點的垂線為轉軸的旋轉:$(1,2,3)(4,5,6)$
  - $3$個以過兩對邊中點的轉軸旋轉:$(1)(6)(2,4)(5,3)$

  所以我們有
  $
    r = 1/12 (n^6 + 8n^2 + 3n^4) 
  $
]