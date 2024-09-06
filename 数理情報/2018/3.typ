#import "../../template.typ": mytemplate, overview, warning, opt_problem, technique
#show: doc => mytemplate(2018, 3, "Naoki Otani", "最適化", "normal", doc)
#import "@preview/physica:0.9.3": *

#overview[
  球面上での最適化問題を緩和して解く問題。
  巡回行列の固有値と固有ベクトルについて知っておく必要があるだろう。
]

#let abrace(f_1, f_2) = $lr(angle.l #f_1, #f_2 angle.r)$

== (1)
(P1) と (P2) の目的関数の形を揃えたのち、(P1) の実行可能解は (P2) の実行可能解であることを示す。

(P1) の目的関数を書き換えると、$sum_i sum_j c_(i j) p_i^T p_j = sum_i sum_j c_(i j) (P^T P)_(i j) = abrace(C, P^T P)$
ここで、$P = (p_1, dots.c, p_n) in RR^(n times n)$
さて、$P^T P$ は $x^T P^T P x = norm(P x)_2^2 >= 0$ より半正定値対称行列であり、$p_i$ は単位球面上にあるので、対角成分は $norm(p_i)_2^2 = 1$ である。
よって、(P1) の実行可能解 $P$ に対して $P^T P$ は (P2) の実行可能解で、目的関数値が等しい。よって、(P2) の最適値は (P1) の最適値以上である。

== (2)
#technique[
  $P_4 = mat(0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1;1,0,0,0)$ のような形の行列を巡回置換という。巡回置換の性質として、
  1. $P_n^m P_n^m = P_n^(n+m)$
  2. $(P_n^m)^T = P_n^(n-m) = P_n^(-m)$
  3. $(P_n^m)^(-1) = P_n^(n-m) = P_n^(-m)$
  などが成り立つ。2, 3より、$P_n^m$ は直交行列である。

  巡回置換 $P$ の固有値と固有ベクトルは、$det(lambda I - P) = lambda^n - 1 = 0$ より、$lambda = exp((i 2pi k)/n) = omega^k quad (k=0, 1, dots, n-1)$ である。対応する固有ベクトルは、$bold(x)_k = (1, omega^(k), omega^(2 k), omega^(3 k), dots, omega^((n-1) k))^T$ である。この固有ベクトルを正規化すると、$bold(beta)_k = bold(x)_k / sqrt(n)$ となる。
  さらに、この固有ベクトルは直交する。$bold(beta)_k^* bold(beta)_m = delta_(k m)$。

  つまり、
  $
    U = mat(bold(beta)_1, dots, bold(beta)_n) = 1/sqrt(n) mat(1, 1, 1, dots.c, 1; 1, omega, omega^2, dots.c, omega^(n-1); 1, omega^2, omega^4, dots.c, omega^(2(n-1)); dots; 1, omega^(n-1), omega^(2(n-1)), dots.c, omega^((n-1)(n-1)))
  $
  は $U^* U = I$ を満たすユニタリ行列で、$P$ は
  $U^* P U = diag(1, omega, omega^2, dots, omega^(n-1))$ と対角化される。

  次に、巡回行列 $A = d_0 P^(0) + d_1 P + dots.c + d_(n-1) P^(n-1) = f(P)$ を考える。$P^k$ は $U$ で同時対角化されるので、$A$ も $U$ で対角化される。$A$ の固有値は $f(1), f(omega), f(omega^2), dots, f(omega^(n-1))$ である。

  これら巡回置換の性質、固有値/固有ベクトルとそこから巡回行列の固有ベクトル/固有値を求める手法は、一度手元で計算して理解しておくのがよいだろう。
]

ではまず、$X$ が (P2) の最適解のとき、$X' := 1/n sum_k A^(-k) X A^k$ も (P2) の最適解であることを示す。

まず、$X'$ が (P2) の実行可能解であることを確認する。今、$X$ は (P2) の最適解なので、$X$ の対角成分は $1$ で、$X$ は半正定値対称行列であることに注意する。
$X' = 1/n sum_l angle.l A^l, X angle.r A^l$ の対角成分は、$l=0$ の部分なので、$1/n angle.l I, X angle.r = 1$ である。対称行列であることは、$X' = 1/n sum_l angle.l A^l, X angle.r A^l$ において、$A^l$ の係数と $A^(n-l)$ の係数が同じであればよい。これは、$angle.l A^l, X angle.r = tr(A^(n-l) X) = tr(X A^(n-l)) = tr(X^T A^(n-l)) = angle.l X, A^(n-l) angle.r$ なので従う。
また、$x^T X' x = 1/n (A^k x)^T X (A^k x) >= 0$ より、$X'$ は半正定値である。
よって、$X'$ は (P2) の実行可能解である。

