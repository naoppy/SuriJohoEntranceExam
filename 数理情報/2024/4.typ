#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2024, 4, "Naoki Otani", "確率", "normal", doc)

#overview[
  指数分布の問題。最後の問題はポアソン分布を知っていれば理解しやすいだろう。ポアソン分布は、間隔が指数分布に従う事象が単位時間以内に起こる数 $N$ の分布である。
  (2) が詰まりやすいかもしれない。少し計算量が多いが、やるべきことは単純。
]

== (1)
$P(X_1 - c | X_1 >= c)$ を求めたい。
$P(X_1 >= c) = exp(-lambda c)$ なので、
$ P(X_1-c =y | X_1 >= c) &= P(X_1 = y + c and X_1 >= c) / P(X_1 >= c) = (lambda exp(-lambda (y + c)))/exp(-lambda c)\
&= lambda exp(-lambda y) $

== (2)
よくあるテクニックだが、minやmaxの分布は累積分布関数を考えるのが良い。
$Y = min(X_1, X_2)$ について、
$ P(Y >= c) &= P(X_1 >= c and X_2 >= c) = P(X_1 >= c)P(X_2 >= c)\
&= exp(-2lambda c) $
これはパラメータ $2lambda$ の指数分布の累積分布関数なので、$P(Y = y) = 2lambda exp(-2lambda y)$ である。累積分布関数を微分して出してもよい。

$Z - Y = abs(X_1 - X_2)$ であることに着目すると、
#numeq($
P(Z - Y = w) &= integral_0^infinity P(X_1 = x)P(X_2 = w + x) dif x + integral_0^infinity P(X_2 = x)P(X_1 = w + x) dif x \
&= 2integral_0^infinity P(X_1 = x)P(X_2 = w + x) dif x \
&= 2 lambda^2 exp(-lambda w) integral_0^infinity exp(-2lambda x) dif x \
&= lambda exp(-lambda w)
$)
である。最初の行の変形は $X_1 - X_2 = W, X_2 = X$ と変数変換してヤコビアンを計算すると1になるので正当化される。
畳み込み分布の計算に似ているが異なるので、解答の時は一応ヤコビアンを考えて変形が正しいことを確認したほうがいいだろう。つまり、
$ P(abs(X_1 - X_2) = w) &= P(X_1 - X_2 = w) + P(X_2 - X_1 = w)
$
としたあと、最初の項は $W = X_1 - X_2, X = X_2$ と変数変換、後ろの項は $W=X_2 - X_1, X = X_1$ として変数変換すればどちらもヤコビアンが1になるので、それぞれ $X$ で積分すると最初の行の変形になる。

== (3)
i.i.d.な指数分布の和の分布はアーラン分布(ガンマ分布の形状パラメータを整数に限定したもの)となる。
これは畳み込み積分を使って $k=2, 3$ ぐらいまで出してから一般化して数学的帰納法で示せばよい。

$X_1 + X_2$ の分布は、
$
P(X_1 + X_2 = z) &= integral_0^z P(X_1 = x) P(X_2 = z-x) dif x \
&= integral_0^z lambda^2 exp(-lambda z) dif x \
&= z lambda^2 exp(-lambda z)
$
$X_1 + X_2 + X_3$ の分布は、
$
P(X_1 + X_2 + X_3 = z) &= integral_0^z P(X_1 + X_2 = x) P(X_3 = z - x) dif x \
&= integral_0^z x lambda^3 exp(-lambda z) dif x \
&= 1/2 z^2 lambda^3 exp(-lambda z)
$
もう一般系の予想はつくだろう。$ P(X_1 + dots.c + X_n = x) =  x^(n-1)/(n-1)! lambda^n exp(-lambda x) $
である。数学的帰納法で示す部分は簡単なので割愛する。解答では書かなくても問題ないかもしれない。

== (3) 別解
畳み込み分布で示さず、特性関数を使って示す方法もある。
まず、平均 $mu = 1/lambda$ の指数分布の特性関数は簡単に計算でき、
$
phi(u) &= integral_0^infinity e^(i u x) f(x;mu) dif x\
  &= 1/mu integral_0^infinity e^(-(1/mu - i u) x) dif x\
  &= 1/(- i  mu u + 1)
