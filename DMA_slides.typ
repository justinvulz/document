#import "@preview/polylux:0.3.1": *
#import "@preview/ctheorems:1.1.2": *
#import "/typst_packages/lecture.typ": *
#import "@preview/pinit:0.1.4": *
#import "@preview/cuti:0.2.1": show-fakebold
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
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
      - 密碼學
      - 「李群」在近代物理中有重要作用
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
  #set text(size: 24pt)
  Example:
  - 整數集合 $ZZ$ 與加法運算 $+$ 構成一個群。 $angle.l ZZ,+ angle.r$\
    單位元素為 $0$，反元素為 $-a$。
  - 整數集合 $ZZ$ 與乘法運算 $*$ 不是一個群。\
    乘法在整數裡沒有反元素。
  - $ZZ_4 = {0,1,2,3}$ 與加法運算 $+_4$ 構成一個群。\
    其中 $+_4$ 定義為 $a +_4 b = (a+b) mod 4$。
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
  - $ZZ_4$ 的 order 為 $4$。
  - 可逆矩陣的集合與矩陣乘法是一個群，但不是交換群。
]
#let slide = slide.with(title: "群的基礎性質")
#slide(new-section: "Properties of Groups")[
  #set text(size: 19pt)
  #theorem(number:"1.1")[
    如果$G$是一個群，那*消去率*成立，即對於所有的$a,b,c in G$，
    $ a*b = a*c => b = c \
       b*a = b*c => b = c $
  ]
  #pause
  #proof[
    讓$G$是一個群，$a,b,c in G$。假設$a*b = a*c$。
    #uncv("3-")[
      因為$a in G$，所以$a$的反元素$a^(-1)$存在，且$a*a^(-1) = e$。
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
  #theorem(number: "1.2")[
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
  #theorem(number:"1.3")[
    讓$G$是一個群，$a b in G$，那麼
    $
      (a b)^(-1) = b^(-1) a^(-1)
    $
  ]
  #pause
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
]

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
      caption: [$sigma$],
    ) <fig1>],
    [#figure(
      $
        1 -> 2\
        2 -> 3\
        3 -> 2\
        4 -> 5\
        5 -> 1\
      $,
    )<fig2>]
  )
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
  #definition(number:"2.2")[
    讓$sigma$和$tau$是兩個置換，定義$sigma$和$tau$的*合成*是一個新的置換$sigma cir tau$，使得對於所有的$a in A$，
    $ (sigma cir tau)(a) = sigma(tau(a)) $
  ]
  #pause
  #set text(size: 25pt)
  $ 
  (sigma cir tau)(x) = sigma(tau(x)) \
  A -->^tau A -->^sigma A
  $
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
  $
    sigma cir tau 
    = msigma cir mtau 
    = mat(
      1, 2, 3, 4, 5;
      4, 5, 2, 1, 3
    )
  $
  #pause
  
]