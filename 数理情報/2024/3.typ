#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2024, 3, "Naoki Otani", "解析", "easy", doc)

#overview[
  (2)が思いつくかどうか。思いつけば一瞬で解けるので時間を他の問題に回せてかなり有利になる。
  (1)は(2)の誘導になっていることに気づければ解けるだろう。
]

== (1)
$ norm(t_(n+1) - t_n) = norm(t_(n+1) - f + f - t_n) &<= norm(t_(n+1) - f) + norm(f - t_n) \
&<= c/(n+1)^3 + c/n^3 \
&<= (2c)/n^3
$

== (2)
$cal(T)_n subset C[0, 2pi]$ と $cal(T)_n subset cal(T)_(n+1)$ 、$forall t in cal(T)_n, t' in cal(T)_(n-1)$ などに注意する。

方針としては $cal(T)_n subset C[0, 2pi]$ で $C[0, 2pi]$ が完備なので、${t'_n}$ が一様コーシー列であることを示せばよい。

$n > m >= N$ とする。
$ norm(t'_n - t'_m) &= norm(t'_n - t'_(n-1) + t'_(n-1) - t'_(n-2) + t'_(n-2) + dots.c + t'_(m+1) - t'_m) \
&<= sum_(i=m)^(n-1) norm(t'_(i+1) - t'_i) \ 
&<= sum_(i=m)^(n-1) (i+1)norm(t_(i+1) - t_i) \
&<= sum_(i=m)^(n-1) (i+1)(2c)/i^3 \
&<= sum_(i=m)^(n-1) (4 i c)/i^3 = 4c sum_(i=m)^(n-1) 1/i^2 <= (4c)/(m-1) <= (4c)/(N-1)
$
途中、$ sum_(i=m)^(n-1) 1/i^2 <= integral_(m-1)^infinity 1/x^2 d x $ を使った。
よって、任意の $epsilon > 0$ に対して $N > (4c)/epsilon + 1$ と取れば $theta$ に依らず $forall n, m >= N$ で $norm(t'_n - t'_m) < epsilon$ とできる。つまり ${t'_n}$ は一様コーシー列であることが示された。$t'_n in C[0, 2pi]$ と完備性より、コーシー列は $C[0, 2pi]$ に収束先を持ち、一様収束する。

== (3)
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#align(center)[#commutative-diagram(
  node((0, 0), $t_n$),
  node((0, 1), $f$),
  node((1, 0), $t'_n$),
  node((1, 1), $s$),
  arr($t_n$, $f$, $n->infinity$),
  arr($t_n$, $t'_n$, $d/(d theta)$, label-pos: right),
  arr($t'_n$, $s$, $n->infinity$),
  arr($f$, $s$, $d/(d theta)?$, label-pos: left),
)]
このように見れば見通しが良いだろう。微分と極限の交換ができることを言えばよい。(2)より $t'_n$ は一様収束するので微分と極限を入れ替えて、
$ s = lim_(n->infinity) t'_n = lim_(n->infinity) d/(d theta) t_n = d/(d theta) lim_(n->infinity) t_n  = d/(d theta) f $
よって $f$ は微分可能。
