#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2020, 2, "Naoki Otani", "確率", "lunatic", doc)


#overview[
  いつもの指数分布。今回は観測が少し変な状況で、元の分布のパラメータを最尤推定できるかという問題。
  指数分布の無記憶性を覚えていると、(3) は思いつきやすいかもしれない。(4) は式を整理して、いくつかの計算テクニックを使う必要がある。
  難しい問題だが、教育的な問題なので是非解いてみてほしい。
]
== (1)
$
g(mu)
&= integral_0^a a f(x;mu) dif x + integral_a^infinity x f(x; mu) dif x \
&= a + mu e^(-a/mu)
$

== (2)
$g'(mu) = (1 + a/mu) exp( -a / mu) > 0$ と $g(0) = a$ より、$g(hat(mu)) = macron(Y) > a$ なる $hat(mu)$ がただ一つ存在する。

== (3)
かなり難しい。

まず、指数分布の和の分布はアーラン分布(ガンマ分布)になることを簡単に示す。
$X_1, X_2$ が平均 $mu$ の指数分布に従うとすると、$X_1 + X_2$ の密度関数は畳み込み積分により、$z mu^(-2) exp(-z/mu)$ となる。これを使って $X_1 + X_2 + X_3$ の密度関数は畳み込み積分により、$1/2 x^2 mu^(-3) exp(- x/mu)$ となる。これを一般化して、$X_1 + dots + X_n$ の分布は $x^(n-1)/(n-1)! mu^(-n) exp(-x/mu)$ となる。詳しくは2024年問4 (3) を見てほしい、別解も載っている。この分布の確率密度関数を $f(x; n, lambda)$ とする。

指数分布の無記憶性 $P(X > b | X > a) = P(X > b-a)$ は簡単に示せる。準備が終わったので、早速示していく。
$
P(M = m, macron(Y) <= b) &= binom(n, m) P(Y = a)^m P(Y > a)^(n-m) P(sum_(i=1)^(n-m) Y_i <= n b - m a mid(|) Y_i > a) \
& "ここで指数分布の無記憶性を各" Y_i "に用いて"#v(2em) \
&= dots.c P(sum_(i=1)^(n-m) Y_i <= n (b - a)) \
&= dots.c integral_0^(n(b-a)) f(x; n-m, mu) dif x \
& "ここで" Y = x/n + a "とおいて積分区間を調整すると"#v(2em) \
&= dots.c integral_a^b n f(n(y-a), n-m, mu) dif y \
$
よって
$
h(m, y; mu) = binom(n, m) (1 - e^(-a/mu))^m (e^(-a/mu))^(n-m) (y-a)^(n-m-1)/((n-m-1)!(mu/n)^(n-m)) e^(-(n(y-a))/mu)
$
となる。
指数部分を整理すると、
#numeq(
$
h(m, y; mu) = binom(n, m) (e^(a/mu) - 1)^m (y-a)^(n-m-1)/((n-m-1)!(mu/n)^(n-m)) e^(-(n y)/mu)
$) <h-def>

== (4)
順当にやれば、$h(m, y; mu)$ を $mu$ で微分して $0$ となる点が1つであればよい。しかし、これはかなり難しい。
#technique[
  確率密度の極値を探すとき、対数を取ってから微分すると楽な場合が多い。確率密度は非負かつ積の形になっている傾向があるため効果的である。
  また、解析的に零点を求めるのが難しい場合は、更に微分することで零点の存在を示せる場合がある。(1) はその誘導であると考えられる。
  また、指数分布などはパラメータの表現を、平均を表す $mu$ と逆数の $lambda$ を使い分けることで、特定の計算が楽になる場合がある。今回は $lambda = 1/mu$ とおくことで、微分が簡単になる。
]
まず、$lambda := 1/mu thick > 0$ と置いて、@h-def の対数を取ると、
$
log h(m, y; mu) &= C(m, y) + m log(e^(a lambda) - 1) + (n-m) log lambda - n y lambda
$
$lambda$ で微分すると、
$
dv(, lambda) log h = 
(m a e^(a lambda)) / (e^(a lambda) - 1) + (n-m)/lambda - n y 
$
これの零点が唯一であることを示せばよい。
解析的には求められそうにない。
もう一度微分すると、
$
dv(, lambda, 2) log h = - (m a^2 e^(a lambda)) / (e^(a lambda) - 1)^2 - (n-m)/lambda^2 < 0 
$
よって $(log h)'$ は単調減少。
また、$n>m, thick y>a$に注意して、
  $
  lim_(lambda -> +0) dv(, lambda) log h &=  infinity \
  lim_(lambda -> infinity ) dv(, lambda) log h &= m a - n y  < m (a - y) < 0
  $
より、$lambda$ に関する方程式 $dv(, lambda) log h = h' / h =  0$ は $lambda >0$ でただ一つの解 $lambda^* $ を持ち、$lambda < lambda^*$ では $h' > 0$ より $h$ は増加し、$lambda > lambda^*$ では $h' < 0$ より $h$ は減少する。したがって、$h$ は $lambda^*$ で最大値をとる。
