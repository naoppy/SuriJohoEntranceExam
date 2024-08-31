#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2023, 2, "Riku Yaegashi", "線形代数", "normal", doc)

#overview[
  微分方程式と正定値対称に関する問題です. 何がテーマなのかよくわからない問題です. 多次元に拡張したロジスティック関数なんじゃないですかね(適当).
  
   特に(3)などは試験中ではよくわからなくなる気がするので, 数学強者でない限りはあまり解かない気がします.
]
== (1)
$ F_i (x) = x_i (v_i + sum_(j = 1)^n a_(i j)x_j) $
$ (dif x_i (t)) / (dif t) =F_i (x(t)) $
$ L(x) = sum_(i = 1)^n c_i [x_i^ast log(x_i^ast / x_i) - x_i^ast + x_i] $
$ C = diag(c_1,c_2,dots,c_n) $
$dot(L)(x^prime)<0$と$C A + A^T C$が不定値であることが同値であることを示せ.

$ dot(L) (x) = (dif) / (dif t) L(x(t)) =sum_(i=1)^n (diff L) / (diff x_i) (diff x_i) / (diff t) = sum_(i = 1)^n c_j (- x_i^ast/ x_i + 1) x_i (v_i + sum_(j = 1)^n a_(i j)x_j) $
ここで$x_i^ast$は$F_i (x_i^ast)= 0$となるので, $v_i = - sum_(j = 1)^n a_(i j)x_j^ast$
$ dot(L)(x) = sum_(i = 1)^n c_j (x_i - x_i^ast) (sum_(j = 1)^n a_(i j) (x_j-x_j^ast)) =sum_(i,j) c_j a_(i j)(x_i - x_i^ast) (x_j - x_j^ast) = (x - x^ast) (C A + A^T C)/2 (x - x^ast) $
よって任意の$x$に対し$dot(L) < 0$と$C A + A^T C$が不定値であることは同値.
== (2)
ベクトル$w$
$ H_w (z) = 1/2 sum_(i = 1)^n w_i z_i^2 $
$z = x(t) - x^ast$として, 
$ (dif) / (dif t)z(t) = G(z(t))gradient H_w (z(t)) $
を満たす行列関数$G(z)$を求めよ.
$ gradient H_w (z) = (w_1 z_1, w_2z_2, dots, w_n z_n)^T $
$ (dif z(t)) / (dif t) = sum_(i = 1)^n (diff z) / (diff x_i) (diff x_i) / (diff t)  = sum_(i = 1)^n e_i x_i (sum_(j = 1)^n a_(i j)(x_j - x_j^ast)) = x dot A(x-x^ast) = x^T A z = X A z $
$ = X A W^(-1)W z = (Z + X^ast) A W^(-1)gradient H_w (z) $
== (3)
$z(t)in U\\{0}$ならば$(dif H_w (z(t))) / (dif t) < 0$なる開近傍$U$が存在する$w$を一つ求めよ.
$ (dif H_w (z(t))) / (dif t) = gradient H_w (z(t)) dot (dif z(t)) / (dif t) = gradient H_w (z(t)) (X^ast + Z) A W^(-1) gradient H_w (z(t)) $
まず, $w$は正ベクトルから選ぶので, $z(t) =0$でない限りは,$gradient H_w (z(t))$は非零のベクトルとなる.

いま, $(X^ast + Z) A W^(-1)$の部分にも$z$に依存する項が入っていることが, 単純な解析ができない要因である. ここでのポイントは,開近傍は任意であるから, 適当に$Z$を小さくすれば, $Z$の方はオーダーの意味で無視できるということである.

開近傍を十分小さくとることで$Z$が$O(epsilon)$となるようにする.
$ (dif H_w (z(t))) / (dif t) = gradient H_w (z(t)) X^ast A W^(-1) gradient H_w (z(t))+gradient H_w (z(t)) Z A W^(-1) gradient H_w (z(t)) $
ここで$gradient H_w (z) = (w_1z_1, w_2z_2,dots, w_n z_n)$であったことを思い出せば, $gradient H_w (z(t))$も$O(epsilon)$である.$(dif H_w (z(t))) / (dif t)$の第一項は$O(epsilon^2)$, 第二項は$O(epsilon^3)$より, 開近傍を十分小さくとれば, 第二項は第一項に比べて無視できる.

そこで以下第一項のみ考える.
$ gradient H_w (z(t)) X^ast A W^(-1) gradient H_w (z(t)) = gradient H_w (z(t)) W^(-1) W X^ast A W^(-1) gradient H_w (z(t)) $
$gradient H_w (z(t)) W^(-1)$も,$z(t) = 0$でない限り正であることに注意する. これは, $X^ast A W^(-1)$を条件式が使いやすい$W X^ast A$と書き換えるために行った.
$ = gradient H_w (z(t))W^(-1) ((W X^ast A + A^T X^ast W)/2) W^(-1) gradient H_w (z(t)) $
これは, 行列が対称になるように変形した. さて問題の条件から$C A + A^T C$は負定値である. ここで$W X^ast = C$となるように選べば, $(dif H_w (z(t))) / (dif t)$の第一項は負の値になる. 第二項が$0$の$epsilon$近傍では第一項に比べて無視できることから, $W X^ast = C$が一つの解となる.明示的に書けば,
$ w_i = c_i /x_i $
となる. ここで,$x_i^ast$は問題文の条件から$x^ast$が正ベクトルであるので割ることに問題はない.