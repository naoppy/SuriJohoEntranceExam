#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2017, 5, "Naoya Yamamoto", "線形代数", "normal", doc)

#overview[
  グラフの性質を隣接行列やグラフラプラシアンなどで線形代数に落とし込んで調べるスペクトルグラフ理論っぽい感じの問題。
]

== (1)
$A^k$の第$(i,j)$成分は頂点$i$から頂点$j$への長さ$k$のパスの本数を表す。

== (2)
$A$の相異なる固有値を$alpha_1,...,alpha_k$とすると、
  $
    (A - alpha_1 I) ... (A - alpha_k I) = O
  $
  よって$a_1,...a_k in CC$を用いて、
  $
    A^k + a_1 A^(k-1) + ... + a_k I = O
  $
  ある2頂点$(i,j)$間の距離が$k$以上で、$k+l$（$l >= 0$）であるとすると、
  $
    A^(k+l) + a_1 A^(k + l -1) + ... + a_k A^l = O
  $
  だが、距離の定義から$A^l,...,A^(l+k-1)$の$(i,j)$成分は$0$であり$A^(k+l)$の$(i,j)$成分は$0$でないので、左辺の$(i,j)$成分は0でなく、矛盾。\
  よって、任意の２頂点間の距離はAの相異なる固有値の個数より小さい。

== (3)
$L$の非零固有値$alpha$と対応する固有ベクトル$u = (u_1,...,u_n)^⊤$を任意にとる。
  $
    alpha mat(1, ... ,1) u &= mat(1, ... ,1) alpha u\
    &= mat(1, ... ,1) L u\
    &= (L mat(1;dots.v;1))^⊤ u\
    &= 0
  $
$alpha != 0$なので$sum_(i=1)^n u_i = (1, ... ,1) u = 0$である。
== (4)
$L$は対称行列なので固有値は実数である。\
任意の$x in RR^n$に対して、
  $
    x^⊤ L x &= sum_(i=1)^n d_i x_i^2 - 2 sum_((i,j) in E, i<j) x_i x_j\
    &= sum_((i,j) in E, i<j) (x_i - x_j)^2\ >= 0
  $
したがって$L$は半正定値なので固有値は非負実数である。

== (5)
  $
    partial/(partial x_i) V(x) &= sum_((i,j) in E) (x_i - x_j)\
    &= d_i x_i - sum_((i,j) in E) x_j
  $
より、$x(t) = (x_1(t),...,x_n(t))$は、
  $
    dif/(dif t)x(t) = - x(t) L
  $
に従うので、解は$x(t) = x(0) e^(-t L)$である。\
$G$は連結なので$x L = 0$の解は$x = k (1,...,1)$（$k in RR$）のみであることから、$L$の$0$固有ベクトルは$k (1,...,1)$（$k in RR without {0}$）とかける。$L$の固有値は非負なので、$x(t)$の$0$固有ベクトルの成分以外の成分は$t -> infinity$で$0$に収束する、すなわち、
  $
    lim_(t -> infinity) x(t) = 1/n sum_(i=1)^n c_i (1,...,1)
  $
収束の速さは、「$L$の非零固有値で$x(0)$の固有ベクトル成分が$0$でないもののうち最も小さいもの$alpha$」について$e^(-alpha t)$程度である。