$
である。i.i.d.な指数分布 $k$ 個の和 $X := X_1 + dots.c + X_k$ の特性関数 $Phi$ は単に $k$ 乗して、
$
Phi(u) = 1/(- i  mu u + 1)^k
$
ここから逆に $X$ の密度関数 $g$ を求める。逆フーリエ変換で、
$
g(x;mu) &= 1/(2 pi) integral_(- infinity)^infinity e^(- i u x)/(- i mu u + 1)^k dif u
$

と書ける。$z = -i u$ と置換して、$x > 0$ のときを考えると、複素積分の経路を下弦の月のような、半径 $R$ の左半円 $C_R$ を時計周りに回る経路で取ると、

$
g(x; mu) &= i/(2 pi mu^k ) lim_(R -> infinity) integral.cont_(C_R) e^(z x)/(z + 1/mu)^k dif z quad (x >= 0)
$

非積分関数は、$z = -1/mu$ で $k$ 位の極を持つ。これは $C_R$ 内に入っている。留数は、

$
e^(z x)/(z + 1/mu)^k &= e^(- x/mu) e^((z+1/mu)x)/(z + 1/mu)^k\
&= e^(- x/mu) sum_(n>=0) x^n/n! (z + 1/mu)^(n-k)\
$
なので、$n = k-1$ の部分を見て留数がわかる。
留数定理から、（反時計回りではないので$-1$倍されるのに注意して）
$
g(x;mu) &= i/(2 pi mu^k)(-2 pi i) e^(- x/mu) x^(k-1)/(k-1)! \
&= e^(- x/mu) x^(k-1)/(mu^k (k-1)!) quad (x >= 0)
$

$x < 0$ の場合は上弦の月、右半円に積分経路をとると、極を含まないので $0$ とわかる。

これで、$g(x; mu)$ が求まった。これはガンマ分布 $G(k, mu)$ の確率密度関数である。

== (4)
$N$ が確率変数。最尤推定量なので、$hat(lambda)(N) = arg max_lambda P(N = n | lambda, a)$ である。
ここで、
$
P(N = n | lambda, a) 
&= P(X_1 + dots.c + X_N <= a and X_1 + dots.c + X_(N+1) > a)\
&= integral_0^a P(X_1 + dots.c + X_N = c) P(X_(n+1) > a-c) d c
$
2行目の変形は(2)と同様に、$X = X_1 + dots.c + X_N, Y = X_(N+1)$ としたときの変数変換のヤコビアンが1であることで正当化される。ちゃんと言うなら長くなるが今回は省略。あとは(3)を使って具体的に計算すると、
$
P(N = n | lambda, a) 
&= integral_0^a lambda^n exp(-lambda c) c^(n-1)/(n-1)! exp(-lambda (a - c)) \
&= lambda^n a^n / n! exp(-lambda a)
$
これを $lambda$ で微分して尤度最大の $lambda$ は $hat(lambda) = N/a$ である。

さて、期待値は
$
E[hat(lambda)(N)] &= sum_(n=0)^infinity hat(lambda)(N) P(N = n | lambda, a) \
&= lambda sum_(n=0)^infinity lambda^n a^n / n! exp(-lambda a) \
&= lambda sum_(n=0)^infinity P(N = n | lambda, a) = lambda
$
となる。
二次モーメントは
$
E[hat(lambda)(N)^2]
&= sum_(n=0)^infinity n^2/a^2 P(N= | lambda, a) \
&= lambda / a sum_(k=0)^infinity (k+1)lambda^k a^k / k! exp(-lambda a) \
&= lambda / a (1 + E[N]) = lambda /a + lambda E[N/a] \
&= lambda / a + lambda E[hat(lambda)(N)] = lambda/a + lambda^2
$
よって分散は
$
lambda / a
$

これらの結果は直感的か？まず、$hat(lambda) = N / a$ はかなり直感的だろう。$N$ 個でだいたい $a$ になるので平均の逆数は $N / a$ と考えるのは妥当だ。そして期待値が真のパラメータ $lambda$ に一致する。バイアスが0であることを意味する。分散は $lambda / a$ だが、これは $a$ が大きく $lambda$ が小さいほど小さくなる。これも直感的である。