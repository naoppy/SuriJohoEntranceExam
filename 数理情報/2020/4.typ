#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq
#show: doc => mytemplate(2020, 4, "Naoki Otani", "解析", "easy", doc)
#import "@preview/physica:0.9.3": *
#let emn = $e(m, n)$

#overview[
  離散フーリエ変換っぽい。良問。よく知らないのですが、おそらく微分方程式を行列表示したときに、定数係数行列が巡回行列になることから、$emn$ などが出てきているのだと思われます(巡回行列の固有値を参照のこと)。
]

== (1)
$x(n, t) = emn f_m (t)$ は既に周期性条件を満たしている。なので、最初の条件を満たすようにすればよい。最初の条件に代入すると、
$ dv(f_m (t), t) &= ((e(m, n-1))/(e(m, n)) + (e(m, n+1))/(e(m, n)) - 2) f_m (t) \
&= 2 (cos((2 pi m) / N) - 1) f_m (t) \
&= -4sin^2 ((pi m) / N) f_m (t) \
$
初期条件も考慮しつつ解いて、$f_m (t) = C_m exp(-4 sin^2 ((pi m) / N) t) $

== (2)
(1) より、$x(n, t) = sum_(m=0)^(N-1) emn f_m (t)$ の形であることが予想できる。
初期条件を入れると、
$ x(n, 0) &= sum_(m=0)^(N-1) emn f_m(0)\
&= sum_(m=0)^(N-1) emn C_m \
&= g_n quad (n = 0, 1, dots, N-1)
$
となる。よって、目標は $C_m$ を $g_n$ を使って表すことである。$C_m$ の情報は $emn$ と畳み込まれて $g_n$ に入っているので、$g_n$ から取り出すには $emn$ を上手いこと逆変換のように畳み込めばよいというアイデアが生まれてくる。

実際、
$ sum_(j = 0)^(N-1) e^(i (2pi)/N i j) &= sum_j e(i, j) \
&= cases(
0 & (i eq.not 0),
N & (i = 0)
)\
&= N delta_i
$
であることに注目すると、
$
1/N sum_n g_n e(-m', n) &= sum_m C_m 1/N sum_n e(m-m', n)\
&= sum_m C_m delta_(m - m') \
&= C_(m')
$
となる。よって $C_m = 1/N sum_n g_n e(-m, n)$ で、$x(n,t) = sum_m e(m, n)C_m exp(-4sin^2 (pi m)/N t)$ が解である。


== (3)
(2) より、
$ lim_(t -> infinity) x(n, t) = C_0 = 1/N sum_n g_n $ と平均に収束する。