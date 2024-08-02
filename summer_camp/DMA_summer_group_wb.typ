#import "../typst_packages/lecture.typ": *
#import "@preview/cetz:0.2.2"
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
#import fletcher.shapes:circle


#show par: set block(spacing: 0.9em)
#show math.equation: set block(spacing: 0.9em)

#let theorem = thmbox(
	"p",
	"Theorem",
	// fill: rgb("e8e8f8"),
  stroke: black,
	base_level: 1,
	padding: (y: 0em))

#let definition = thmbox(
	"p",
	"Definition",
	// fill: rgb("e8f8e8"),
    stroke: black,
	base_level:1,
	padding: (y: 0em))

#let proof = thmproof("proof","Proof")
#let lemma = thmbox(
  "p",
  "Lemma",
  // fill: rgb("f8e8e8"),
    stroke: black,
  base_level: 1,
  padding: (y: 0em))
#let example = thmplain("example","Example").with(
	inset: (top: 0.5em, bottom: 0.5em, left: 1em, right: 1em),
	numbering: none)
#let exercise = thmbox(
  "exercise",
  "Exercise",
  stroke: black + 1pt,
  base: none,           
).with(numbering: "I")  
#let remark = thmplain("remark","Remark").with(
	inset: (top: 0.5em, bottom: 0.5em, left: 1em, right: 1em),
	numbering: none)
#show: doc => conf(
  "群論",
  "陽明交大應數系營隊",
  doc)


#makeTitle

\
#set par(first-line-indent: 1.5em)

在數學中，群論 (Group theory) 研究名為「群」的代數構。
群論在許多的領域都有很重要的應用。像是，倍立方、化圓為方、三等分角，五次多項式無法解的原因都可以用群論來解釋。
另外，像是標準粒子模型、量子力學 (李群)、晶體結構、密碼學等領域也有很多群論的應用。testtesttest

#set par(first-line-indent: 0em)

= 群 (Group) 


#definition[
  $angle.l G , * angle.r$是一個集合 $G$ 與一個二元運算 $* : G times G |-> G$，滿足以下條件：
  #set enum(numbering: al(n => [$cal(G)_#n$:]))
  + 對於所有的$a,b,c in G$， $ (a*b)*c = a*(b*c) quad textb("結合律") $ 
  
  + 存在一個元素 $e in G$，使得對於所有的 $a in G$， $ a*e = e*a = a quad textb("單位元素") $
  
  + 對於每一個 $a in G$，存在一個元素 $a^(-1) in G$，使得 $ a*a^(-1) = a^(-1)*a = e quad textb("反元素") $
]

#example[
  #set table(stroke: (x,y) =>(
    bottom: if y==0  {1pt},
    right: if x==0 {1pt},
  ))
  我們來看一些例子：\ 
  
  - $angle.l ZZ, + angle.r$、$angle.l QQ,+ angle.r$、$angle.l RR,+ angle.r$

  - $angle.l QQ^+, times angle.r$
  
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

#remark[有時候我們會省略二元運算$*$，以$G$表示一個群。]

#definition[
  讓$G$是一個群，定義$abs(G)$是$G$的元素個數，稱為$G$的*order*。
]

#definition[
  一個群$G$如果滿足交換率i.e. 對於所有的$a,b in G$，$ a*b = b*a $，則稱$G$是一個*交換群*(Abelian groups)。
]
#example[
  - $C_3$的order是$3$。
  - $ZZ$ 是一個交換群。
  - 可逆矩陣的集合與矩陣乘法是一個群，但不是交換群。

  
]

