#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2018, 3, "Naoki Otani", "最適化", "hard", doc)
#import "@preview/physica:0.9.3": *

#overview[
  球面上での最適化問題を緩和して解く問題。
  巡回行列の固有値と固有ベクトルについて知っておく必要があるだろう。
]

== (1)
(P1) と (P2) の目的関数の形を揃えたのち、(P1) の実行可能解は (P2) の実行可能解であることを示す。

(P1) の目的関数を書き換えると、$sum_i sum_j c_(i j) p_i^T p_j = sum_i sum_j c_(i j) (P^T P)_(i j) = angle.l C, P^T P angle.r$
ここで、$P = (p_1, dots.c, p_n) in RR^(n times n)$
さて、$P^T P$ は $x^T P^T P x = norm(P x)_2^2 >= 0$ より半正定値対称行列であり、$p_i$ は単位球面上にあるので、対角成分は $norm(p_i)_2^2 = 1$ である。
よって、(P1) の実行可能解 $P$ に対して $P^T P$ は (P2) の実行可能解で、目的関数値が等しい。よって、(P2) の最適値は (P1) の最適値以上である。

== (2)
