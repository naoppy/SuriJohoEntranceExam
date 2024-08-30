#import "../../template.typ": mytemplate, overview, warning, opt_problem, numeq
#show: doc => mytemplate(2019, 4, "Naoki Otani", "解析", "easy", doc)

#overview[
  行列指数関数についての問題。
]

== (1)
=== (1-1)
$
  norm(e^X) &= norm(sum_k 1/k! X^k) \
  &<= sum_k 1/k! norm(X^k) \
  &= e^(norm(X))
$
2行目に行列のL2ノルムの三角不等式 $norm(X + Y) <= norm(X) + norm(Y)$ を用いた。

=== (1-2)
$
  norm(X) e^(norm(X)) &= sum_(k>=0) 1/k! norm(X)^(k+1) \
  &>= sum_(k >= 0) 1/(k+1)! norm(X)^(k+1) \
  &= sum_(k >= 1) 1/k! norm(X)^k \
  &>= norm(sum_(k >= 1) 1/k! X^k) \
  &= norm(e^X - I)
$

=== (1-3)
$
  norm(X)^2 e^(norm(X)) &= sum_(k>=0) 1/k! norm(X)^(k+2) \
  &>= sum_(k >= 0) 1/(k+2)! norm(X)^(k+2) \
  &= sum_(k >= 2) 1/k! norm(X)^k \
  &>= norm(sum_(k >= 2) 1/k! X^k) \
  &= norm(e^X - X - I)
$

こういうのは楽そうな方向からやったほうが良いと友人に言われたが、なるほど右辺から変形すると非常に簡単である。左辺から変形するとかなり骨が折れるのでおすすめしない(できはする)。

== (2)
$A$ と $B$ が可換でない場合の差の評価である。誘導があるので最初の変形がわかる。あとは結構雑に評価してもいい。

$
  norm(P^m - Q^m) &<= norm(sum_(i=0)^(m-1) P^i (P - Q) Q^(m-1-i)) \
  &<= sum_(i=0)^(m-1) norm(P^i) norm(P - Q) norm(Q^(m-1-i))
$
さて、$norm(P^i) <= norm(P)^i = norm(e^((A+B)/m))^i <= exp(i/m (norm(A + B)))$。
同様に、$norm(Q^(m-1-i)) <= exp((m-1-i)/m (norm(A) + norm(B)))$ である。
これらを代入して、
$
  norm(P^m - Q^m) &<= norm(P-Q) sum_(i=0)^(m-1) exp(i/m (norm(A + B))) exp((m-1-i)/m (norm(A) + norm(B))) \
  &= norm(P-Q) sum_(i=0)^(m-1) exp((m-1)/m (norm(A + B))) \
  &= m norm(P-Q) exp((m-1)/m (norm(A + B)))
$

== (3)
一見難しそうだが、ただ代入するだけである。$A, B$ は可換とは限らないことに注意する ($e^(A + B) != e^A e^B$)。これは簡単すぎるので解答は省略する。

== (4)


== (5)