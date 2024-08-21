#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2024, 1, "Naoki Otani", "線形代数", "easy", doc)

#overview[
  フロベニウスノルムの2乗とtraceの関係
  $ norm(A)_F^2 = tr(A A^*) $
  と、ここからユニタリ行列に対するフロベニウスノルムの不変性
  $ norm(U A V)_F = norm(A)_F quad "where U, V is unitary matrix" $
  そして特異値分解との関係
  $ norm(A)_F^2 = sum_(i=1)^r sigma_i^2 $
  に関する問題です。
]

== (1)
/*
#align(
  center,
  opt_problem(
    $ sum_(j=1)^m w_j norm(P a_j - b_j)_2^2 $,
    maximize: false,
    variables: $ P in RR^(d times d) $,
    $ P^T P = I $,
  )
)*/
$ sum_(j=1)^m w_j norm(P a_j - b_j)_2^2 &= sum_j w_j sum_i ((P A)_(i j) - B_(i j))^2 \
&= sum_i sum_j ((P A)_(i j) - B_(i j))^2 sqrt(w_j)^2\
&= norm((P A - B) diag(sqrt(w_1), dots, sqrt(w_m)))_F^2 $

ここで、最後の行の変形は、列ごとに $sqrt(w_j)$ をかける列基本変形は右から対角行列をかける変形で行えることから従う。

よって答えは $A sqrt(W) = X, B sqrt(W) = Y, "where" sqrt(W) = diag(w_1, dots, w_m)$ となる。

== (2)
$ tr(A B^T) = sum_i sum_j a_(i j) b_(i j) $ を使って変形していく。

$ tr(P X Y^T) = sum_i sum_j (P X)_(i j) Y_(i j) $
一方で
$ norm(P X - Y)_F^2 &= sum_i sum_j (P X - Y)_(i j)^2\
&= sum_i sum_j {Y_(i j)^2 + (P X)_(i j)^2 - 2 (P X)_(i j) Y_(i j) } $
ここで、$ sum_i sum_j (P X)_(i j)^2 = tr( (P X) (P X)^T) = tr(X X^T) $ である。traceの巡回性を用いた。この項は $P$ に依らないことが分かった。
よって $norm(P X - Y)_F^2$ の最小化は、$sum_i sum_j (P X)_(i j) Y_(i j)$ の最小化に等しく、これは $tr(P X Y^T)$ の最小化と等しい。

== (3)
$ tr(P X Y^T) = tr(P U Sigma V^T) = tr(V^T P U Sigma) $
$P$ がユニタリ行列なので、$V^T P U$ もユニタリ行列。
さて、一般にユニタリ行列 $P$ と非負の対角行列 $D$ に対する $tr(P D)$ の最大化は、$P = I$ のとき最大である。これは、ユニタリ行列の対角成分の最大値が1であることから従う。
よって、$P = V U^T$ のとき最大値を取り、最大値は $tr Sigma$ である。