== 群的性質
#theorem[
  如果$G$是一個群，那*消去率*成立，即對於所有的$a,b,c in G$，
  $ a*b = a*c => b = c \
     b*a = c*a => b = c $
]
#proof[
  讓$G$是一個群，$a,b,c in G$。假設$a*b = a*c$，因為$a in G$，所以$a$的反元素$a^(-1)$存在，且$a*a^(-1) = a^(-1)*a = e$。
  $
    &a*b = a*c \
    => &a^(-1)*a*b = a^(-1)*a*c \
    => &e*b = e*c \
    => &b = c 
  $
]
#theorem[
  群$G$的單位元素$e$唯一。
]
#proof[
  假設存在第二個單位元素$e_2$，滿足$e_2*a = a*e_2 = a med forall a in G$，因為$e in G$，所以$e_2*e = e * e$，根據消去律$e_2 = e$。
]
#theorem[
  讓$G$是一個群，$a ,b in G$，那麼
  $
    (a b)^(-1) = b^(-1) a^(-1)
  $
]
#proof[
  我們直接相乘
  $
    (a b)b^(-1) a^(-1) &= a (b b^(-1)) a^(-1) quad textr("結合律")\
                       &= a e a^(-1)\
                       &= a a^(-1)\
                       &= e
  $
  我們證明了 $(a b)b^(-1) a^(-1) =e$，接著我們用同樣的方法可以得到$b^(-1) a^(-1)(a b) =e$ 也是成立的。
  根據反元素的定義，$(a b)^(-1) = b^(-1) a^(-1)$。
]

= 置換群(Permutation Group)
我們接下來討論一個特殊的群，置換群。考慮一個集合$A = {1,2,3,4,5}$，我們可以將$A$的元素重新排列成$A = {3,1,5,2,4}$。我們可以將這個排列表示成一個函數$phi : A -> A$，這個函數將$1$映射到$3$，$2$映射到$1$，以此類推。我們可以將這個排列表示成一個表格，如@fig1 所示。 我們稱這樣的函數為一個*置換*。但是，@fig2 的函數不是一個置換，因為$4$沒有被任何一個元素映射到。

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
    caption: "一個置換", 
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

#definition[
  一個$A$的是*置換*是一個一一對應的函數 $phi : A -> A$。 (one-one and onto)
]
我們現在給定兩個置換 $tau$ 和 $sigma$ ，我們定義他們的合成 $sigma cir tau$，對於所有的 $x in A$，
$ 
(sigma cir tau)(x) = sigma(tau(x)) \
A -->^tau A -->^sigma A
$
因為 $tau$ 和 $sigma$ 是一一對應的函數，所以 $sigma cir tau$ 也是一一對應的函數。所以 $sigma cir tau$ 是一個置換。
#example[
  #let msigma = $mat(
      1, 2, 3, 4, 5;
      3, 4, 5, 2, 1
    )$
  #let mtau = $mat(
      1, 2, 3, 4, 5;
      2, 3, 4, 5, 1
    )$
  對於上的 $sigma$ 我們可以表示成，
  $
    sigma = msigma
  $
  定義 $tau$ 為，
  $
    tau = mtau
  $
  我們可以計算 $sigma cir tau$，
  $
    sigma cir tau 
    = msigma cir mtau 
    = mat(
      1, 2, 3, 4, 5;
      4, 5, 2, 1, 3
    )
  $
  所以像是 $sigma cir tau (1) = sigma(tau(1)) = sigma(2) = 4$
]
== 循環置換 (Cyclc)
一個置換除了可以用上述的方法表示，我們還可以用*循環*的方式表示。我們來看下面的例子，
定義一個置換$ sigma = mat(1, 2, 3, 4, 5; 3, 4, 5, 2, 1) $
我們觀察一下 $sigma$ 的作用，可以發現 $sigma$ 將 $1 -> 3 -> 5 -> 1$，$2 -> 4 -> 2$，所以我們可以將 $sigma$ 表示成一個循環 $sigma = (1,3,5)(2,4)$。

#figure(
  grid(
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
  ),
  caption: "一個置換的循環"
)
透過循環置換，我們可以很容易的表示一個置換，並且可以很容易的計算該置換的反元素。例如，對於上面的例子，$sigma^(-1) = (5,3,1)(4,2)$。
#remark[
  如果一個置換$ sigma = mat(1,2,3,4,5;1,2,4,5,3) = (1)(2)(3,4,5) $
  為了簡化，我們有時候會省略一個元素的循環，寫成 $sigma = (3,4,5)$。
]
#definition[
  一個集合$A$的所有置換構成一個群，我們稱這個群為$A$的*置換群*，記作$S_A$。
]
#remark[
  $S_n$ 表示 $n$ 個元素的置換群。
  $S_n$的order是 $n!$。
]


