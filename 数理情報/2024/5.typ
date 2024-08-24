#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2024, 5, "Naoki Otani", "算法", "normal", doc)

#overview[
  問題数が少ないのがありがたい。近似の評価の問題は、算法の問題の中ではかなり解きやすい種類の問題。
  アルゴリズムを考えたり、正当性を厳密に示す問題はそれらに比べて難しい。
]

== (1)
全ての仕事の所要時間が一様に等しいので、所用時間最小$=$1機械への割り当て数の最大値の最小化である。

1つの機械に最大で $k$ 個の仕事を割り当てる とすると、実行可能割り当てかどうかは最大流問題に帰着できる。あとは、$k$ は境界を持つので二分探索で $k$ を探索すればよい。

#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#align(center)[#commutative-diagram(
  node((0, 0), $W_1$),
  node((0, 1), $V_1$),
  node((1, 0), $dots.v$),
  node((1, 1), $dots.v$),
  node((2, 0), $dots.v$),
  node((2, 1), $dots.v$),
  node((3, 0), $dots.v$),
  node((3, 1), $dots.v$),
  node((4, 0), $W_n$),
  node((4, 1), $V_m$),
  node((2.5, -1), $S$),
)]
