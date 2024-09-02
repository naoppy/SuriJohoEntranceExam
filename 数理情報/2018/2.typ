#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2018, 2, "Naoki Otani", "確率", "hard", doc)
#import "@preview/physica:0.9.3": *

#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)
#let lemma = thmbox("lemma", "Lemma", fill: rgb("#eeffee"), base_level: 0)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"), base_level: 0)
#let proof = thmproof("proof", "Proof")
#let algo = thmbox("algo", "Algorithm", fill: rgb("#eeffee"), base_level: 0)
#let coro = thmbox("corollary", "Corollary", base_level: 0, inset: (x: 1.2em))

#overview[
  確率密度を、累積分布関数の表現で考える問題。慣れると簡単ですが、最初は難しいかもしれません。
]

== (1)
KL-divergenceの定義は覚えておこう。

$
  D(P_1 |#h(0em)| P_2)
  &= integral_(-infinity)^infinity p_1(x) log(sqrt(sigma_2^2 / sigma_1^2) exp(- (x - mu_1)^2 / (2 sigma_1^2) + (x - mu_2)^2 / (2 sigma_2^2))) dif x \
  &= integral_(-infinity)^infinity 1/2 log (sigma_2^2 / sigma_1^2) p_1(x) + (- (x - mu_1)^2 / (2 sigma_1^2) + (x - mu_2)^2 / (2 sigma_2^2))p_1 (x) dif x \
  &= E[1/2 log (sigma_2^2 / sigma_1^2) - (x-mu_1)^2 / (2 sigma_1^2) + (x-mu_2)^2 / (2 sigma_2^2)] \
  &= 1/2 log (sigma_2^2 / sigma_1^2) - 1/2 + 1/(2 sigma_2^2) (sigma_1^2 + mu_1^2) - 1/(2 sigma_2^2) 2 mu_2 mu_1 + 1/(2 sigma_2^2) mu_2^2 \
  &= 1/2 (-1 + log (sigma_2^2 / sigma_1^2) + (sigma_1^2 + (mu_1 - mu_2)^2) / sigma_2^2) \
$

== (2)
X, Y は非負の確率変数であり、有限な二次モーメントを持つ。
これは、$P(X >= infinity) = 0$ を意味することに注意。後々、部分積分の際に使う。

== (2-1)
*連続な密度関数を持つなら*、密度関数は分布関数の微分であることを使う。
つまり、$p(x, y) = pdv(,x,y) P({X <= x} sect {Y <= y})$。
$
  E[X Y] 
  &= integral_0^infinity integral_0^infinity x y thick p(x, y) dif x dif y \
  &= integral_0^infinity integral_0^infinity x y thick pdv(, x, y) P({Y <= y} - P({X >= x} sect {Y <= y})) dif x dif y \
  &= integral_0^infinity integral_0^infinity -x y thick pdv(, x, y) P({X >= x} sect {Y <= y}) dif x dif y \
  &= integral_0^infinity y integral_0^infinity -x thick pdv(, x, y) P({X >= x} sect {Y <= y}) dif x dif y \
  &= integral_0^infinity y integral_0^infinity pdv(, y) P({X >= x} sect {Y <= y}) dif x dif y \
  &= integral_0^infinity integral_0^infinity y pdv(, y) (P(X >= x) - P({X >= x} sect {Y >= y})) dif y dif x \
  &= integral_0^infinity integral_0^infinity P({X >= x} sect {Y >= y}) dif y dif x \
$
と、部分積分を駆使することで示すことができる。あまりに大変である。しかも、これは同時確率分布 $P_(X Y)$ が連続であるという仮定が必要である。

ので、もう少し良い方法を紹介する。ルベーグ・スティルチェス積分を使う。ルベーグ・スティルチェス積分とは、$integral_0^infinity g(x) dif F(x)$ のような記法で書かれることが多いルベーグ積分の拡張で、確率論を勉強しているときに一度は目にしたことがあるかもしれない。これの素晴らしい点は、連続確率変数と離散確率変数の両方を同時に扱えることである。したがって、不連続な確率密度関数についても扱える (ほんと？ルベーグの分解定理より、絶対連続、特異連続な分布、離散分布に一意に分解できて、和の積分を積分の和にできる性質があるので、それで積分したらいいので良さそう)。さて、いくつかの準備の後ルベーグ・スティルチェス積分の練習をしてみよう。

#theorem("Jensenの不等式")[
  $f$ は凸関数であり、$X$ は確率変数であるとする。このとき、$E[f(X)] >= f(E[X])$ が成り立つ。
]
これの重要な系として、以下が成り立つ。
#coro[
  $E[X^2] >= E[abs(X)]^2$
]
#proof[
  Jensenの不等式で $f(x) = x^2$ として、$abs(X)^2 = X^2$ より。
]

#theorem("フビニ・トネリの定理")[
  絶対値を付けた累次積分のどちらかが計算でき、有限の値ならば、絶対値を外した重積分と累次積分は有限の値で一致する。
]

問題文の条件より、$E[X^2] < infinity$ なので、$E[abs(X)] < infinity$ がわかった。$Y$ についても同様。
よって、$E[abs(X Y)] <= E[abs(X)] E[abs(Y)] < infinity$ が分かったので、フビニ・トネリの定理より重積分は入れ替えてよい。これを後で使う。

まずは練習で、有限な二次モーメントを持つ非負変数 $X$ に対する $E[X]$ をスティルチェス積分で計算してみよう。

$
  E[X]
  &= integral_0^infinity x dif F(x) \
  &= integral_0^infinity integral_0^x dif y dif F(x) \
  &"ここで重積分の変数変換を行う" \
  &= integral_0^infinity integral_y^infinity dif F(x) dif y \
  &= integral_0^infinity P(X >= y) dif y \
$

さて、これを参考にして有限な二次モーメントを持つ非負変数 $X, Y$ に対して $E[X Y]$ を計算してみよう。
$
  E[X Y]
  &= integral_0^infinity integral_0^infinity x y thick dif F(x, y) \
  &= integral_0^infinity integral_0^infinity integral_0^x integral_0^y dif z dif w dif F(x, y) \
  &"ここで重積分の変数変換を行う" \
  &= integral_0^infinity integral_0^infinity integral_z^infinity integral_w^infinity dif F(x, y) dif z dif w \
  &= integral_0^infinity integral_0^infinity P(X >= z, Y >= w) dif z dif w \
$
このようにして、一般的かつ簡潔に示すことができた。知っておくと便利かもしれない。

== (2-2)
$E[X^2] = integral integral x^2 dif F(x, y) = integral x^2 dif F(x) = integral_0^1 (F^(-1)(U))^2 dif U$
ここで、最後は $U = F(x)$ と変数変換した。
初等的に書くと、$E[X^2] = integral integral P_(X Y) x^2 dif x dif y = integral P_1 x^2 dif x = integral (F^(-1)(U))^2 dif U$ となる。

上を踏まえたうえで式を展開すると、$E[X Y] <= E[F^(-1) (U) G^(-1) (G)]$ を示せばよいことがわかる。この式は理解しやすい。非負変数の、積の期待値の代わりに、値が大きいところ同士をかけて積分したほうが積分値が大きくなるという自然なことを意味している。

$E[X Y]$ が出てきたので、(2-1) を使って示す方針でいく。
$
  E[X Y] &= integral_0^infinity integral_0^infinity P(X >= x, Y >= y) dif y dif x \
  &<= integral_0^infinity integral_0^infinity P(X >= x) P(Y >= y) dif y dif x \
  &= E[F^(-1) (U) G^(-1) (U)]
$
嘘が多いなこれ、ダメだ