次に、目的関数値が同じであることを示す。
$
  abrace(sum_k d_k A^k, X') &= sum_k d_k 1/n sum_l abrace(A^k, A^(-l) X A^l) \
  &= sum_k d_k 1/n sum_l Tr(A^(-k)A^(-l) X A^l) \
  &= sum_k d_k 1/n sum_l Tr(A^l A^(-k)A^(-l) X) \
  &= sum_k d_k 1/n sum_l Tr(A^(-k) X) \
  &= sum_k d_k abrace(A^k, X) \
  &= abrace(sum_k d_k A^k, X)
$
途中、Trace の巡回性と $(A^k)^T = A^(-k)$ を使った。

以上より、(P2) の最適解は (P3) の形の最適解を持つ。(P3) は、(P2) に条件を付け加えたものなので、(P3) の最適値は (P2) 以下である。よって、二つの最適値は一致する。

== (3)
(2) で (P2) と (P3) が同じことを示したので、(P3) と (P4) が同じであることを示す。

まずは制約が同じであることを示す。
(P3) の制約条件より、$Y$ は巡回行列で、対角成分は全て1で、半正定値対称行列である。よって、$Y = sum_k y_k A^k$ について、$y_0 = 1, y_j = y_(n-j) forall (j >= 1)$ がわかる。/*逆に、この制約だけで巡回行列であることと、対角成分が全て1であること、対称行列であることは満たしている。*/あとは、半正定値性の制約を言い換える。ここで、半正定値 $<=>$ 全ての固有値が非負 を使う。巡回行列 $Y$ の固有ベクトルは巡回行列の係数によらず $bold(beta)_k = (1, omega^k, omega^(2 k), dots, omega^((n-1)k)), quad k=0, dots, (n-1)$ である。これは複素ベクトルだが、$Y$ は対称行列なので、固有値は実数で、固有ベクトルは実数にとれる。よって、$bold(x)_k$ の実部のみを取り出したもの $bold(x)_k^RR = (1, cos(2 pi k/n), cos(2 pi (2k)/n), dots, cos(2 pi ((n-1)k)/n))$ は固有ベクトルとなる。固有ベクトルに対応する固有値は、$Y$ の一行目に $bold(x)_k^RR$ をかけると、$1 + sum_i y_i cos ((2 pi i k)/n)$ なので、固有値が全て非負であるという条件は、$sum_i y_i cos ((2 pi i k)/n) >= -1 quad (forall k)$ になる。

次に、目的関数が同じであることを示す。
$
  abrace(C, Y) &= abrace(sum_k d_k A^k, sum_j y_j A^j) \
  &= sum_k sum_j d_k y_j abrace(A^k, A^j) \
  &= sum_k sum_j d_k y_j Tr(A^(j - k)) \
  &= sum_k sum_j d_k y_j n delta_(j k) \
  &= sum_k n d_k y_k \
  &= n d_0 + sum_(i=1)^(n-1) n d_i y_i
$
よって示された。

== (4)
これまでの結果より、(P4) の最適値は (P1) の最適値 *以上* である。一致はする保証はないが、(P4) は解きやすい形なので、とりあえず緩和問題 (P4) を解いてみて、その結果が (P1) の実行可能領域に入っていれば、(P1) の最適解が得られたことになる。その方針でいく。

#technique[
  最適化の院試では、このように緩和問題を解いてから解を元の問題に戻す手法が度々出題されるので、緩和問題の解が元の問題の実行可能領域に入っているか不安かもしれないが、取りあえず緩和問題を解いてみるのがよいだろう。
]

(P4) に $n=4, d = (0, 3, -4, 3)$ を代入すると、
#align(center, opt_problem(
  $24 y_1 - 16 y_2$,
  $
  cases(
    2y_1 + y_2 &>= -1\
    -y_2 &>= -1\
    -2y_1 + y_2 &>= -1\
    -y_2 &>= -1
  )
  $
))

が得られる。y1-y2 軸のグラフにおいて、目的関数は $8(3, -2)^T (y_1, y_2)$ なので、実行可能領域をグラフに描いて、$(3, -2)$ と内積最大化する点を考えると、$(0, -1)$ で最大値 $16$ を取る (あるいは、実行可能領域の端点全てに対し実際に目的関数値を計算して最大のものを取ってもよい。LPは端点で最適値をとるため)。
$y_1 = y_3 = 0, y_2 = -1$ より、
$
  Y = mat(1, 0, -1, 0; 0, 1, 0, -1; -1, 0, 1, 0; 0, -1, 0, 1)
$
が (P2), (P3) の最適解である。

(P1) は $Y = P^T P$ として得られたものであることを思い出し、この $Y$ から $P$ を作ることを考える。$Y$ より、$p_1, p_3$ と $p_2, p_4$ は直交する。単位球面上のベクトルであることを考えて、$p_1 = vec(1, 0, 0), p_3 = vec(-1, 0, 0), p_2 = vec(0, 1, 0), p_4 = vec(0, -1, 0)$ とすれば、$P = mat(p_1, p_2, p_3, p_4)$ は $P^T P = Y$ を満たすので、(P1) の最適解であり、(P1) と (P4) の最適値は一致し、$16$ である。