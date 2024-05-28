#import "./typst_packages/lecture.typ": *


#show par: set block(spacing: 0.65em)

#show: doc => conf(
  "群論",
  "陽明交大應數系營隊",
  doc)


#makeTitle()

\

在數學中，群論 (Group theory) 研究名為「群」的代數構。
群論在許多的領域都有很重要的應用。像是，倍立方、化圓為方  、三等分角，五次多項式 2 公式 i 無法解的原因都可以用群論來解釋。
另外，像是標準粒子模型、量子力學 (李群)、晶體結構、密碼學等領域也有很多群論的應用。

= 群 (Group) 


#definition[
  $angle.l G , * angle.r$是一個集合 $G$ 與一個二元運算 $* : G times G |-> G$，滿足以下條件：
  #set enum(numbering: n => [$cal(G)_#n$:])
  + 對於所有的$a,b,c in G$， $ (a*b)*c = a*(b*c) space.quad textb("結合律") $ 
  
  + 存在一個元素 $e in G$，使得對於所有的 $a in G$， $ a*e = e*a = a space.quad textb("單位元素") $
  
  + 對於每一個 $a in G$，存在一個元素 $a^(-1) in G$，使得 $ a*a^(-1) = a^(-1)*a = e space.quad textb("反元素") $
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

== 群的性質
#theorem[
  如果$G$是一個群，那*消去率*成立，即對於所有的$a,b,c in G$，
  $ a*b = a*c => b = c \
     b*a = b*c => b = c $
]
