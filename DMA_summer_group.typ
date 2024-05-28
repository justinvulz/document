#import "./typst_packages/lecture.typ": *



// #show par: set block(spacing: 0.65em)
// #show figure: set block(spacing: 1em)

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
  讓$G$是一個群，定義$|G|$是$G$的元素個數，稱為$G$的*order*。
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

#definition[
  一個群$G$對一個集合$A$的*作用*是一個映射$* : G times A -> A$，滿足以下條件：
  #set enum(numbering: al("1."))
  + 對於所有$a in A quad e a = a$
  + 對於所有$a in A$ 和 $g,h in G$，$(g h)a = g(h a)$

  在這個情況下，我們稱$A$是一個$G negspace textb("-set")$
]

#theorem[
  讓$X$是一個$G negspace textb("-set")$。如果$g x_1 = g x_2$，那$x_1 = x_2$
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
  讓$X$是一個$G negspace textb("=set")$，讓$x in X$，$g in G$。我們定義；
  $
    Stab_(G)(x) = {g in G | g x = x} \
    X^g = {x in X | g x = x}
  $
  $Stab_(G)(x)$稱為$x$的*穩定子群*，$X^g$稱為$g$的*不動點*。

]

== 伯恩賽德引理 (Burnside’s Lemma)

== 著色多項式