#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2024, 2, "Naoki Otani", "解析", "normal", doc)

#overview[
  松尾研あるあるの、微分方程式の構造を保った離散化/あるいは離散的な漸化式の連続化についての話です。計算ゲー意外の何物でもありません。悪問。
]

== (1)
$ dv(E, t) &= 2(t+1)(f(x) - f(x^*)) + (t+1)^2 grad f(x) dot.op dv(vb(x), t) + 4(v - x^*) dot.op dv(vb(v), t) \
&= 2(t+1)(f(x) - f(x^*)) + (t+1)^2 2/(t+1)grad f(x) dot.op (v - x) + 4 (v-x^*) dot.op (-(t+1)/2 grad f) \
&= 2(t+1)(f(x)-f(x^*)) + 2(t+1)(x^*-x)dot.op grad f(x) \
&= -2(t+1)(f(x^*) - f(x) - (x^*-x)dot.op grad f(x))
 $
 ここで $f$ は微分可能な凸関数より、勾配不等式 #numeq($ f(y) >= f(x) + (y-x) dot.op grad f(x) quad forall x, y $) <conv1d> を満たすので、$dv(E,t) <= 0$ である。
 #let ref_conv1d = link(<conv1d>, "勾配不等式")


 定数 $C$ を考える。 
 $ (t+1)^2(f(x)-f(x^*)) &= E(t) - 2norm(v(t)-x^*)_2^2\
 &<= E(t) \
 &<= E(0) = C_1 $
 $ t^2 (f(x)-f(x^*)) <= (t/(t+1))^2 C_1 < C_1 $
より、定数 $C$ として $E(0)$ を取ればよい。

== (2)
#warning[
  問題文に書いてある関係式の添え字に注意すること。
]

#let dp(f) = $delta^+ #f$
#let dpk(f, k) = $delta^+ #f^((#k))$
#let dpkw(f, k) = $delta^+ (#f^((#k)))$

$ dp(norm(v^((k)) - x^*)_2^2) &= dp((v^((k)) - x^*)) dot.op (v^((k+1)) - x^*) + (v^((k)) - x^*) dot.op dp((v^((k)) - x^*)) \
&= 2dp((v^((k)))) dot.op (v^((k+1)) - x^*) - dp((v^((k)))) dot.op (v^((k+1)) - x^*) + (v^((k)) - x^*) dot.op dp((v^((k)))) \
&= 2dp((v^((k)))) dot.op (v^((k+1)) - x^*) - (v^((k+1)) - v^((k))) dot.op dp((v^((k)))) \
&= 2(v^((k+1)) - x^*)^T (dpk(v, k)) - h norm(dpk(v, k))_2^2
$


$dpk(E, k) <= 0$ を示す方針としては、(1) で行った計算ステップを完全に辿ればよい。

$ dpk(E, k) &= dp(((h k + 1)^2))(f(x^(k+1) - f(x^*))) + (h k + 1)^2 dp((f(x^k) - f(x^*))) \
&quad +4(v^(k+1)-x^*) dot.op dpk(v, k) - 2h norm(dpk(v, k))_2^2 \
&= s (f(x^(k+1)) - f(x^*)) + (h k + 1)^2 (f(x^(k+1)) - f(x^k))/h \
&quad +4(v^(k+1)-x^*) dot.op (-s/4 grad f(x^(k+1))) - 2h norm(dpk(v, k))_2^2 \
$
途中で $s := (2h k + h + 2) = dp(((h k + 1)^2))$ と置いた。
さて、#ref_conv1d より $ f(x^((k+1))) - f(x^((k))) <= (x^((k+1)) - x^((k))) dot.op grad f(x^((k+1))) = h dpkw(x, k) dot.op grad f(x^((k+1))) $ なので、

$ 
dpk(E, k) &<= s (f(x^(k+1)) - f(x^*)) + (h k + 1)^2 dpkw(x, k) dot.op grad f(x^((k+1)))  \
&quad -s(v^(k+1)-x^*) dot.op grad f(x^(k+1)) - 2h norm(dpk(v, k))_2^2 \
&dp((x^((k)))) "の関係式" (**) "を代入して、" #v(2.5em) \
&= s (f(x^(k+1)) - f(x^*)) + s (v^((k+1)) - x^((k+1))) dot.op grad f(x^((k+1))) \
&quad -s(v^(k+1)-x^*) dot.op grad f(x^(k+1)) - 2h norm(dpk(v, k))_2^2 \
&= s(f(x^(k+1)) - f(x^*) + (x^* - x^((k+1))) dot.op grad f(x^((k_1)))) - 2h norm(dpk(v, k))_2^2 \
&<= 0
$
最後にも #ref_conv1d を使った。解く時は (1) のステップを再現するようにして解けばよい。

== (3)
(1) と同じ方針でよい。
$ (h k + 1)^2 (f(x^((k))) - f(x^*)) &= E^((k)) - 2 norm(v^((k)) - x^*)_2^2 <= E^((0)) $
より、
$ k^2 (f(x^((k))) - f(x^*)) <= (h^2 k^2)/(h k + 1)^2 E^((0))/h^2 <= E^((0))/h^2 $
よって $C' = E^((0)) slash h^2$ とすればよい。