= 對稱群(Symmetry Groups)
接下來我們考慮一種特殊的置換群，稱為*對稱群*。我們考慮一個正三角形，將正三角形的頂點邊繼承$1,2,3$，我們來討論他有那些對稱性。
// 我們把順時鐘旋轉$120 degree$ 得到一個新的正三角形(@sqr90)所示。我們可以將這個操作表示成一個置換:
// $ rho_1 = mat(1,2,3; 2,3,1) = (1,2,3) $
// 我們稱這樣的置換是*對稱置換*，他可以把圖形打回自身。
#let (p1,p2,p3) = ((0,0),(1,0),(0.5,-0.866))
// #grid(
//   columns: (1fr,1fr,1fr),
//   rows: (auto),
//   align: center,
//   [#figure(
//     diagram(
//       {
//         node(p1,[*1*])
//         node(p2,[*2*])
//         node(p3,[*3*])
//         edge(p1,p2,"-")
//         edge(p2,p3,"-")
//         edge(p3,p1,"-")
//       }
//     ),
//     caption: "正三角形", 
//   )<fig3>],
//   [#figure(
//     diagram({
//       node(p1,[*2*])
//       node(p2,[*3*])
//       node(p3,[*1*])
//       edge(p1,p2,"-")
//       edge(p2,p3,"-")
//       edge(p3,p1,"-")
      
//     }),
//     caption: [順時針旋轉 $120$ 度],
//   )<sqr90>],
//   [#figure(
//     diagram({
//       node(p1,[*1*])
//       node(p2,[*3*])
//       node(p3,[*2*])
//       edge(p1,p2,"-")
//       edge(p2,p3,"-")
//       edge(p3,p1,"-")
//       let mid = ((p2.at(0)+p3.at(0))/1.9,(p2.at(1)+p3.at(1))/1.9)
//       edge((0,0),mid,stroke: red)
//     }),
//     caption: [沿某一軸鏡射],
//   )<sqf1>]
// )
// 接下來看一下 @fig3 到 @sqf1 的變換，我們可以得到另一個置換 
// $ tau_1 = mat(1,2,3;1,3,2)  = (1)(2,3) $
// 接著我考慮 $tau_1 cir rho_1$ 這個置換，先把三角形旋轉$120 degree$，再把它沿著@sqf1 的軸鏡射，我們可以得到一個新的置換 :
// $
//   tau_1 cir rho_1 &= mat(1,2,3;1,3,2) mat(1,2,3;2,3,1) \
//     &= mat(1,2,3;3,1,2) \
//     &= (1,3,2)
// $
// 而 $tau_1 cir rho_1$ 這個置換就是沿著另一個軸鏡射的置換。如下圖所示：
// #grid(
//   columns: (1fr,1fr,1fr),
//   rows: (auto),
//   align: center,
//   [#figure(
//     diagram(
//       {
//         node(p1,[*1*])
//         node(p2,[*2*])
//         node(p3,[*3*])
//         edge(p1,p2,"-")
//         edge(p2,p3,"-")
//         edge(p3,p1,"-")
//       }
//     ),
//     caption: "正三角形", 
//   )],
//   [#figure(
//     diagram({
//       node(p1,[*2*])
//       node(p2,[*3*])
//       node(p3,[*1*])
//       edge(p1,p2,"-")
//       edge(p2,p3,"-")
//       edge(p3,p1,"-")
      
//     }),
//     caption: [$rho_1$],
//   )],
//   [#figure(
//     diagram({
//       node(p1,[*2*])
//       node(p2,[*1*])
//       node(p3,[*3*])
//       edge(p1,p2,"-")
//       edge(p2,p3,"-")
//       edge(p3,p1,"-")
//       edge(p3,(0.5,0.1),stroke: red)
//     }),
//     caption: [$tau_1 cir rho_1$],
//   )]
// )

