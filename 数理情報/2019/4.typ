#import "../../template.typ": mytemplate, overview, warning, opt_problem, numeq
#show: doc => mytemplate(2019, 4, "Naoki Otani", "解析", "easy", doc)

#overview[
  行列指数関数についての問題。誘導が丁寧で方針で迷うことは無い。
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
(2) と比べることで、$norm(P - Q)$ を上から評価すればよいことがわかる。その評価に (3) を使う。

(3) より、
$
  norm(P - Q) &= norm(g((A+B)/m) - g(A/m) - g(B/m) - f(A/m) f(B/m)) \
  &<= norm(g((A+B)/m)) + norm(g(A/m)) + norm(g(B/m)) + norm(f(A/m) f(B/m)) \
  &<= 1/m^2 norm(A+B) e^(norm(A+B)/m) + 1/m^2 norm(A)^2 e^(norm(A)/m) + 1/m^2 norm(B)^2 e^(norm(B)/m) + 1/m^2 norm(A) e^(norm(A)/m) norm(B) e^(norm(B)/m) \
  &= 2/m^2 (norm(A) + norm(B))^2 e^((norm(A) + norm(B))/m) 
$
3行目への変形には (1) の不等式を使った。これと (2) よりただちに示される。

== (5)
解析的には、$x(t) = e^((A+B)t) x(0)$ ではあるが、$e^(A+B)$ の代わりに $e^(A/m) e^(B/m) e^(A/m) e^(B/m) dots.c$ を使うとどうなるのかという問題である。

$
  norm(x(1) - tilde(x)^(2m)) &= norm(e^(A+B) v - e^(A/m) e^(B/m) dots.c e^(A/m) e^(B/m) v) \
  &<= norm(e^(A+B)- e^(A/m) e^(B/m) dots.c e^(A/m) e^(B/m)) norm(v) \
  &= norm(P^m - Q^m) norm(v) \
  &<= 2/m (norm(A) + norm(B))^2 e^(norm(A) + norm(B)) norm(v)
$
よって $m^alpha, thick alpha in (0, 1)$ をかけて $m -> infinity$ をとれば、$norm(x(1) - tilde(x)^(2m)) = 0$。

$m->infinity$ を取るということは分割を細かくすることに相当する。$m^alpha$ を乗じているのは、分割の細かさに関する誤差のオーダーが $O(1/m)$ であることを表している(と思う)。
