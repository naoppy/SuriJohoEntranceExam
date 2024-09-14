#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2016, 2, "Naoya Yamamoto", "確率・統計", "normal", doc)

#overview[
  ラプラス分布に関するパラメータ推定の問題である。正規分布と違って、最尤推定量が中央値になり従って十分統計量にならない例になっている。(4) で漸近正規性を使って良いのかは微妙なところだが、まあ (3) もそこそこ難しいし別に使って楽して良いと思う。
]

== (1)
$X_1$ の平均は、
  $
    integral_(-infinity)^infinity x f(x;mu) dif x &= integral_(-infinity)^infinity x/2 exp(-|x - mu|) dif x\
    &= mu + integral_(-infinity)^infinity (x - mu)/2 exp(-|x - mu|) dif x\
    &= mu
  $
$X_1$ の分散は、
  $
    integral_(-infinity)^(infinity) (x - mu)^2 f(x;mu) dif x &= integral_(-infinity)^infinity 1/2 (x - mu)^2 exp(-|x - mu|) dif x\
    &= integral_0^infinity x^2 exp(-x) dif x\
    &= [(-x^2 - 2x - 2)exp(-x)]_0^infinity\
    &= 2
  $
$X_1,...,X_(2N+1)$ が独立同一に $f(x;mu)$ に従うことから、サンプル平均の平均は、
  $
    1/(2N+1) sum_(i=1)^(2N+1) mu = mu
  $
サンプル平均の分散は、
  $
    1/(2N+1)^2 sum_(i=1)^(2N+1) 2 = 2/(2N+1)
  $


== (2)
対数尤度 $l(mu)$ は、
  $
    l(mu) &= sum_(i=1)^(2N+1) log(f(X_i;mu))\
    &= - sum_(i=1)^(2N+1) |mu - X_i| - (2N+1) log(2)
  $
よって、$X_1,...,X_(2N+1)$ を小さい順に並べたものを $X_((1)),...,X_((2N+1))$ とすると、$mu < X_((N+1))$ で増加、$mu > X_((N+1))$ で減少するので、$hat(mu) = X_((N+1))$ すなわち中央値のとき尤度は最大になる。


== (3)
  $
    hat(mu) = X_((N+1)) <= x <=> X_1,...,X_(2N+1)  "のうち" N+1 "コ以上が" x "以下"
  $
であるので、
  $
    P(hat(mu) <= x) = sum_(k=N+1)^(2N+1) binom(2N+1, k) F(x;mu)^k (1 - F(x;mu))^(2N+1-k)
  $
よって $hat(mu)$ の確率密度関数は、
  $
    h&(x;mu) = dif/(dif x) P(hat(mu) <= x) \
    &= f(x;mu) sum_(k=N+1)^(2N+1) binom(2N+1, k) (k (1 - F(x;mu)) - (2N+1-k) F(x;mu) )F(x;mu)^(k-1) (1 - F(x;mu))^(2N-k)  \
    &= (2N+1)f(x;mu) sum_(k=N+1)^(2N+1) (binom(2N, k-1) F(x;mu)^(k-1)(1-F(x;mu))^(2N+1-k) - binom(2N, k) F(x;mu)^k (1 - F(x;mu))^(2N-k)) \
    &= (2N+1) binom(2N,N) F(x;mu)^N (1-F(x;mu))^N
  $
最後の等号は総和の中身が添字を跨いで打ち消し合うことによる。


== (3) 別解
$X_1,...,X_(2N+1)$ の確率密度関数を $hat(mu)$ 以外で周辺化することを考える。
  $
    &{hat(mu) = x} = union.big_(sigma in frak(S)_(2N+1)) {X_(sigma(1)) <= ... <= X_(sigma(N)) <= X_(sigma(N+1)) = x <= X_(sigma(N+2)) <= ... <= X_(sigma(2N+1)), X_(sigma(N)) = x } \
    &{X_1,..., X_(N) <= x} = union.big_(sigma in frak(S)_(N)) {X_(sigma(1)) <= ... <= X_(sigma(N)) <= x} \
    &{X_(N+2),..., X_(2N+1) <= x} = union.big_(sigma in frak(S)_(N)) {X_(N + 1 + sigma(1)) <= ... <= X_(N + 1 + sigma(N)) <= x} \
  $
と、$X_1,...,X_(2N+1)$ の独立同一性に注意して、
  $
    h(x;mu) &= integral_({hat(mu) = x}) product_(i=1)^(2N+1) f(x_i;mu) dif x_i \
    &= (2N+1)! f(x;mu) (integral_({x_1 <= ... <= x_N <= x}) product_(i=1)^(N) f(x_i;mu) dif x_i) (integral_({x <= x_(N+2) <= ... <= x_(2N+1)}) product_(i=N+2)^(2N+1) f(x_i;mu) dif x_i ) \
    &= (2N+1)!/((N!)^2) f(x;mu) (integral_(-infinity)^x f(xi;mu) dif xi)^N (integral_x^(infinity) f(xi;mu) dif xi)^N \
    &= (2N+1) binom(2N, N) f(x;mu) F(x;mu)^N (1 - F(x;mu))^N
  $

