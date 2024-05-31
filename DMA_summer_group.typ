#import "./typst_packages/lecture.typ": *



// #show par: set block(spacing: 0.01em)
// #show figure: set block(spacing: 0em)
// #show par: p => [
//   // #v(-0.5em)
//   #block(fill: aqua)[
//     #p
//   ]
//   // #v(-0.5em)
//   sdds
// ]
// #show figure: f => [
//   // #block(stroke: aqua,outset: 1pt)[
//   //   #f
//   // ]
//   23dfsaaaaaaaaa
// ]

#show par: set block(spacing: 0.9em)
#show math.equation: set block(spacing: 0.9em)

#show: doc => conf(
  "群論",
  "陽明交大應數系營隊",
  doc)


#makeTitle

\
#set par(first-line-indent: 1.5em)

在數學中，群論 (Group theory) 研究名為「群」的代數構。
群論在許多的領域都有很重要的應用。像是，倍立方、化圓為方  、三等分角，五次多項式 2 公式 i 無法解的原因都可以用群論來解釋。
另外，像是標準粒子模型、量子力學 (李群)、晶體結構、密碼學等領域也有很多群論的應用。

= 群 (Group) 


#definition[
  $angle.l G , * angle.r$是一個集合 $G$ 與一個二元運算 $* : G times G |-> G$，滿足以下條件：
  #set enum(numbering: al(n => [$cal(G)_#n$:]))
  + 對於所有的$a,b,c in G$， $ (a*b)*c = a*(b*c) quad textb("結合律") $ 
  
  + 存在一個元素 $e in G$，使得對於所有的 $a in G$， $ a*e = e*a = a quad textb("單位元素") $
  
  + 對於每一個 $a in G$，存在一個元素 $a^(-1) in G$，使得 $ a*a^(-1) = a^(-1)*a = e quad textb("反元素") $
]

#example[
  我們來看一些例子：\ 
  
  - $angle.l ZZ, + angle.r$、$angle.l QQ,+ angle.r$、$angle.l RR,+ angle.r$

  - $angle.l QQ^+, times angle.r$
  
  - $angle.l ZZ_n, +_n angle.r$
]

#remark[有時候我們會省略二元運算$*$，以$G$表示一個群。]

#definition[
  讓$G$是一個群，定義$abs(G)$是$G$的元素個數，稱為$G$的*order*。
]
#definition[
  一個群$G$如果滿足交換率i.e. 對於所有的$a,b in G$，$ a*b = b*a $，則稱$G$是一個*交換群*(Abelian groups)。
]

#pagebreak()

== 群的性質
#theorem[
  如果$G$是一個群，那*消去率*成立，即對於所有的$a,b,c in G$，
  $ a*b = a*c => b = c \
     b*a = b*c => b = c $
]
#proof[
  讓$G$是一個群，$a,b,c in G$。假設$a*b = a*c$，因為$a in G$，所以$a$的反元素$a^(-1)$存在，且$a*a^(-1) = e$。
  $
    &a*b = a*c \
    => &a^(-1)*a*b = a^(-1)*a*c \
    => &e*b = e*a 
  $
]
#theorem[
  群$G$的單位元素$e$唯一。
]
#proof[
  假設存在第二個單位元素$e_2$，滿足$e_2*a = a*e_2 = a med forall a in G$，因為$e in G$，所以$e_2*e = e * e$，根據消去律$e_2 = e$。
]
#theorem[
  讓$G$是一個群，$a b in G$，那麼
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
  根據反元素的定義，$(a b)^(-1) = b^(-1) a^(-1)$
]

= 置換群

= 空間對稱群

= 作用群(Group Action)

#let gset = $G negspace textb("-set")$

#definition[
  一個群$G$對一個集合$A$的*作用*是一個映射$* : G times A -> A$，滿足以下條件：
  #set enum(numbering: al("1."))
  + 對於所有$a in A quad e a = a$
  + 對於所有$a in A$ 和 $g,h in G$，$(g h)a = g(h a)$

  在這個情況下，我們稱$A$是一個#gset。
]

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
#definition[
  讓$X$是一個#gset，讓$x in X$，$g in G$。我們定義；
  $
    Stab_G (x) = {g in G | g x = x} \
    X^g = {x in X | g x = x}
  $
  $Stab_G (x)$稱為$x$的*穩定子群*，$X^g$稱為$g$的*不動點*。
]
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
#theorem[
  讓 $X$ 是一個 #gset，$x in X$，那麼 $x$ 的軌道 $G_x = {g x mid(|) g in G}$。
]


#theorem([軌道-穩定子定理 (Orbit-Stabilizer Theorem)])[
  讓$G$是一個有限群，讓 $X$ 是一個 #gset，$x in X$，那麼 $abs(G) = abs(G_x) abs(G x)$。
] <orbit-stabilizer>

#proof[
  定義$f:G -> G_x$，$f(g) = g x$。我們證明每一個在$G_x$裡的元素都被打到$abs(Stab_G (x))$這麼多次。\
  給定一個$y in G_x$，那麼存在$h in G$使得$y = h x$。\
  如果$g in Stab_G (x)$，那$g x = x$，所以
  $
    f(h g) = h g x = h x = y
  $
  如果$g in.not Stab_G (x)$，那麼$g x != x$，所以
  $
    f(h g) = h g x != h x = y
  $
  所以$y$被打到那麼多次$abs(Stab_G (x))$，所以$abs(G) = abs(G_x) abs(Stab_G (x))$。
]
== 伯恩賽德引理 (Burnside’s Lemma)
#theorem([*伯恩賽德引理*])[
  讓$G$是一個有限群，讓$X$是一個#gset。讓$r$是$X$的軌道數，那麼
  $
    r dot abs(G) = sum_(g in G) abs(X^g)
  $
]
#proof[
  #set math.equation(numbering: "(1)")
  我們考慮數組$(g,x)$，其中$g x = x$。假設這樣的樹組有$N$個。
  對於每一個$g in G$，我們計算$(g,x)$的數量，這個數量是$abs(X^g)$。所以
  $
    N = sum_(g in G) abs(X^g)
  $
  另一方面，對於每一個$x in X$，我們計算$(g,x)$的數量，這個數量是$abs(Stab_G (x))$。所以
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
    6r &= 4^3 +4 +4 +4^2 +4^2 + 4^2
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

