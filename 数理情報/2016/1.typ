#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2016, 1, "Naoya Yamamoto", "線形代数", "normal", doc)

#overview[
  正定値対称行列に関する最適化問題との平方根に関する問題である。(1) の存在部分と(2)では特異値分解が鍵となる。(1) の一意性の部分の証明が難しいが、(2), (3) は誘導になっているので比較的解きやすい。
]

== (1)
$A$ は正定値対称行列なので、対角行列 $Lambda = diag(lambda_1,..., lambda_n)$（ただし、$lambda_1,...,lambda_n > 0$ ）と直交行列 $P$ を用いて、$A = P Lambda P^top$ とかける。\
ここで、$Lambda^(1/2) = diag(sqrt(lambda_1),...,sqrt(lambda_n))$ として、$R = P Lambda^(1/2) P^top$ とおけば $R$ は正定値対称行列で $R^2 = A$ を満たす。\
このように定めた $R$ が一意であることを示す。
#footnote[
  正直見通しの良い解法は思いつかなかった。ごちゃごちゃやってたら解けたって感じの解き方になってしまっている。
]
$n$ 次正定値対称行列 $R, tilde(R)$ が $R^2 = tilde(R)^2$ を満たすとき $R = tilde(R)$ であることを示せば良い。\
$lambda > 0$ を $R$ の固有値、$p$ を対応する固有ベクトルとする。$tilde(R)^2 p = R^2 p = lambda^2 p$ であることと、$tilde(R)$ が正定値対称であることに注意して、
  $
    0 &<= ((tilde(R) - lambda)p)^top ((tilde(R) - lambda)p) \
    &= p^top (tilde(R)^2 - 2 lambda tilde(R) + lambda^2) p \
    &= 2lambda p^top (lambda - tilde(R))p\
    0 &<= ((tilde(R) - lambda)p)^top tilde(R) ((tilde(R) - lambda)p) \
    &= p^top (tilde(R)^3 - 2 lambda tilde(R)^2 + lambda^2 tilde(R)) p \
    &= 2lambda^2 p^top (tilde(R) - lambda)p\
  $
$lambda > 0$ から、$p^top (lambda - tilde(R)) p = $ なので、
  $
    0 &= 2lambda p^top (lambda - tilde(R))p \
    &=((tilde(R) - lambda)p)^top ((tilde(R) - lambda)p)
  $
したがって、$(tilde(R) - lambda)p = 0$ である。
よって $R$ と $tilde(R)$ の固有値とそれに対応する固有ベクトルは一致するので $R = tilde(R)$である。

== (2)
$B$ の特異値分解を $B = U Sigma V^top$ とする。（$U,V$は直交行列、$Sigma = diag(sigma_1,...,sigma_n)$ は成分が非負の対角行列。）トレースの巡回性より、
  $
    f(Q B) &= tr(Q U Sigma V^top) \
    &= tr((V^top Q U) Sigma)
  $
$Q$ が直交行列全体をとるとき、$tilde(Q) = V^top Q U$ もまた直交行列全体をとる。$tilde(Q) = (tilde(q_(i j)))$ とおくと、$tilde(Q)$ の各列は正規直交基底となるので、
  $
    f(Q B) &= tr((V^top Q U) Sigma) \
    &= sum_(i=1)^n sigma_i tilde(q_(i j)) \
    &<= sum_(i=1)^n sigma_i
  $
等号の成立は $tilde(Q) = I$ であるときに限る。よって $f(Q)$ を最大にするのは $Q = V U^top$ である。\
 ここで $B^top B = V Sigma^2 V^top, B B^top = U Sigma^2 U^top$ と (1) での正定値行列の平方根の構成に注意して、
  $
    sqrt(B^top B)^(-1) B^top &= (V Sigma V^top)^(-1) (U Sigma V^top)^top\
    &= V U^top\
    B^top sqrt(B B^top)^(-1) &= (U Sigma V^top)^top (U Sigma U^top)^(-1) \
    &= V U^top
  $
すなわち、$f(Q)$ を最大にする $Q$ は、
  $
    Q = sqrt(B^top B)^(-1) B^top = B^top sqrt(B B^top)^(-1)
  $
を満たす。

== (3)
n次正定値対称行列 $G,H$ と $L G L^top = H$ を満たす $L$ に対して、
  $
    g(L) &= tr((I - L) G (I - L)^top) \
    &= tr(G) + tr(H) - 2 tr(L G)
  $
よって、$tr(L G)$ を最大化することを考えれば良い。\
  $
    L G L^top = H &<=> (sqrt(H)^(-1) L sqrt(G)) (sqrt(H)^(-1) L sqrt(G))^top = I
  $
より、$Q = sqrt(H)^(-1) L sqrt(G)$とおいて $Q$ が直交行列という条件のもとで $tr(L G) = tr(Q sqrt(G) sqrt(H))$ を最大化することを考えれば良い。(2) より、これを最大にする $Q$ は、
  $
    Q &= sqrt((sqrt(G) sqrt(H))^top sqrt(G) sqrt(H))^(-1) (sqrt(G) sqrt(H))^top \
    &= sqrt(sqrt(H) G sqrt(H))^(-1) sqrt(H) sqrt(G)
  $
であるので、$L = sqrt(H) sqrt(sqrt(H) G sqrt(H))^(-1) sqrt(H)$ が求めるものである。