我們可以繼續枚舉所有三角形的對稱操作，我們可以得到以下的置換:
#grid(
    columns :(1fr,1fr,1fr),
    rows: (auto,auto),
    row-gutter: 2em,
    align: center,
    [#figure(supplement: none,
      diagram(
        {
          node(p1,[*1*])
          node(p2,[*2*])
          node(p3,[*3*])
          edge(p1,p2,"-")
          edge(p2,p3,"-")
          edge(p3,p1,"-")
        }
      ),caption:[$mat(1,2,3;1,2,3) = e$]
    )],
    [#figure(supplement: none,
      diagram({
        node(p1,[*2*])
        node(p2,[*3*])
        node(p3,[*1*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")

      }),caption:[$mat(1,2,3;2,3,1) = (1,2,3) = rho_1$]
    )],
    [#figure(supplement: none,
      diagram(
        {
          node(p1,[*3*])
          node(p2,[*1*])
          node(p3,[*2*])
          edge(p1,p2,"-")
          edge(p2,p3,"-")
          edge(p3,p1,"-")
        }
      ),caption:[$mat(1,2,3;3,1,2) = (3,2,1) =rho_2$]
    )],
    [#figure(supplement: none,
      diagram({
        node(p1,[*2*])
        node(p2,[*1*])
        node(p3,[*3*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")
        edge(p3,(0.5,0.1),stroke: red)
      }),caption:[$mat(1,2,3;2,1,3) = (1,2)(3) = tau_1$]
    )],
    [#figure(supplement: none,
      diagram({
        node(p1,[*3*])
        node(p2,[*2*])
        node(p3,[*1*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")
        let mid = ((p3.at(0)+p1.at(0))/1.9,(p3.at(1)+p1.at(1))/1.9)
        edge(p2,mid,stroke: red)
      }),caption:[$mat(1,2,3;3,2,1) = (1,3)(2) = tau_2$]
    )],
    [#figure(supplement: none,
      diagram({
        node(p1,[*1*])
        node(p2,[*3*])
        node(p3,[*2*])
        edge(p1,p2,"-")
        edge(p2,p3,"-")
        edge(p3,p1,"-")
        let mid = ((p3.at(0)+p2.at(0))/1.9,(p3.at(1)+p2.at(1))/1.9)
        edge(p1,mid,stroke: red)
      }),caption:[$mat(1,2,3;1,3,2) = (3,2)(1) = tau_3$]      
    )],
  )
把上述的對稱置換收集起來，並用上面提到的$cir$當作二運算，我們可以得到一個*對稱群*，稱為正三角形的對稱群$D_3$。


同樣的，我們可以考慮正方形的對稱群$D_4$，正方形的對稱群有$8$個元素，我們可以將$D_4$寫下來：
$
  D_4 = {e, rho_1, rho_2, rho_3, tau_1, tau_2, tau_3, tau_4}
$
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
    edge((0.5,-0.1),(0.5,1.1),"-")
    edge((-0.1,0.5),(1.1,0.5),"-")
    edge((0,0),(1,1),"-")
    edge((1,0),(0,1),"-")
  }),
  caption: "正方形的對稱性"
)<refq>
其中$tau_1 dots tau_4$是以@refq 中的對稱軸鏡射，$rho_1 dots rho_3$是以中點為圓心的旋轉。我們可以把他們用循環寫下來：
$
  e &= (1)(2)(3)(4) \
  rho_1 &= (1,2,3,4)\
  rho_2 &= (1,3)(2,4)\
  rho_3 &= (1,4,3,2)\
  tau_1 &= (2,4)\
  tau_2 &= (1,3)\
  tau_3 &= (1,2)(4,3)\
  tau_4 &= (1,4)(2,3)\
$


== 計算對稱群的order
我們上面提到了正三角形的對稱群$D_3$和正方形的對稱群$D_4$，並列出其中的一些元素，那我們要怎麼確定這些對稱群的order呢？我們下面來討論一個方法。

+ 先找到圖形的不動點。
+ 畫一條通過不動點的直線。
+ 假設有$m$個對稱稱使得這條線不動，而條線在對稱性下會被打到$n$個不同的位子。
+ 那麼這個對稱群的order就是$n times m$。

下一節會證明這個方法是正確的。

= 群作用(Group Action)

#let gset = $G negspace textb("-set")$

