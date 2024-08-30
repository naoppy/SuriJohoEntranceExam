#import "../../template.typ": mytemplate, overview, warning, opt_problem
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2019, 2, "Naoki Otani", "確率", "hard", doc)

#overview[
  とにかく計算が重く、複雑な問題。解かせる気がないわけではないので、順当に難しい問題。
]

== (1)
まず、$i eq.not j$ の場合を考える。
$E_X [phi(u^T X_i) phi(u^T X_j)]$ は i.i.d. 性より、$E_X [phi(u^T X_i)] E_X [phi(u^T X_j)]$ となる。

確率分布はたまたま、分散共分散行列の形より回転対象である。よって、$u = vec(norm(u)_2, 0)$ であると考えてよい。すると、
$
E_X [phi(u^T X_i)] &= integral_(-infinity)^infinity integral_0^infinity p(x_1, x_2) norm(u)_2 x_1 thick d x_1 d x_2 \
&= norm(u)_2 integral_0^infinity x_2 / sqrt(2 pi) exp(-x_2^2 / 2) d x_2 \
&= norm(u)_2 / sqrt(2pi)
$
となる。$i = j$ のときは、
$
E_X [phi(u^T X_i)^2] &= integral_(-infinity)^infinity integral_0^infinity p(x_1, x_2) norm(u)_2^2 x_1^2 thick d x_1 d x_2 \
&= norm(u)_2^2 integral_0^infinity x_2^2 / sqrt(2 pi) exp(-x_2^2 / 2) d x_2 \
&= norm(u)_2^2 / 2
$

== (1) 別解
確率変数 $x$ が、$n$ 次元正規分布に従う $x tilde N_n (mu, Sigma)$ とき、$A x + b$ が従う分布は、$N_m (A mu + b, A Sigma A^T)$ であることを使うと、$y = u^T x$ の従う分布は $N(0, norm(u)_2^2)$ である。
よって、$E[phi(y)] = integral_0^infinity y p(y) d y$ と計算できる。
あとは上と同様。回転対象などの議論が好みではない人はこちらで解くとよい。

== (2)
$
I_1 := integral_0^infinity r^3 exp(-r^2 / 2) d r = 2
$
$
I_2 &:= integral_(theta - pi/2)^(pi/2) cos(psi) cos(theta - psi) d psi \
&= 1/2 integral_(theta - pi/2)^(pi/2) cos theta + cos(2 psi - theta) d psi \
&= 1/2 ((pi - theta) cos theta + sin theta)
$
よって、積分値は
$
I = 1/(2pi) I_1 I_2 = 1/(2pi) ((pi - theta) cos theta + sin theta)
$

== (3)
問題をよく読むと $k=1$ と書いてある。
期待値の線形性と (1) の結果を使うと、
$
L(u) &= E_X [phi(u^T X)^2 + phi(u^*^T X)^2 - 2 phi(u^T X) phi(u^*^T X)] \
&= norm(u)^2 / 2 + norm(u^*)^2 / 2 - 2 E_X [phi(u^T X) phi(u^*^T X)]
$
さて、$E_X [phi(u^T X) phi(u^*^T X)]$ を考える。$u$ 方向に $x$ 軸があり、そこから $theta$ 傾けた先に $u^*$ があるような図を書いてみると、(2) を使って
$
E_X [phi(u^T X) phi(u^*^T X)] = norm(u)_2 norm(u^*)_2 I
$
と書ける。よって、
$
L(u) = (norm(u)^2 + norm(u^*)^2)/2 - 1/pi norm(u) norm(u^*) ((pi - theta) cos theta + sin theta)
$

== (4)
$u$ を極座標表示する。$u^*$ の角度が $psi$ として、$u(r, theta) = r vec(cos(theta + psi), sin(theta + psi))$ とおくと、
$
L(u) = norm(u^*)^2 / 2 + r^2 / 2 - 1/pi norm(u^*) r ((pi - theta) cos theta + sin theta)
$

これを最小化する $r, theta$ の組は、$grad L = 0$とおいて解くと、$(r, theta) = (norm(u^*), 0), (0, ...)$ の2つが候補である。
#warning[
  2次元極座標での勾配は $grad f = pdv(f, r) bold(e)_r + 1/r pdv(f, theta) bold(e)_theta$ である。
]
前者は $u = u^*$ のときで、このとき $L(u) = 0$ だが、$L(u)$ は定義より非負。よって大域的最適解である。
後者は $u= (0, 0)$ から任意の $theta$ に対して動かすと、 $pdv(L, r)$ が $theta = pi/2, -pi/2$ で符号が異なるので、局所最適解ではない。よって局所最適解は存在しない。

局所最適解をすべて列挙せよと書かれているので、他にありそうなものですが…。もしかしたら間違ってるかも。
