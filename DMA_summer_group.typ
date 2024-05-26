#import "./typst_packages/lecture.typ": *


#show: doc => conf(
  "群論",
  "陽明交代應數系營隊",
  doc)


#makeTitle()

\

在數學中，群論 (Group theory) 研究名為「群」的代數構。
群論在許多的領域都有很重要的應用。像是，倍立方、化圓為方、三等分角，五次多項式 2 公式 i 無法解的原因都可以用群論來解釋。
另外，像是標準粒子模型、量子力學 (李群)、晶體結構、密碼學等領域也有很多群論的應用。

= 群 (Group) 


#definition[
  $angle.l G , * angle.r$是一個集合 $G$ 與一個二元運算 $* : G times G |-> G$，滿足以下條件：
  
  
]
#example[
  整數集合 $ZZ$ 與加法運算組成一個群。
]