#definition[
 一個群$angle.l G,* angle.r$對一個集合$A$的*作用*是一個映射 $phi : G times A -> A$，滿足以下條件：
 #set enum(numbering: al("1."))
 + 對於所有 $a in A quad phi(e,a) = a$
 + 對於所有 $a in A$ 和 $g,h in G$，$phi(g*h,a) = phi(g,phi(h,a))$
 在這個情況下，我們稱$A$是一個#gset。
]
為了簡化，我們會省略運算函數，寫成$g a$代表$phi(g,a)$。
所以上述的條件可以寫成
+ 對於所有 $a in A quad e a = a$
+ 對於所有 $a in A$ 和 $g,h in G$，$(g h) a = g (h a)$
#theorem[
  讓$X$是一個#gset。如果$g x_1 = g x_2$，那$x_1 = x_2$
]
#proof[
   假設 $g x_1 = g x_2$，那麼 $g^(−1)g x_1 = g^(−1) g x_2$，所以 $e x_1 = e x_2$，所以 $x_1 = x_2$。
]
#remark[
  如果$x != y$，那$g x != g y$
]
== 不動點 (Fixed point)、穩定子群 (stabilizers subgroup)、軌道 (Orbits)
#let Stab = math.op("Stab")
#theorem[
  讓$X$是一個#gset，我們定義一個在$X$上的關係$tilde.op$，對於所有的$x,y in X$，$x tilde.op y$當且僅當存在$g in G$，使得$g x = y$。這個關係是一個等價關係。
] <relation>
#proof[
  \ *自反性*：對於所有的$x in X$，$x tilde.op x$，因為$e x = x$。
  \ *對稱性*：如果$x tilde.op y$，那麼存在$g in G$，使得$g x = y$，所以$g^(-1) y = x$，所以$y tilde.op x$。
  \ *傳遞性*：如果$x tilde.op y$且$y tilde.op z$，那麼存在$g,h in G$，使得$g x = y$且$h y = z$，所以$h g x = z$，所以$x tilde.op z$。
] 
#definition[
  讓$X$是一個#gset，每一個在 @relation 下的等價類稱為一個*軌道*。如果$x in X$，包含$x$的分割是$x$的軌道，記作$G_x$。
]
#remark[
  讓 $X$ 是一個 #gset，$x in X$，那麼 $x$ 的軌道 $G_x = {g x mid(|) g in G}$。
]
#definition[
  讓$X$是一個#gset，讓$x in X$，$g in G$。我們定義；
  $
    Stab_G (x) = {g in G | g x = x} \
    X^g = {x in X | g x = x}
  $
  $Stab_G (x)$稱為$x$的*穩定子群*，$X^g$稱為$g$的*不動點*。
]



#theorem([軌道-穩定子定理 (Orbit-Stabilizer Theorem)])[
  讓$G$是一個有限群，讓 $X$ 是一個 #gset，$x in X$，那麼 $abs(G) = abs(G_x) abs(Stab_G (x))$。
] <orbit-stabilizer>

