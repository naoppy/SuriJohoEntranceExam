#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2024, 4, "Naoki Otani", "確率", "normal", doc)

#overview[
  指数分布の問題。最後の問題はポアソン分布を知っていれば理解しやすいだろう。ポアソン分布は、間隔が指数分布に従う事象が単位時間以内に起こる数 $N$ の分布である。
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
P(Z - Y = w) &= integral_0^infinity P(X_1 = x)P(X_2 = w + x) d x + integral_0^infinity P(X_2 = x)P(X_1 = w + x) d x \
&= 2integral_0^infinity P(X_1 = x)P(X_2 = w + x) d x \
&= 2 lambda^2 exp(-lambda w) integral_0^infinity exp(-2lambda x) d x \
&= lambda exp(-lambda w)
$)
である。最初の行の変形は $X_1 - X_2 = W, X_2 = X$ と変数変換してヤコビアンを計算すると1になるので正当化される。
畳み込み分布の計算に似ているが異なるので、解答の時は一応ヤコビアンを考えて変形が正しいことを確認したほうがいいだろう。つまり、
$ P(abs(X_1 - X_2) = w) &= P(X_1 - X_2 = w) + P(X_2 - X_1 = w)
$
としたあと、最初の項は $W = X_1 - X_2, X = X_2$ と変数変換、後ろの項は $W=X_2 - X_1, X = X_1$ として変数変換すればどちらもヤコビアンが1になるので、それぞれ $X$ で積分すると最初の行の変形になる。

== (3)
指数分布の和の分布はアーラン分布(ガンマ分布の形状パラメータを整数に限定したもの)となる。
これは畳み込み積分を使って $k=1, 2, 3$ ぐらいまで出してから一般化して数学的帰納法で示せばよい。

$X_1 + X_2$ の分布は、
$
P(X_1 + X_2 = z) &= integral_0^z P(X_1 = x) P(X_2 = z-x) d x \
&= integral_0^z lambda^2 exp(-lambda z) d x \
&= z lambda^2 exp(-lambda z)
$
$X_1 + X_2 + X_3$ の分布は、
$
P(X_1 + X_2 + X_3 = z) &= integral_0^z P(X_1 + X_2 = x) P(X_3 = z - x) d x \
&= integral_0^z x lambda^3 exp(-lambda z) d x \
&= 1/2 z^2 lambda^3 exp(-lambda z)
$
もう一般系の予想はつくだろう。$ P(X_1 + dots.c + X_n = x) =  x^(n-1)/(n-1)! lambda^n exp(-lambda x) $
である。数学的帰納法で示す部分は簡単なので割愛する。解答では書かなくても問題ないかもしれない。

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

これらの結果は直感的か？まず、$hat(lambda) = N / a$ はかなり直感的だろう。$N$ 個でだいたい $a$ になるので平均は $N / a$ と考えるのは妥当だ。そして期待値が真のパラメータ $lambda$ に一致する。バイアスが0であることを意味する。分散は $lambda / a$ だが、これは $a$ が大きく $lambda$ が小さいほど小さくなる。これも直感的である。