#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2020, 3, "Naoki Otani", "代数", "easy", doc)

#overview[
  たまにでる代数。今回はイデアルの話。群の準同型定理における正規部分群が環におけるイデアルに対応すると覚えておけばよい。
  イデアルの定義は覚えておこう。
]

== (1)
#let phiinv = $phi^(-1)(J)$
$J$ が $L$ のイデアルとする。このとき、$phiinv$ が $R$ のイデアルであることを示す。
1. 加法で閉じていること。$forall x, y in phiinv, x + y in phiinv$ を示す。\
  $phi(x), phi(y) in J$ なので、$phi(x) + phi(y) = phi(x + y) in J$。よって、$phi(x + y) in J$ であり、$x + y in phiinv$。
  ここで、$phi$ の準同型性を使った。
2. $forall x in R, forall y in phiinv, x y in phiinv$ を示す。\
  $phi(x y) = phi(x) phi(y)$ であり、$phi(x) in L, phi(y) in J$ と $J$ がイデアルであることから、$phi(x) phi(y) in J$。よって、$x y in phiinv$

== (2)
最初の考察として、任意の元 $p in R$ に対して示すのではなく、任意の単項式 $p in R$ について示せば十分である。任意の多項式は単項式の和なので、単項式を $g_i$ と $R'$ で表せれば多項式の分解は自然と定まる。

以下のアルゴリズムで単項式を分解する。

$R$ の単項式 $p$ が $x_i y_i$ を含んでいるなら、$h_i = p/(x_i y_i)$ として、$p = h_i (x_i y_i - 1) + h_i = h_i g_i + h_i$ と分解する。ここで、$h_i in R'$ ならば終了。そうでなければ、$h_i$ は $x_j y_j$ を含んでいるので、さらに分解する。分解される多項式の次数は単調減少するので、このアルゴリズムは多くとも $n$ 回で必ず停止する。

よって示された。

== (3)
環の準同型定理を使う。$ker phi = I, op("Im") phi = L$ をいえばよい。
1. $ker phi supset I$ を示す。\
  任意の $g in I$ は各項に $g_i$ の積を含む。$phi(g)$ は $phi(g_i) = 0$ より、$phi(g) = 0$。よって、$g in ker phi$
2. $ker phi subset I$ を示す。\
  任意の $g in ker phi$ は (2) より $g = h_1 g_1 + dots.c + h_n g_n + r, r in R'$ と分解できる。$phi(g) = phi(r) = 0$ だが、$r in R'$ なので $r = 0$ である。よって $g$ は $g_1, dots, g_n$ で生成されるので、$g in I$。
3. $op("Im") phi = L$ を示す。\
  任意の $l in L$ について、$x_i^(-k)$ を $y_i^k$ に置き換えたものを $phi$ で写すと $l$ になる。よって、$l in op("Im") phi$。

あとは環の準同型定理より、$R slash I tilde.eq L$