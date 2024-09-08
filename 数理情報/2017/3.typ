#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2017, 3, "Naoya Yamamoto", "確率", "normal", doc)

#overview[
  確率論の基礎的な部分を問うていて、確率測度や分布関数に親しみがあれば難しくないと思う。問題文中の$R [X]$は、$X$が$p$-分位点より大きいときの$X$の条件付き期待値を表していて、期待ショートフォール、Tail VaR、Conditional VaRなどと呼ばれる。
]
== (1)
$0<u<1$ に対して、
  $
    u = 1/(1+e^(-t)) &<=> t = log (u)/(1-u)
  $
より、
  $
    R[T] &= 1/(1-p) integral_p^1 log u/(1-u) dif u\
    &= 1/(1-p) [u log u - u + (1-u) log (1-u) - (1-u)]_p^1\
    &= - 1/(1-p) (p log p + (1-p) log (1-p))
  $

== (2)
$F_X$ は連続なので、
  $
    upright(Pr) (B) &= upright(Pr) (X >= F_X^(-1)(p))\
    &= 1 - upright(Pr) (X < F_X^(-1)(p))\
    &= 1 - F_X (F_X^(-1) (p))\
    &= 1 - p
  $
また、$U = F_X (X)$ は $(0,1)$ 上の一様分布に従うので、
  $
    R[X] &= 1/(1-p) integral_p^1 F_X^(-1) (u) dif u\
    &= 1/(1-p) upright(E) [F_X^(-1) (U) I_{U >= p}]\
    &= 1/(1-p) upright(E) [X I_B]\
  $
である。また、
  $
    upright(E)[X I_A] &= upright(E) [X I_(A sect B)] + upright(E) [X I_(A without B)]\
    &<= upright(E) [X I_(A sect B)] + F_X^(-1)(p) upright(Pr) (A without B) \
    &= upright(E) [X I_(A sect B)] + F_X^(-1)(p) upright(Pr) (B without A) \
    &<= upright(E) [X I_(A sect B)] + upright(E) [X I_(B without A)]\
    &= upright(E) [X I_B]
  $
  ただし、2行目と4行目の不等号は
  $
    omega in.not B <=> X(omega) < F_X^(-1)(p)
  $
  から、3行目の等号は
  $
    upright(Pr) (A without B) &= upright(Pr) (A) - upright(Pr) (A sect B)\
    &= 1-p - upright(Pr) (A sect B)\
    &= upright(Pr) (B) - upright(Pr) (A sect B)\
    &= upright(Pr) (B without A)
  $
  から従う。

== (3)
$R[Z]$が定義されるような確率変数$Z$に対して、$B^Z = {omega in Omega | Z(omega) >= F_Z^(-1)(p)}$ とおく。\
(2)で示したことに注意して、
  $
    R[X+Y] &= E[(X+Y) I_(B^(X+Y))]/(1-p) \
    &= E[X I_(B^(X+Y))]/(1-p) + E[Y I_(B^(X+Y))]/(1-p) \
    &<= E[X I_(B^X)]/(1-p) + E[Y I_(B^Y)]/(1-p)\
    &= R[X] + R[Y]
  $
