#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2020, 2, "Naoki Otani", "確率", "lunatic", doc)

#overview[
  いつもの指数分布。今回は観測が少し変な状況で、元の分布のパラメータを最尤推定できるかという問題。
  最後の問題が難しすぎるのでお手上げ。
]
== (1)
$
g(mu)
&= integral_0^a a f(x;mu) d x + integral_a^infinity x f(x; mu) d x \
&= a + mu e^(-a/mu)
$

== (2)
$g'(mu) = (1 + a/mu) exp( -a / mu) > 0$ と $g(0) = a$ より、$g(hat(mu)) = macron(Y) > a$ なる $hat(mu)$ がただ一つ存在する。

== (3)
かなり難しい。

まず、指数分布の和の分布はアーラン分布(ガンマ分布)になることを簡単に示す。
$X_1, X_2$ が平均 $mu$ の指数分布に従うとすると、$X_1 + X_2$ の密度関数は畳み込み積分により、$z mu^(-2) exp(-z/mu)$ となる。これを使って $X_1 + X_2 + X_3$ の密度関数は畳み込み積分により、$1/2 x^2 mu^(-3) exp(- x/mu)$ となる。これを一般化して、$X_1 + dots + X_n$ の分布は $x^(n-1)/(n-1)! mu^(-n) exp(-x/mu)$ となる。詳しくは2024年問4 (3) を見てほしい。この分布の確率密度関数を $f(x; n, lambda)$ とする。

指数分布の無記憶性 $P(X > b | X > a) = P(X > b-a)$ は簡単に示せる。準備が終わったので、早速示していく。
$
P(M = m, macron(Y) <= b) &= vec(n, m) P(Y = a)^m P(Y > a)^(n-m) P(sum_(i=1)^(n-m) Y_i <= n b - m a mid(|) Y_i > a) \
& "ここで指数分布の無記憶性を用いて"#v(2em) \
&= dots.c P(sum_(i=1)^(n-m) Y_i <= n (b - a)) \
&= dots.c integral_0^(n(b-a)) f(x; n-m, mu) d x \
& "ここで" Y = x/n + a "とおいて積分区間を調整すると"#v(2em) \
&= dots.c integral_a^b n f(n(y-a), n-m, mu) d y \
$
よって
$
h(m, y; mu) = vec(n, m) (1 - e^(-a/mu))^m (e^(-a/mu))^(n-m) (y-a)^(n-m-1)/((n-m-1)!(mu/n)^(n-m)) e^(-(n(y-a))/mu)
$
となる。なんだこの複雑な式は…。あってるのかも怪しい。

== (4)
$lambda$ 以外を固定したとき、$mu$ での微分が停留する点が1つだけなら良さそう。対数を取ってから微分すると楽かもしれない。が、それでも式が複雑すぎて解けなかった。
なんなんですかこの問題は。