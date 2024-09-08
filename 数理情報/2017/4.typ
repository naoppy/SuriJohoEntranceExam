#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2017, 4, "Naoya Yamamoto", "線形代数・微分方程式・漸化式", "Hard", doc)

#overview[
  行列値をとる力学系の問題。(1),(2),(3)は固有値が保存する連続な系であり、(4),(5)は固有値が保存するという構造を保つような離散版になっている。ほとんど似たようなことをすれば良いが、各々簡単にはいかず難しい。
]

== (1)
同じ大きさの行列 $A, B$ に対して、
  $
    (A, B)^top &= (A B + B A)^top = B^top A^top + A^top B^top = (A^top, B^top)\
    [A, B]^top &= (A B - B A)^top = B^top A^top - A^top B^top = - [A^top, B^top]\
    (A, B) &= (B, A)\
    [A, B] &= - [B, A]\
    -(A, B) &= (-A, B) = (A, -B)\
    -[A, B] &= [-A, B] = [A, -B]
  $
である。
  $
    dif/(dif t) X(t)^top &= (dif/(dif t) X(t))^top \
    &= [(M, X(t)), X(t)]^top\
    &= - [(M, X(t))^top, X(t)^top]\
    &= - [(M^top, X(t)^top), X(t)^top]\
    &= [(M, X(t)^top), X(t)^top]
  $
ただし、5行目の等号では $M$ が歪対称であることを用いた。\
また、$X(0)^top = X_0^top = X_0$ より、微分方程式の解の一意性から $X(t) = X(t)^top$ で $X(t)$ は対称である。

== (2)
実際に $Q X_0 Q^top$ を $(*)$ 式に代入して、$X(t)$ と同じ微分方程式に従うことを確認する。
$
  dv(, t) (Q(t) X_0 Q(t)^top)
  =& (dv(,t)  Q(t)) X_0 Q(t)^top + Q(t) X_0 (dv(,t) Q(t))^top \
  =& (M, X(t)) Q(t) X_0 Q(t)^top \
  &+ Q(t) X_0 Q(t)^top (M, X(t)) \
  =& (M, X(t)) X(t) + X(t) (M, X(t))\
  =& [(M, X(t)), X(t)] \
  =& dv(X, t)
$
さらに、$Q(0) X_0 Q(0)^T = X_0$ より初期条件も満たすので確かに $(*)$ の解であり、$X(t) = Q(t) X_0 Q(t)^top$ である。

== (3)
$Q(t)$ が直交行列だと嬉しいので、実際に確かめる。

$
  dif/(dif t) (Q(t)^top Q(t)) &= (dif/(dif t) Q(t))^top Q(t) + Q(t)^top (dif/(dif t) Q(t))\
  &= - Q(t)^top (M, X(t)) Q(t) + Q(t)^top (M, X(t)) Q(t)\
  &= 0
$
よって $Q(t)^top Q(t) = Q(0)^top Q(0) = I$、すなわち任意の $t >= 0 $ に対して $Q(t)$ は直交行列である。

$Q(t)$ が直交行列であることから、
$
  matrixdet(lambda I - X(t)) &= matrixdet(lambda Q Q^top - Q(t) X_0 Q(t)^top) \
  &= matrixdet(Q(t)) matrixdet(lambda I - X_0) matrixdet(Q(t)^top)\
  &= matrixdet(lambda I - X_0)
$
よって、$X(t)$ の固有多項式は $X_0$ の固有多項式と等しいため、$X(t)$ は $X_0$ と同じ固有値を持つ。

== (4)
帰納法で示す。\
 - $k=0$ のとき $X_0$ は対称で $Q_0 = I$ なのでok。
 - $k=l$（$l=0,1,2,...$）で $X_l, Q_l$ が一意に定まり、$X_l$ が対称行列であるとする。
 $
  (Q_(l+1) - Q_l)/(Delta t) = (M, X_l) (Q_(l+1) + Q_l)/2 <=> (I - Delta t ((M, X_l))/2)Q_(l+1) = (I + Delta t ((M, X_l))/2) Q_l
 $
$X_l$ は対称、$M$ は歪対称なので、$(M, X_l)^top = - (M, X_l)$、すなわち $(M, X_l)$ は歪対称行列である。
歪対称行列の固有値は純虚数なので $matrixdet(I - Delta t ((M, X_l))/2) != 0$ であり、$I - Delta t ((M, X_l))/2$ は可逆である。したがって $Q_(l+1)$ は一意に定まる。\
$X_(l+1) = Q_(l+1) X_l Q_(l+1)^top$ なので $X_(l+1)$ も一意に定まり、
  $
    X_(l+1)^top &= (Q_(l+1) X_l Q_(l+1)^top)^top\
    &= Q_(l+1) X_l^top Q_(l+1)^top\
    &= Q_(l+1) X_l Q_(l+1)^top\
    &= X_(l+1)
  $
で $X_(l+1)$ は対称行列である。\
したがって任意の $k=1,2,...$ に対して、$X_k, Q_k$ が一意に定まり、$X_k$ は対称行列である。

== (5)
任意の $k=1,2,...$ に対して、
  $
    D_k &:= Q_k^top Q_k - Q_(k-1)^top Q_(k-1) \
    &= (Q_k - Q_(k-1))^top Q_k + Q_(k-1)^top (Q_k - Q_(k-1))\
    &= Delta t ((M,X_(k-1)) (Q_k + Q_(k-1))/2 )^top Q_k + Delta t Q_(k-1)^top(M,X_(k-1)) (Q_k + Q_(k-1))/2\
    &= - (Delta t)/2 (Q_k^top (M, X_(k-1))Q_k - Q_(k-1)^top (M, X_(k-1)) Q_(k-1))
  $
$D_k$ は対称かつ歪対称なので $D_k = D_k^top = - D_k$ より $D_k = 0$ である。したがって $Q_k^top Q_k = Q_0^top Q_0 = I$ であり $Q_k$ は直交行列である。\
したがって、
  $
    matrixdet(lambda I - X_k) &= matrixdet(lambda I - Q_k X_(k-1) Q_k^top) \
    &= matrixdet(Q_k) matrixdet(lambda I - X_(k-1)) matrixdet(Q_k^top)\
    &= matrixdet(lambda I - X_(k-1))\
    &= matrixdet(lambda I - X_0)
  $
よって、$X_k$ の固有多項式は $X_0$ の固有多項式と等しいため、$X_k$ は $X_0$ と同じ固有値を持つ。
