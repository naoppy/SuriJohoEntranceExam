#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2017, 2, "Naoya Yamamoto", "確率", "Easy", doc)

#overview[
  確率漸化式の問題でここ数年の中でもかなり優しい部類の問題だと思う。この問題を選べたらラッキー。骨が無さすぎて不安になるレベル。
]

== (1)
$n$ 回目に投げるコインが $A$ である確率を $p_n$ とおくと、
  $
    p_(n+1) &= theta_A p_(n) +  (1- theta_B)(1 - p_n)\
    p_1 &= 1/2
  $
である。
  $
    p_(n+1) - (1 - theta_B)/(2 - theta_A - theta_B) = (theta_A + theta_B - 1)(p_(n) - (1 - theta_B)/(2 - theta_A - theta_B))
  $
より、
  $
    p_n &= (1 - theta_B)/(2 - theta_A - theta_B) + (theta_A + theta_B - 1)^(n-1) (1/2 - (1 - theta_B)/(2 - theta_A - theta_B))\
    &= (1 - theta_B)/(2 - theta_A - theta_B) + (theta_A + theta_B - 1)^(n-1) (theta_B - theta_A)/(2(2 - theta_A - theta_B))
  $

== (2)
$n+1$ 回目にコインを投げたとき、$n$ 回目に投げたときから表の回数が増えるのは、
 - $n+1$ 回目に投げるコインが A で、かつ表が出る
 - $n+1$ 回目に投げるコインが B で、かつ表が出る
ときなので、
  $
    H(n+1) = H(n) + theta_(A) p_(n+1) + theta_B (1- p_(n+1))
  $
よって、
  $
    (H(n))/n = H(1)/n + 1/n sum_(k=1)^(n-1) (theta_B + (theta_A - theta_B) p_(n+1))
  $
チェザロ平均の性質：${a_n}_(n>=1) union {alpha} subset RR$ に対して、$n -> infinity$ のとき、
  $
    a_n -> alpha => 1/n sum_(k=1)^n a_n -> alpha
  $
より、
  $
    lim_(n -> infinity) (H(n))/n &= lim_(n -> infinity) (theta_B + (theta_A - theta_B) p_(n+1))\
    &= theta_B + (theta_A - theta_B) (1 - theta_B)/(2 - theta_A - theta_B)\
    &= (theta_A + theta_B - 2 theta_A theta_B)/(2- theta_A - theta_B)
  $
ただし $0 < theta_A + theta_B < 2$ より $|theta_A + theta_B - 1| < 1$ であることに注意。

== (3)
  $
    (theta_A + theta_B - 2 theta_A theta_B)/(2- theta_A - theta_B) - (theta_A + theta_B)/2 &= (theta_A - theta_B)^2/(2(2 - theta_A - theta_B))
  $
$theta_A != theta_B$ のとき、これは正なので、
  $
    lim_(n -> infinity) (H(n))/n > (theta_A + theta_B)/2
  $