== (4)
$X_1$ のFisher情報量は、
  $
    integral_(-infinity)^infinity (partial/(partial mu) log f(x;mu))^2 f(x;mu) dif x &=  integral_(-infinity)^infinity (sgn (x-mu))^2 f(x;mu) dif x\
    &= integral_(-infinity)^infinity f(x;mu) dif x\
    &= 1
  $
最尤推定量の漸近正規性により、漸近分散は $1$ に収束する。

== (4) 別解
最尤推定量の漸近正規性の成立には、$f(x;mu)$ の $mu$ に関する良い微分可能性を要求することが多い。物の本では、"良い条件のもと"と誤魔化されていたり、それなりに強い条件が要求されていたりする。例えば、久保川達也先生の「現代数理統計学の基礎」
#footnote[2017, 共立出版]
では、確率密度関数 $f(x;mu)$ の $mu$ に関する3回微分可能性が条件の一つとして含まれている。\
しかしながらこの問題の確率密度関数は $x = mu$ において微分不可能である。
#footnote[
  一点でしか微分不可能でないので、超関数の微分とか導入すればもっと一般的に良いことが言えるかもしれない。
]
よって、この問いで漸近正規性を解答の根拠として用いるには、このような確率密度関数に従う確率変数の最尤推定量の漸近正規性の成立を知っている必要がある。前述の通りこれは物の本には書いてないことが多いので、実際にこの問題を例として追ってみる。\
大まかな方針としては、積分のラプラス近似法を用いることによる。ラプラス近似法とは、パラメータ $M$ に依存する積分
#footnote[
  $f$ は問題文中のものとは違う一般の積分できるような関数とする。
]
  #numeq(
  $
    I_M = integral_(a)^(b) g(x) e^(M f(x)) dif x 
  $) <integral>
の $M -> infinity$ での漸近展開を求める方法のことである。
ラプラス法では、大雑把には $f$ が最大になる点近傍で $f$ を上に凸な二次関数によって近似する。$M -> infinity$ では $f$ が最大になる点近傍の寄与が大きいだろうという発想である。\
今求めたい積分は、
  $
    (2N+1) V_(2N+1) &= (2N+1)^2 binom(2N, N) integral_(-infinity)^(infinity) (x-mu)^2 f(x;mu) F(x;mu)^N (1-F(x;mu))^N dif x\
    &= ((2N+1)^2)/(2^(2N)) binom(2N, N) integral_(0)^1 (G(z))^2 e^(N(log(z) + log(1-z))) dif z
  $
ただし、$z = F(x;mu)$ と変数変換しており、$G(z)$ は、
  $
    F(x;mu) = cases(
       1 - e^(-(x-mu)) &(x >= mu),
       e^(x-mu)/2 &(x < mu)
    )
  $
の $x-mu$ に関する逆関数で、
  $
    G(z) = cases(
       log(2z) &(0 < z <= 1/2),
       - log(2(1-z)) &(1/2 < z <1)
    )
  $
である。
#footnote[変数変換しなくても漸近展開を求めることはできるが、こちらの方が簡単になるのでこうしている。]
また、関数$log(z) + log(1-z)$ は $z=1/2$ で最大値をとることに注意する。\
$f$ は $C^3$ 級、$g$ は $C^2$ 級として、$f$ が $x=c$ （$a<c<b$）で最大値をとる場合、@integral の漸近展開は、$alpha = -(M f''(c))/2$ とおいて、
  $
    I_M = e^(M f(c)) (g(c)sqrt(pi/alpha) + (g''(c))/4 sqrt(pi/alpha^3) + (g'(c) f'''(c) M)/8 sqrt(pi/(alpha^5)) + O(M^(-5/2)))
  $
である。証明は気持ちだけならテイラー展開でできる。\
したがって、$f(x) = log(x) + log(1-x)$、$g(x) = G(x)^2$ として計算すれば良い。
  $
    f(1/2) = -2 log 2, &f''(1/2) = -8, & f'''(1/2) = 0\
    g(1/2) = 0, &g'(1/2) = 0, &g''(1/2) = 8 
  $
であることを用いれば良い。スターリングの公式 $lim_(M-> infinity) (M!)/(sqrt(2 pi M) (M/e)^M) = 1$ にも注意して、
  $
    lim_(N -> infinity) (2N+1) V_(2N+1) &= lim_(N -> infinity) (2N+1)^2 binom(2N, N) 2^(-2N+1) sqrt(pi/(64 N^3))\
    &= lim_(N -> infinity) ((2N+1)^2)/(2N)^2\
    &= 1
  $
ここでは、変数変換によってラプラス法に出てくる $f$ の特異性を $g$ に押し付けることで楽に計算したが、変数変換せずに計算するには積分区間を分けて計算すれば良い。\
この例を通して一般化ができそうではあるがここではやらない。

== (5)
サンプル平均、最尤推定量ともに一致性や不偏性、漸近正規性など良い性質を持つ。サンプル平均は十分統計量であるのに対し最尤推定量は十分統計量ではないため、サンプル平均の方がパラメータに関する情報を失っていないという点でサンプル平均の方が良い推定量であると考えられる。一方で、サンプル平均の漸近分散は $2$ であり、Cramer・Raoの不等式の下限を達成していないという点で最尤推定量の方が良い推定量であるとも言える。