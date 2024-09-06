#import "../../template.typ": mytemplate, overview, warning, opt_problem, technique
#show: doc => mytemplate(2018, 4, "Naoki Otani", "解析", "easy", doc)
#import "@preview/physica:0.9.3": *

#overview[
  院試では頻繁に出題される散逸系についての問題。
  散逸系とは、系にある種のエネルギー関数が定義でき、それが時間と共に減少する系のことである。これは確実な得点源にしたい。
]

== (1)
$f = 0, g = 0$ と連立する。$sin(-x) = - sin(x)$ より、$f + g$ を考えるといい感じに消えてくれそうなので計算すると、$0 = f+g = - sin(theta_1) - sin(theta_2)$ となる。よって、$theta_2 = theta_1 plus.minus pi, 2 pi - theta_1$ のどちらかである。
1. $theta_2 = theta_1 plus.minus pi$ の場合\
  $f = 0$ に代入して、$sin theta_1 = 0$ より、$(theta_1, theta_2) = (0, pi), (pi, 0)$ が解である。
2. $theta_2 = 2pi - theta_1$ の場合\
  $0 = f = 2K sin theta_1 cos theta_1 - sin theta_1 = 0$ なので、$theta_1 = 0, 2pi, theta^* := cos^(-1) (1/(2K)), 2pi - theta^*$\
  $(theta_1, theta_2) = (0, 0), (pi, pi), (theta^*, 2pi - theta^*), (2pi - theta^*, theta^*)$ が解である。

== (2)
$
  J(theta_1, theta_2) = mat(
    K cos(theta_1 - theta_2) - cos theta_1, -K cos(theta_1 - theta_2);
    -K cos(theta_2 - theta_1), K cos(theta_2 - theta_1) - cos theta_2)
$
について、$K$ に依存する定常解 $(theta_1, theta_2) = (theta^*, 2pi - theta^*), (2pi - theta^*, theta^*)$ を代入すると、
$
  J = mat(K cos(2 theta^*) - cos theta^* , -K cos(2 theta^*);
    -K cos(2 theta^*), K cos(2 theta^*) - cos theta^*)
$
固有値は、$lambda = -cos theta^*, 2K cos(2 theta^*) - cos theta^*$ である。
$-cos theta^* = -1/(2K) < 0$ と $2K cos(2 theta^*) - cos theta^* = 2K (2 cos^2 theta^* - 1) - cos theta^* = 2 K (1/(2K^2) - 1) - 1/(2K) = 1/(2K) - 2 K < 1 - 1 = 0$ より、安定である。

== (3)
$pdv(f, theta_2) = pdv(g, theta_1) = -K cos(theta_1 - theta_2)$ より、そのような関数 $V(theta_1, theta_2)$ は存在する。

一応、そのような $V$ を求めてみる。
$V = integral (-f) dif theta_1 = K cos(theta_1 - theta_2) - cos theta_1 + r(theta_2)$ だが、$pdv(V, theta_2) = - g$ より、$r = sin theta_2$。
$V = K cos(theta_1 - theta_2) - cos theta_1 - cos theta_2 + C quad (C"は任意定数")$。

== (4)
$
 dv(V, t) = pdv(V, theta_1) dv(theta_1, t) + pdv(V, theta_2) dv(theta_2, t) = - f^2 - g^2 <= 0
$
で、等号は、$f = g = 0$ のときに成り立つ。周期解があるなら、$V(t) = V(t + T)$ だが、$dv(V, t) <= 0$ より、$dv(V, t) = 0$ でなくてはならないが、このとき $f = g = 0$ より定常解である。よって、周期解は存在しない。