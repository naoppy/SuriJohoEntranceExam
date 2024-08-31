#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2023, 3, "Riku Yaegashi", "解析", "easy", doc)

#overview[
  標準的な複素関数に関する問題です. 第一問と合わせてこの2題をしっかり解いていきたいです.
]
== (1)
$ I(f) = integral_Gamma(1)(- i) / z f(z)dif z $を示せという問題です.
$ I(f) = integral_0^(2pi)f(e^(i theta))dif theta $を式変形すれば示せます.

$e^(i theta)= z$と変数変換すると, $dif z = i e^(i theta)dif theta$により
$ I(f) = integral_Gamma(1)f(z) 1 / (i e^(i theta))dif theta = integral_Gamma(1)(- i) / z f(z)dif z $
とわかります.
== (2)
$D_r = {z in C|norm(z)<r}, r>1$上での以下の関数の極を求める問題.
$ g_N [f](z) = (-i z^(N - 1)) / (z^N - 1) f(z) $
まず, $f$は正則関数なので, 極は$z^N - 1$の根のみで, $z = e^(i (2 pi k) / N)$. これは1位の極である. ロピタル定理も用いて
$ lim_(z->e^(i (2 pi k) / N))(z - e^(i (2 pi k) / N))(-i z^(N - 1)) / (z^N - 1) f(z) = lim_(z->e^(i (2 pi k) / N)) (-i z^(N - 1)) / (N z^(N - 1)) f(z) = - i / N f(e^(i (2pi k) / N)) $
== (3)
$D_r$上の正則関数$f:D_r->C$が$norm(f)<infinity$を満たすとする.この時
$ |I(f) - I_N (f)| <= (2pi norm(f)) / (r^N - 1) $
を示す問題です. 誘導に従って, $I(f), I_N (f)$の両方を積分表示し, 評価していくことを考えます.
$ I_N (f) = (2pi) / N sum_(k = 1)^N f(e^(i (2pi k) / (N))) = integral_Gamma(r) g_N [f](z) $
$ |I(f) - I_N (f)| = norm(integral_Gamma(r)(- i) / (z) f(z)dif z - integral_Gamma(r) (- i z^(N - 1)) / (z^N - 1) f(z) ) = norm(integral_Gamma(r)(i) / (z(z^N - 1))f(z)dif z) $
$ <= integral_Gamma(r)norm((i) / (z(z^N - 1))f(z))norm(dif z) <= norm(f) / (r(r^N - 1)) integral_Gamma(r) norm(dif z) = norm(f) / (r(r^N - 1))2pi r = (2pi norm(f)) / (r^N - 1) $
== (4)
(3)の問題の評価が最適であること
$ limsup_(N->infinity)(r^N sup_f (|I(f) - I_N (f)|) / norm(f)) = 2pi $を示せという問題です. すでに上からは評価できているので, それを実現するような$f$を構成できれば, OKです.

アイデアとしては, (3)で等式で評価できていた
$ |I(f) - I_N (f)| = norm(integral_Gamma(r)(i) / (z(z^N - 1))f(z)dif z) $この評価式をうまく使うことを考えます.ここまでの式変形は$f$の正則性のみ仮定しているので問題ありません.

上手く積分できる形にするため$f(z) = z^N - 1$とします.すると積分は$ integral_Gamma(r)i / z dif z $となり, 積分値の絶対値は$2pi$です.

ここで, $norm(f)= norm(z^N - 1)<= norm(z^N) + norm(1)=r^N + 1 $これらのことから
$ limsup_(N->infinity)(r^N sup_f (|I(f) - I_N (f)|) / (norm(f)))>=limsup_(N->infinity)(r^N (2pi) / (norm(z^N - 1))) >= limsup_(N->infinity) (r^N (2pi) / (r^N + 1)) = 2pi $
