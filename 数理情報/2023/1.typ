#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2023, 1, "Riku Yaegashi", "解析", "normal", doc)

#overview[
  数列 ${a_i}^(m)_(i = 1), {b_j}_(j = 1)^(n)$に対するノルム
  $ f(A, B) = ln( 1 / (m) sum_(i = 1)^m 1/ (1/n sum_(j = 1)^n e^(-norm(a_i - b_j))) ) $
  に関しての問題です. 一見難しそうですが, 手を動かしてみると以外となんとかなる類の問題です.ただ(4)の計算はかなり時間的に厳しいので,目星をつけて答えだけ書くのも試験中では戦略でしょう.
]

== (1)
$f(A, B) >= 0$を示せ. また等号が成り立つ必要十分条件を求めよ.

という問題ですが, 定義に従って計算していけば何とかなります. 問題を示すには対数の中身が$1$より大きければよいことに注意します.
$ f(A, B) >= 0  <=> 1 / (m) sum_(i = 1)^m 1/ (1/n sum_(j = 1)^n e^(-norm(a_i - b_j))) >=1 <=> sum_(i = 1)^m 1/ (1/n sum_(j = 1)^n e^(-norm(a_i - b_j))) >= m $
ここで $e^norm(a_i - b_j)<=1 $ に注意すると, $ forall i$
$ 1 / (n)sum_(j = 1)^n e^norm(a_i - b_j) <= 1 $
が言えるので, $forall i$
$ 1 /(1 / (n)sum_(j = 1)^n e^norm(a_i - b_j))>= 1 $
がわかり, 示したかったものが示されたことになります.

必要十分条件については, 各不等式で等号が成立するときを考え, ${a}_i^m = {b}_j^n$となります.
== (2)
$f(A,C)<=f(A,B) + f(B, C)$を示せという問題です. いわゆる三角不等式の成立を問う問題です. 同じく同値変形したり緩い条件に変えたりして示します. 緩い評価は総和の各項が不等式を満たすなら, 総和をとっても不等式を満たすという評価を用います.(もちろん一般には総和の各項が不等式を満たしていなくても和を取ったら成り立つことがあります.) まず, $log$の性質から
$ f(A,C) <= f(A,B) + f(B, C) <=> 1 / (m) sum_(i = 1)^(m) 1 / (1 / (l) sum_(k = 1)^ (l)e ^ norm(a_i - c_k)) <= 1 / (m) sum_(i = 1)^(m) 1 / (1 / (n) sum_(j = 1)^ (n)e ^ norm(a_i - b_j))1 / (n) sum_(j = 1)^(n) 1 / (1 / (l) sum_(k = 1)^ (l)e ^ norm(b_j - c_k)) $
もし総和の各項が不等式を満たすなら総和をとっても不等式を満たすので,
$ <== 1 / (1 / (l) sum_(k = 1)^ (l)e ^ norm(a_i - c_k)) <=  1 / (1 / (n) sum_(j = 1)^ (n)e ^ norm(a_i - b_j))1 / (n) sum_(j = 1)^(n) 1 / (1 / (l) sum_(k = 1)^ (l)e ^ norm(b_j - c_k)) $
$ <=> 1 / (n) sum_(j = 1)^ (n)e ^ norm(a_i - b_j) <= 1 / (l) sum_(k = 1)^ (l)e ^ norm(a_i - c_k) 1 / (n) sum_(j = 1)^(n) 1 / (1 / (l) sum_(k = 1)^ (l)e ^ norm(b_j - c_k)) $
$ <== e ^ norm(a_i - b_j) <= 1 / (l) sum_(k = 1)^ (l)e ^ norm(a_i - c_k)1 / (1 / (l) sum_(k = 1)^ (l)e ^ norm(b_j - c_k)) $
$ <=> 1 / (l) sum_(k = 1)^ (l)e ^ norm(b_j - c_k) e ^ norm(a_i - b_j) <= 1 / (l) sum_(k = 1)^ (l)e ^ norm(a_i - c_k) $
$ <== e ^ norm(b_j - c_k) e ^ norm(a_i - b_j) <= e ^ norm(a_i - c_k) $
最後の式は三角不等式から成立します.
== (3)
$A_m (s) = {s + i/m}_(i = 1)^(m), B_n = {j/n}_(j = 1)^n$とおくときに
$ g(s) = lim_(m->infinity)lim_(n->infinity)f(A_m (s), B_n) $
として, 
$ g(s) = ln(integral_s^(1 + s) 1 / h(z))dif z $
となる関数$ h(z) $を求める問題です. 定義に従って計算していきます.
$ g(s) = lim_(m->infinity)lim_(n->infinity)f(A_m (s), B_n)  = lim_(m->infinity)lim_(n->infinity) ln( 1 / (m) sum_(i = 1)^m 1/ (1/n sum_(j = 1)^n e^(-norm(s + i/m - j/n))) ) $
$log$の連続性から極限と$ln$を入れ替えてよく,
$ = lim_(m->infinity)ln lim_(n->infinity)1 / (m) sum_(i = 1)^m 1/ (1/n sum_(j = 1)^n e^(-norm(s + i/m - j/n))) $
有限和なので, 総和と極限を入れ替える. 極限$beta_n$が$beta$に収束するなら$1/beta_n->1/beta$も用いると,
$ = lim_(m->infinity)ln 1 / (m) sum_(i = 1)^m 1/ (lim_(n->infinity)1/n sum_(j = 1)^n e^(-norm(s + i/m - j/n))) $
区分求積法から
$ = lim_(m->infinity)ln 1 / (m) sum_(i = 1)^m 1 / (integral_0^1e^(-norm(s + i / m - x))dif x) $
$ integral_0^1e^(-norm(z - x))dif x = h(z)$とすると,
$ = ln lim_(m->infinity) 1/ m sum_(i=1)^m 1 / (h(s + i/m)) = ln(integral_s^(s+1)1 / h(z))dif z $
== (4)
g(s)が最小となる実数$s$を求める問題です. 鉄則通り微分して求めます.
$ dif /(dif s)g(s) = (1/h(s+1) - 1 / h(s)) / (integral_s^(s + 1) 1 / (h(z))dif z) = ((h(s) - h(s + 1)) / (h(s)h(s + 1)) ) / (integral_s^(s + 1) 1 / (h(z))dif z) $
分母については, 正関数の積分より正であることはすぐわかります. まず直観的に$s = 0$で最小を取ることを説明します. $h(s)$の非積分関数について考えると $s$を峰とした関数となります. それを$0->1$で積分します. $s$がある程度小さい時, $s + 1$の時の方の関数値が大きくなります. 逆に$s$がある程度大きくなると$s$の時の関数値の方が大きくなります.
//画像を張りたい
厳密には計算するのが良いでしょう.

