#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2023, 4, "Riku Yaegashi", "統計・解析", "hard", doc)

#overview[
  (3)が非常に難しいです.別の方の回答を参考にしました. (1),(2),(4)は簡単なので, 当日解くかは悩む問題です.
]
== (1)
// 確率変数$X$が$N(0,1)$に従うとし, 確率変数$ Y = 1 / X^2 $が従う分布の確率密度関数を$f(y)$と定めるとき, $f(y)$を求めます.

$Y= 1 / X^2$の変数変換を行うと, これは全単射ではないので, $f(x)dif x = f(y) (dif x)/(dif y) dif y$ は成立しません.

そこで定義に従って計算します. $y>0$ に注意します.

$
  P(Y<=y) &= P(1/X^2 <= y) = P (X <= -1/sqrt(y), 1/sqrt(y)<= X) = 2integral_(1/sqrt(y))^infinity 1/sqrt(2pi)e^(-1/2x^2)dif x =2( 1 - Phi(1/sqrt(y)) ) \
  f(y) &= (dif)/(dif y)P(Y<=y) = - 2 (dif)/(dif y)Phi(1/sqrt(y)) = -2(1/sqrt(2pi)e^(-1/(2y)))(-1/2y^(-3/2)) = 1/sqrt(2pi) y^(-3/2)e^(-1/(2y))
$
== (2)
ラプラス変換の微分を求めます.
$ 
  dif /(dif u) integral_0^infinity e^(-u y)1/sqrt(2pi) y^(-3/2)e^(-1/(2y))dif y = integral_0^infinity 1/sqrt(2pi)( -y e^(-u y -1/(2y))y^(-3/2))dif y
$
このままでは, 計算できないので, 上手く変数変換します.指数の中身を変えないような変換を考えると, $1/y->2u z$ の変換を思いつくことは難しくないでしょう. $-1/y^2dif y = 2u dif z, u>0, y > 0$ も考慮して,
$
  =integral_infinity^0 1/sqrt(2pi)( - sqrt(2u z)e^(-1/(2z)-u z)(-2u 1/(2u z)^2dif z)) = - 1/(sqrt(2u)) integral_0^infinity 1 / (sqrt(2pi))z^(-3/2)e^(-u z -1/(2z)) = - 1/(sqrt(2u))L(u)
$
== (3)
$u>0$ でのラプラス変換は微分方程式を解くとすぐにわかります. 問題は, どのように複素数でに定義するかです.

まずは, $u>0$ で
$
  1 / L dif/(dif u)L = - 1/(sqrt(2u)) \
  log L = - sqrt(2) u^(1/2) + C \
  L = A exp(-sqrt(2u))
$
初期条件 $u = 0$ で1より
$
  L = exp(-sqrt(2u))
$
次に複素数に拡張します.

そもそも求めたいものは
$
  integral_0^infinity e^(i u y) 1/sqrt(2pi) y^(-3/2)e^(-1/(2y))dif y
$
です. $u$ を複素数に拡張して, 複素平面でこの関数を計算し, 実軸に対応する部分が求める答えになります.この関数は虚軸正部分 $u = i u^', u^'>0$ で $L = exp(-sqrt(2u^'))$ に一致します. この関数は, 分枝を除いて正則なので, 複素関数の一致の定理を用いて拡張することができます.

$L^' (z)= exp(-sqrt(2e^(-pi/2) z))$ として分枝は虚軸負の方向に取っておき, $L^' (i u) = exp(-sqrt(2u))$ となるようにします.

このとき, $z = R e^(i phi), -pi/2<=phi <3/2pi$ とします. この時実際に $phi = pi/2$ であると, $L = exp(-sqrt(2R))$ となります.

$u$ が実数であることからもう少し表式を綺麗にしていきます. $u = 0$ の時はもちろん $1$ です. $u>0$ のとき,極座標表示すると $u = u e^(i 0)$ となります. これを代入して計算すると,
$
  L(u) = exp(-sqrt(2u)sqrt(e^(-i pi/2))) = exp(-sqrt(2u)e^(-i pi/4)) = exp(-(sqrt(2u)) (1- i) /sqrt(2)) = exp((-1 + i)sqrt(u))
$
$u<0$ の時は $z = (-u) e^(i pi)$ よりこれを代入し, 同様の計算をすると
$
  L(u) = exp(-(1 + i)sqrt(-u))
$
となる.
== (4)
確率変数 $1/n^2sum_(i=1)^n Y_i $ が分布収束することを示し, 極限分布の確率密度関数を答えよ.

特性関数を考え, 特性関数の $n->infinity$ での収束先を考えます.特性関数の $u>0$ で考えますが, 他でも同様です.
$
E[e^(i u 1/n^2sum_(i=1)^n Y_i)] = product_(i=1)^n E[e^(i u Y_i/n^2)] = product_(i = 1)^n exp(-1 + i)sqrt(u)/n = exp(-1 + i)sqrt(u) $
よって元の関数と特性関数が一致するので, 密度関数は,$f(y)$になります.
