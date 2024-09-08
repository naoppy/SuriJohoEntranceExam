#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag, numeq, technique
#import "@preview/physica:0.9.3": *
#show: doc => mytemplate(2017, 1, "Naoya Yamamoto", "解析", "normal", doc)

#overview[
  非線形方程式を数値的に解くときなどに大事な概念となる不動点に関する問題。(1)で安定な不動点がなぜ大事かを実感することができる。(2)は高校数学っぽい。幾何的には底が動くときの指数関数と直線の交点を考えることになるが、意外とイメージしにくくて難しい感がある。
]
== (1) 
$|F^n (x) - macron(x)|$ を評価することを考える。

$macron(x)$ は安定な不動点なので、
  $
    F(macron(x)) &= macron(x)\
    |f(macron(x))| &< 1
  $
関数 $x |-> |f(x)| = a^x |log a|$ は連続なので、ある開区間 $J = (macron(x) - delta, macron(x) + delta)$（$delta > 0$）があって、
  $
    x in J => |f(x)| < M := (1+|f(macron(x))|)/2 < 1
  $
$F$ は微分可能なので平均値の定理より、$x in J$ ならば、
  $
    |F(x) - macron(x)| &= |F(x) - F(macron(x))|\
    &= |f(macron(x) + theta (x - macron(x)))| |x - macron(x)|\
    &< M |x - macron(x)|\
    &< delta
  $
ただし、$theta in (0,1)$ であり、したがって $macron(x) + theta (x - macron(x)) in J$ なので3行目の不等式が言える。

$x in J => F(x) in J$ であることにも注意して、
  $
    |F^n(x) - macron(x)| &= |F(F^(n-1) (x) ) - macron(x)|\
    &< M |F^(n-1) (x) - macron(x)|\
    &< M^(n-1) |x - macron(x)|
  $
故に、$x in J => lim_(n -> infinity) F^n (x) = macron(x)$ である。

== (2)
  $
    F(x) = x &<=> a^x = x\
    &<=> a = x^(1/x)
  $
より、不動点を考えるには $g(x) = x^(1/x)$ のグラフを考えれば良い。
  $
    dif / (dif x) log g(x) &= (1 - log x)/(x^2) \
    lim_(x -> +0) g(x) &= 0\
    lim_(x -> infinity) g(x) &= 1
  $
より、$g$ の概形は次のようになる。
#figure(
  image("5fig/g.png", width: 40%),
  caption: [$g (x)$ のグラフ。]
)
$x = e$ で最大値 $g(e) = e^(1/e)$ をとることと、$g(1/e) = e^(-e)$ であることに注意しておく。\
$a^(x) = x$ なる $x$ が存在するとき、
  $
    |f(x)| < 1 &<=> |a^x log a| < 1\
    &<=> |log x| < 1\
    &<=> 1/e < x < e
  $
よって、安定な不動点 $macron(x)$ の存在範囲は $1/e < macron(x) < e$ であり、そのときの $a$ の範囲はグラフから $e^(-e) < a < e^(1/e)$ である。

== (2) 別解
よく言うと実直な解法、悪く言うと工夫できなかった人の解法です。\
$h(x) = F(x) - x$ とおく。\
  - * $a=1$ の場合* #footnote[指数関数の振る舞いを考えれば、このように場合わけすると良いことがわかる。]
$x = 1$ が $h(x) = 0$ の唯一の解で、$f(x) = 0$ である。\

  - * $a>1$ の場合*\
  このとき、
    $
      h'(x) = a^x (log a) - 1
    $
  であり $h'$ は単調増加する。
    $
      h'(x) = a^x (log a) - 1 &= 0 <=> x = - (log (log a))/(log a)
    $
  より、関数 $h$ は $tilde(x) = - (log (log a))/(log a)$ で最小値 $h(tilde(x)) = (1 + log (log a))/(log a)$ をとる。\
  $lim_(x -> ± infinity) h(x) = infinity$ に注意すると $h(x)$ のグラフの概形は釣鐘のようになっているので、$h(x) = 0$ が実数解を持つための必要十分条件は、
    $
      h(tilde(x)) = (1 + log (log a))/(log a) <= 0 <=> a <= e^(1/e)
    $
  次に安定性を考える。
  $a = e^(1/e)$ のとき、$x = tilde(x)$ が $h(x) = 0$ の唯一の解だが $f(tilde(x)) = 1$ より不適。\
  $a < e^(1/e)$ のとき、最小値 $h(tilde(x))$ は $0$ より小さいので $h(x) = 0$ は２つの実数解を持ち、小さい順に $x_1 ,x_2$ とおくと、$0 < x_1 < tilde(x) < x_2$ である。よって、$0 < f(x_1) < f(tilde(x)) = 1 < f(x_2)$ なので、$a > 1$ の場合に安定な不動点が存在する必要十分条件として $1 < a < e^(1/e)$ が得られる。\
  このときの安定な不動点 $macron(x) = x_1$ の範囲を考える。
  $
    a^(macron(x)) = macron(x)
  $
  で対数を取ってから $a$ で微分すると、
  $
    (dif macron(x))/(dif a) log a + macron(x)/a &= 1/x(a) (dif macron(x))/(dif a)\
    (dif macron(x))/(dif a) = (macron(x)^2)/(a(1 - macron(x) log a)) &= (macron(x)^2)/(a(1 - log macron(x)))> 0\
    (because log macron(x) <& log tilde(x) = 1)
  $
  よって $macron(x)$ は $a$ に関して単調増加するので、
  $
    1^x = x &<=> x = 1\
    e^(x/e) = x &<=> x = e 
  $
  と $1 < a <e^(1/e)$ から、対応する $macron(x)$ の範囲は $1 < macron(x) < e$ である。\
  \
  - * $a < 1$ の場合*\
  $h'(x) = a^x (log a) - 1 < 0$ より $h$ は単調増加で $h(0) = 1 > 0, lim_(x ->  infinity) h(x) = - infinity$ なので、$h(x) = 0$ は唯一の実数解 $x = macron(x) >0$ を持つ。\
  $macron(x)$ が安定な不動点である必要十分条件を考える。
  $
    (dif macron(x))/(dif a) = (macron(x)^2)/(a(1 - macron(x) log a)) > 0
  $
より $macron(x)$ は $a$ に関して単調増加する。
  $
    0 > f(macron(x)) &= a^(macron(x)) log a\
    &= macron(x) log a\
    &= log macron(x)
  $
  に注意して、
  $
    |f(macron(x))| < 1 &<=> log macron(x) > -1\
    &<=> macron(x) > 1/e\
    &<=> a > e^(- e)
  $
  最後の同値関係は、
  $
    a^(1/e) = 1/e & <=> a = e^(- e)
  $
  と $a$ の $macron(x)$ に関する単調増加性から従う。\
  まとめると、安定な不動点が存在するための $a$ に関する必要十分条件は $e^(- e) < a < e^(1/e)$ であり、このときの $macron(x)$ の範囲は $e^(-1) < macron(x) < e$ である。
