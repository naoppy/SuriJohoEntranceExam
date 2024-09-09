#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2017, 5, "Naoya Yamamoto", "線形代数", "normal", doc)

#overview[
  グラフの性質を隣接行列やグラフラプラシアンなどで線形代数に落とし込んで調べるスペクトルグラフ理論っぽい感じの問題。
]

== (1)
$A^k$ の第 $(i,j)$ 成分は頂点 $i$ から頂点 $j$ への長さ $k$ の相異なるパスの本数を表す。

== (2)
$A$ の相異なる固有値を $alpha_1,..., alpha_k in CC$ とする。$A$ は対称行列なので対角化可能であることに注意すると、
  $
    (A - alpha_1 I) ... (A - alpha_k I) = O
  $
  よって $a_1,...a_k in CC$ を用いて、
  $
    A^k + a_1 A^(k-1) + ... + a_k I = O
  $
  ある2頂点 $(i,j)$ 間の距離が $k$ 以上で、$k+l$（$l >= 0$）であるとすると、
  $
    A^(k+l) + a_1 A^(k + l -1) + ... + a_k A^l = O
  $
  だが、距離の定義から $A^l,..., A^(l+k-1)$ の $(i,j)$ 成分は $0$ であり $A^(k+l)$ の $(i,j)$ 成分は $0$ でないので、左辺の $(i,j)$ 成分は $0$ でなく、矛盾。\
  よって、任意の2頂点間の距離は $A$ の相異なる固有値の個数より小さい。

== (3)
$L$ の非零固有値 $alpha$ と対応する固有ベクトル $u = (u_1,..., u_n)^top$ を任意にとる。
  $
    alpha mat(1, ... ,1) u &= mat(1, ... ,1) alpha u\
    &= mat(1, ... ,1) L u\
    &= (L mat(1;dots.v;1))^top u\
    &= 0
  $
$alpha != 0$ なので $sum_(i=1)^n u_i = (1, ... ,1) u = 0$ である。
== (4)
$L$ は対称行列なので固有値は実数である。\
任意の $x in RR^n$ に対して、
  $
    x^top L x &= sum_(i=1)^n d_i x_i^2 - sum_(i,j) A_(i j) x_i x_j \
    &= sum_(i,j) A_(i j)(x_i^2 - x_i x_j) \
    &= sum_(i, j) A_(i j) 1/2(x_i - x_j)^2 \
    &>= 0
  $
したがって $L$ は半正定値なので固有値は非負実数である。

== (5)
(4) より
$
  V &= 1/2 sum_(i < j) A_(i j)(x_i - x_j)^2 \
  &= 1/4 sum_(i, j) A_(i j)(x_i - x_j)^2 \
  &= 1/2 x^top L x
$
より、$x(t) = (x_1(t),..., x_n (t))^top$ は、
$
  dv(x, t) = - grad V(x) = - L x
$
に従うので、解は $x(t) = e^(-t L) x(0)$ である。\
$G$ は連結なので $L x = 0$ の解は $x = k (1,...,1)^top thick (k in RR)$ のみであることから、$L$ の $0$ 固有ベクトルは $k (1,...,1)^top thick (k in RR without {0})$とかける。(4) より $L$ の固有値は非負なので、$x(t)$ の $0$ 固有ベクトルの成分以外は $t -> infinity$ で $0$ に収束する。
$0$ 固有ベクトルの成分は、$c^T bold(1) / norm(bold(1)) = 1/n sum_i c_i$ なので、
$
  lim_(t -> infinity) x(t) = 1/n sum_(i=1)^n c_i (1,...,1)^top
$
収束の速さは指数的である。