$ h(s) = integral_0^1 e^(-norm(s-x))dif x, h(s + 1) = integral_0^1e^(-norm(s+1-x))dif x $
$s<=-1$のとき,$e^(-norm(s-x)) = e^(s-x), e^(-norm(s+1-x)) = e^((s+1)-x) x in [0,1]$が成立します.$e^(s-x) > e^(x-(s+1))$なので,$h(s) < h(s + 1)$

$s>=1$のとき,$e^(-norm(s-x)) = e^(x-s), e^(-norm(s+1-x)) = e^(x-(s+1))$より,$h(s) > h(s + 1)$

$-1<= s <=0$のとき,ここからはしっかり計算していきます.
$ h(s) = integral_0^1e^(s-x)dif x = e^s [-e^(-x)]_0^1 = e^s (1-e^(-1)) $
$ h(s + 1) = integral_0^(s+1)e^(x-(s+1))dif x+integral_(s+1)^1 e^((s+1)-x)dif x = e^(-(s+1))[e^x]_0^(s+1) + e^(s+1)[-e^(-x)]_(s+1)^1 $
$ =(1-e^(-(s+1))) + (1-e^s) = 2-e^s-e^(-(s+1)) $
$ h(s) - h(s+1) = (e^s - e^(s-1)) - (2-e^s-e^(-(s+1))) = e^s (2-e^(-1))+e^(-(s+1)) - 2 = k(s) $
$ (dif k(s)) / (dif s) = e^s (2-e^(-1)) -e^(-(s+1)) $
$(dif k)/(dif s)$は単調増加関数で$s=-1$のとき$(dif k)/(dif s)<0$,$s=0$のとき$(dif k)/(dif s)>0$. よって,$k(s)$は減少して途中で増加に転じる.

$k(0) = 0,k(-1)=2e^(-1)-e^(-2)-1<0$より,$k(s)$は常に負

$0<=s<=1$のとき
$ h(s) = integral_0^s e^(x-s)dif x + integral_s^1 e^(s-x)dif x = e^(-s)[e^x]_0^s + e^s [-e^(-x)]_s^1 $
$ = (1-e^(-s)) + (1-e^(s-1)) = 2-e^(-s) - e^(s-1) $
$ h(s+1) = integral_0^1 e^(x-(s+1)) dif x = e^(-(s+1)) [e^x]_0^1 = e^(-s) - e^(-(s+1)) $
$ h(s) - h(s+1) = 2-e^(-s) - e^(s-1) - (e^(-s) - e^(-(s+1))) = 2-2e^(-s) - e^(s-1) + e^(-(s+1)) = l(s) $
$ (dif l) / (dif s) = 2e^(-s)-e^(s-1) - e^(-(s+1))  $
$(dif l)/(dif s)$は単調減少関数.$s=0$で$(dif l)/(dif s)>0$, $s=1$で$(dif l)/(dif s)<0$であるので, $l(s)$は増加して減少する.

$l(0) = 0, l(1) >0$より$l(s)>0, s in [0,1]$

以上4つの場合の考察から$s=0$で最小を取ることがわかる.