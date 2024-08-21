#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2024, 2, "Naoki Otani", "解析", "easy", doc)

#overview[
  松尾研あるあるの、微分方程式の構造を保った離散化/あるいは離散的な漸化式の連続化についての話です。計算ゲー意外の何物でもありません。
]

== (1)
$ dv(E, t) &= 2(t+1)(f(x) - f(x^*)) + (t+1)^2 grad f(x) dot.op dv(vb(x), t) + 4(v - x^*) dot.op dv(vb(v), t) \
&= 2(t+1)(f(x) - f(x^*)) + (t+1)^2 2/(t+1)grad f(x) dot.op (v - x) + 4 (v-x^*) dot.op (-(t+1)/2 grad f) \
&= 2(t+1)(f(x)-f(x^*)) + 2(t+1)(x^*-x)dot.op grad f(x) \
&= -2(t+1)(f(x^*) - f(x) - (x^*-x)dot.op grad f(x))
 $
 ここで $f$ は滑らかな凸関数より、凸性の一次必要十分条件 $ f(y) >= f(x) + (y-x) dot.op grad f(x) quad forall x, y $ を満たすので、$dv(E,t) <= 0$ である。

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
方針としては、(1) で行った計算ステップを完全に辿ればよい。

書くのめんどい