#proof[
  定義$f:G -> G_x$，$f(g) = g x$。我們證明每一個在$G_x$裡的元素都被打到$abs(Stab_G (x))$這麼多次。\
  給定一個$y in G_x$，那麼存在$h in G$使得$y = h x$。\
  \
  我們先證明這個引理:  $f(g) = y <==> h^(-1) g in Stab_G (x)$。
  \ $=>$：如果$f(g) = y$，那麼$g x = h x$，所以$h^(-1)g x = x$，所以$h^(-1)g in Stab_G (x)$。
  \ $arrow.l.double$：如果$h^(-1) g in Stab_G (x)$，那麼$h^(-1) g x = x$，所以$g x = h x$，所以$f(g) = y$。\
  \
  接著我們來討論有多少 $g in G$ 使得 $h^(-1)g in Stab_G (x)$。\
  $
    h^(-1) g in Stab_G (x) &<==> exists tilde(g) in Stab_G (x) st h^(-1) g = tilde(g)\ 
    &<==> exists tilde(g) in Stab_G (x) st g = h tilde(g)\
    &<==> g in {h tilde(g) | tilde(g) in Stab_G (x)}
  $
  所以，$f(g) = y <==> g in {h tilde(g) | tilde(g) in Stab_G (x)}$，並且，對於所有$tilde(g) in Stab_G(x)$，$f(h tilde(g)) = h tilde(g)x = h x =y $。
  
  因此，每個$y in G_x$ 都 $abs(Stab_G (x))$ 個 $g in G$ 使得 $f(g) = y$。所以，$abs(G) = abs(G_x) abs(Stab_G (x))$。

]
// #pagebreak()
== 伯恩賽德引理 (Burnside’s Lemma)
#lemma([*伯恩賽德引理*])[
  讓$G$是一個有限群，讓$X$是一個#gset。讓$r$是$X$的軌道數，那麼
  $
    r dot abs(G) = sum_(g in G) abs(X^g)
  $
]
#proof[
  (雙重計數)
  #set math.equation(numbering: "(1)")
  我們考慮序組$(g,x)$，其中$g x = x$。假設這樣的序組有$N$個。
  給定一個$g in G$，我們計算$(g,x)$的數量，這個數量是$abs(X^g)$。所以
  $
    N = sum_(g in G) abs(X^g)
  $
  另一方面，給定一個$x in X$，我們計算$(g,x)$的數量，這個數量是$abs(Stab_G (x))$。所以
  $
    N = sum_(x in X) abs(Stab_G (x))
  $
  根據 @orbit-stabilizer[*軌道穩定子定理* Thm]，$abs(Stab_G (x))abs(G_x) = abs(G)$，所以，
  $
    N = sum_(x in X) abs(Stab_G (x)) = sum_(x in X) abs(G) / abs(G_x) = abs(G) sum_(x in X) 1 / abs(G_x)
  $ 
  對於在相同軌道的元素，$abs(G_x)$是相同的。讓$cal(O)$是一個軌道，我們有
  $
    sum_(x in cal(O)) 1 / abs(G_x) = sum_(x in cal(O)) 1 / abs(cal(O)) = 1
  $ 
  用 *(3)* 代入 *(2)*，我們得到
  $
    N = abs(G) dot (textr("軌道的數量")) = abs(G) dot r
  $ 
  因此， 結合 *(1)* 和 *(4)*，我們得到
  $ r dot abs(G) = sum_(g in G) abs(X^g) $
]
#example[
  用$4$個顏色對一個正三角形的三個邊進行著色，有幾種不同的著色方法？(兩種著色方式被認為是相同的，如果他們可以通過旋轉、鏡射相互變換)
  
  我們讓$G = D_3$是三角型的對稱群，$X$是所有著色的結果($abs(X) = 4^3$)，所以我們要求$X$在$G$下有幾個軌道。根據前的討論，我們知道$abs(G) = 6$，然後我們計算不動點的個數：
  $
    abs(X^(rho_0)) = 4^3\
    abs(X^(rho_1)) = 4\
    abs(X^(rho_2)) = 4\
    abs(X^(tau_1)) = 4^2\
    abs(X^(tau_2)) = 4^2\
    abs(X^(tau_3)) = 4^2\
  $
  根據*伯恩賽德引理*，我們有
  $
    6r &= 4^3 +4 +4 +4^2 +4^2 + 4^2 = 120\
    r &= 20
  $
  所以正三角形的相異著色方法有$20$種。

]
== 著色多項式
我們考慮我們有$n$個顏色，幫一個有對稱性的圖形上色，我們假設在對稱性下有$r$種上色方式。
讓$X$是所有上色方法的集合，讓$G$是該圖形的對稱群，根據博恩賽德引理，我們有
$
  r = 1/abs(G) sum_(g in G) abs(X^g)
