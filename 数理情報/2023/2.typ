#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2023, 2, "Riku Yaegashi", "線形代数", "normal", doc)
#import "@preview/physica:0.9.3": *

#overview[
  微分方程式と正定値対称に関する問題です. 何がテーマなのかよくわからない問題です. 多次元に拡張したロジスティック関数なんじゃないですかね(適当).
  
   特に(3)などは試験中ではよくわからなくなる気がするので, 数学強者でない限りは試験中に選択しない気がします.
]

== (1)
/*
$ F_i (x) = x_i (v_i + sum_(j = 1)^n a_(i j)x_j) $
$ (dif x_i (t)) / (dif t) =F_i (x(t)) $
$ L(x) = sum_(i = 1)^n c_i [x_i^* log(x_i^* / x_i) - x_i^* + x_i] $
$ C = diag(c_1,c_2,dots,c_n) $*/
#let XSet = $Chi_n without{x^*}$
#let Ldot(func, variable, value) = $lr(dv(, variable)func|)_(variable = value)$

$dot(L)(x')<0 thick (forall x' in XSet)$ と $C A + A^T C$ が不定値であることが同値であることを示す.

$
  dot(L) (x) = Ldot(L(x(t)), t, 0)
  = lr( sum_(i=1)^n pdv(L, x_i) pdv(x_i, t) |)_(t=0)
  = sum_(i = 1)^n c_i (- x_i^* / x_i + 1) x_i (v_i + sum_(j = 1)^n a_(i j)x_j)
$

ここで $x_i (0) = x_i$ と置いた. $x_i^*$ は $F_i (x_i^*)= 0$ となるので, $v_i = - sum_(j = 1)^n a_(i j)x_j^*$
$
  dot(L)(x) &= sum_(i = 1)^n c_i (x_i - x_i^*) (sum_(j = 1)^n a_(i j) (x_j-x_j^*)) \
  &= sum_(i,j) (x_i - x_i^*)c_i a_(i j)(x_j - x_j^*) \
  &= 1/2 sum_(i,j) (x_i - x_i^*)c_i a_(i j)(x_j - x_j^*) + 1/2 sum_(i,j) (x_j - x_j^*)c_j a_(j i)(x_i - x_i^*) \
  &= (x - x^*)^T (C A + A^T C)/2 (x - x^*)
$

$C A + A^T C$ が負定値ならば, $dot(L)(x) < 0$ は自明. 
逆は, 任意の $y in RR^n without {0}$ に対し, ある $lambda > 0$ と, ある $x in XSet$ が存在して $y = lambda (x - x^*)$ と表すことができることを示せばよい.
すると, 任意の $x in XSet$ で $dot(L) < 0$ ならば, 任意の $y in RR^n without {0}$ に対して $y^T (C A + A^T C) y < 0$ なので, $C A + A^T C$ は負定値である.

#warning[
  $x$ の範囲が $XSet$ と $RR^n$ ではないので, $x - x^*$ がすべての方向を向くことができることを示す必要がある. 少なくとも, 軽く言及する必要はあるだろう.
]

ちなみに、$x^T A x  = x^T (A + A^T)/2 x thick (forall x)$ なので, 行列の定値性は対称行列でなくとも, 行列の対称要素を使えば定義することができる.

== (2)
/*
ベクトル$w$
$ H_w (z) = 1/2 sum_(i = 1)^n w_i z_i^2 $
$z = x(t) - x^*$として, 
$ (dif) / (dif t)z(t) = G(z(t))gradient H_w (z(t)) $
を満たす行列関数$G(z)$を求めよ.*/
$
  gradient H_w (z) = (w_1 z_1, w_2z_2, dots, w_n z_n)^T = W z
$

$ dv(z(t), t) &= sum_(i = 1)^n pdv(z, x_i) pdv(x_i, t) = sum_(i = 1)^n x_i (sum_(j = 1)^n a_(i j)(x_j - x_j^*)) \
&= x dot A(x-x^*) = x^T A z = X A z \
&= X A W^(-1)W z = (Z + X^*) A W^(-1)gradient H_w (z) $

よって, $G(z) = (Z + X^*) A W^(-1)$.

== (3)
/*
$z(t)in U\\{0}$ならば$(dif H_w (z(t))) / (dif t) < 0$なる開近傍$U$が存在する$w$を一つ求めよ.
*/
(2) より,
$
  (dif H_w (z(t))) / (dif t) = gradient H_w (z(t)) dot (dif z(t)) / (dif t) = gradient H_w (z)^T (X^* + Z) A W^(-1) gradient H_w (z)
$
まず, $w$ は正ベクトルから選ぶので, $z(t) = 0$ でない限りは, $gradient H_w (z)$ は非零のベクトルとなる.

いま, $(X^* + Z) A W^(-1)$ の部分にも $z$ に依存する項が入っていることが, 単純な解析ができない要因である. ここでのポイントは, 開近傍は任意であるから, 適当に $Z$ を小さくすれば, $Z$ の方はオーダーの意味で無視できるということである.

開近傍を十分小さくとることで $Z$ の各成分が $O(epsilon)$ となるようにする.
// $
//   (dif H_w (z(t))) / (dif t) = gradient H_w (z)^T X^* A W^(-1) gradient H_w (z)+gradient H_w (z)^T Z A W^(-1) gradient H_w (z)
// $
// 
// ここで $gradient H_w (z) = (w_1z_1, w_2z_2,dots, w_n z_n)$ であったことを思い出せば, $gradient H_w (z(t))$ も $O(epsilon)$ である. 
// $(dif H_w (z(t))) / (dif t)$ の第一項は $O(epsilon^2)$ , 第二項は $O(epsilon^3)$ より, 

$X^*$ は非零であるから,  開近傍を十分小さくとれば, 第二項は第一項に比べて無視できる.

そこで以下第一項のみ考える.
$
  gradient H_w (z)^T X^* A W^(-1) gradient H_w (z) = gradient H_w (z)^T W^(-1) W X^* A W^(-1) gradient H_w (z)
$
$gradient H_w (z(t)) W^(-1)$も,$z(t) = 0$ でない限り正であることに注意する. これは, $X^* A W^(-1)$を条件式が使いやすい$W X^* A$と書き換えるために行った.
// $
//   = gradient H_w (z)^T W^(-1) ((W X^* A + A^T X^* W)/2) W^(-1) gradient H_w (z)
// $
// これは, 行列が対称になるように変形した. 

さて問題の条件から $C A + A^T C$ は負定値である. ここで$W X^* = C$となるように選べば,(1)と同じ式が現れ,  $(dif H_w (z(t))) / (dif t)$ の第一項は負の値になる. 第二項が $0$ の $epsilon$ 近傍では第一項に比べて無視できることから, $W X^* = C$ が一つの解となる.明示的に書けば,
$ w_i = c_i /x_i $
となる. ここで, $x_i^*$ は問題文の条件から $x^*$ が正ベクトルであるので割ることに問題はない.