$
其中$X^g$是在$g$下的不動點的集合。我們觀察一下$g in G$，我們知道$g$可以被寫成循環的形式，像是下面這樣:
$
  g = underbrace((1,2,3)(5,4) dots (\#,\#),m_g)
$
所以$g$種共有$m_g$個循環。我們發現在這種情況下要在$g$下不動的著色方法必須滿足「每個循環內的顏色都一樣」，所以$abs(X^g) = n^(m_g)$
所以我們得到，
$
  r = 1/abs(G) sum_(g in G) abs(X^g) =  1/abs(G) sum_(g in G) n^(m_g)
$

#example[
  #let mg = $m_g$
  我們考慮有$n$個顏色，對一個正四邊形的頂點上色，我們要求在對稱性下有幾種不同的著色方法。
  我們讓$G = D_4$是正四邊形的對稱群，$X$是所有著色的結果($abs(X) = n^4$)，所以我們要求$X$在$G$下有幾個軌道。根據前的討論，我們知道$abs(G) = 8$，然後我們計算不動點的個數：
  - $1$個 $4$ cycle的單位變換，$e = (1)(2)(3)(4)$
  - $2$個 $1$ cycle的旋轉($90 degree, 270 degree$)，e.x. $g = (1,2,3,4)$   
  - $1$個 $2$ cycle的旋轉($180 degree$)，e.x. $g = (1,2)(3,4)$  
  - $2$個 $3$ cycle的鏡射(對角線的鏡射)，e.x. $g = (1)(3)(2,4)$ 
  - $2$個 $2$ cycle的鏡射(中線的鏡射)，e.x. $g = (1,3)(2,4)$  
  所以我們有
  $
    r &= 1/8 (n^4 + 2n + n^2 + 2n^3 +2n^2) \
    r &= 1/8 (n^4 + 2n^3 + 3n^2 +2n)
  $
]

#example[
  #let mg = $m_g$
  我們現在有$n$個顏色，幫一個正六面體上色，可以通過旋轉變換得到視為相同的著色方式。總共有多少種不同的著色方式？
  #grid(
    columns: (1fr,1fr),
    rows: (auto),
    align: center,
    cetz.canvas(length: 1.3cm,{
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
    cetz.canvas(length: 1.3cm,{
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
  讓$D$是正六面體的對稱群，我們根據之前的討論，我們知道$abs(D) = 24$，我們討論裡面的變換：
  + 單位變換:$(1)(2)(3)(4)(5)(6)$
  + 過對面中點轉軸旋轉$90degree,270degree$，如:$(1,2,3,4)(5)(6)$，共 6 個。
  + 過對面中點轉軸旋轉$180degree$，如:$(1,3)(2,4)(5)(6)$，共 3 個。
  + 過對邊中點轉軸旋轉$180degree$，如:$(1,5)(3,6)(2,4)$，共 6 個。
  + 過對頂點轉軸旋轉$120degree,240degree$，如:$(1,5,4)(2,3,6)$，共 8 個
  所以我們有
  $
    r &= 1/24 (n^6 + 6n^3 + 3n^4 + 6n^3 + 8n^2) \
    r &= 1/24 (n^6 + 3n^4 + 12n^3 + 8n^2)
  $
]
#example[
  在旋轉的對稱性下，用$n$個顏色對一個正四面體的*邊*上色，總共有多少種不同的著色方式？
  #figure[
    #image("../pic/summer_camp/image.png",width: 11em)
  ]

  我們讓$G$是正四面體的對稱群，我們通過軌道-穩定子定理，我們可以得到$abs(G) =12$
  我們討論裡面的對置換：
  - 單位變換:$(1)(2)(3)(4)(5)(6)$
  - $8$個以一面中點的垂線為轉軸的旋轉:$(1,2,3)(4,5,6)$
  - $3$個以過兩對邊中點的轉軸旋轉:$(1)(6)(2,4)(5,3)$

  所以我們有
  $
    r = 1/12 (n^6 + 8n^2 + 3n^4) 
  $


]

== 練習
#exercise[
  對於正$n$邊形的對稱群$D_n$，$abs(D_n)$是多少?
]

#exercise[
  有$n$個不同顏色的珠子，我們要把這些珠子串成一串$6$個珠子的項鍊，可以通過旋轉變換得到視為相同的項鍊。總共有多少種不同的項鍊？
  #figure[
    #diagram(
      node-stroke: 1pt,
      {
      for t in range(6).map(i => i/6*360deg) {
        node((calc.cos(t),calc.sin(t)),[#v(0.1em)],shape: circle)
        edge((calc.cos(t),calc.sin(t)),(calc.cos(t+60deg),calc.sin(t+60deg)),
          bend: 30deg)
      }
    })
  ]
  #set enum (numbering: al("a)"))
  + 對稱群的order是多少？
  + 對稱群的元素有哪些？ 每個元素有幾個循環？
  + 有多少種不同的著色方式？
]

#exercise[
  在旋轉的對稱性下，用$n$個顏色對一個正四面體的*面*上色。    
  #set enum (numbering: al("a)"))
  + 對稱群的order是多少？
  + 對稱群的元素有哪些？ 每個元素有幾個循環？
  + 有多少種不同的著色方式？

]

#exercise[
  有$3$個顏色，幫一個正六面體上色，*每個顏色上兩個面*，可以通過旋轉變換得到視為相同的著色方式。總共有多少種不同的著色方式？
]