#import "../../template.typ": mytemplate, overview, warning, opt_problem, diag
#show: doc => mytemplate(2020, 1, "Naoki Otani", "線形代数", "normal", doc)

#overview[
  対称行列は直交行列で対角化できることを使う。また、正定値対称行列の固有値は正であることを使う。
  求められる知識は簡単なものだが、変形が少し面倒。
]

== (1)
$B = P D P^T$ と直交行列 $P$ と $D = diag(lambda_1, dots, lambda_n)$ で対角化できるとすると、
$ B C + C B = A &<=> P D P^T C + C P D P^T = A\
&<=> P^T P D P^T C P + P^T C P D P^T P = P^T A P\
&<=> D (P^T C P) + (P^T C P) D = P^T A P\
&<=> D C' + C' D = A'\
$
左からかけるのは行基本変形、右からは列基本変形に対応することを思い出す。
最後の行を成分ごとに書くと、
$ C'_(i j) (lambda_i + lambda_j) = A'_(i j) $ となる。
ここで、 $B$ は正定値対称行列なので、$lambda_i + lambda_j > 0$ である。よって、$C'$ は $A'$ から定まり、$C$ は $C'$ から定まるので、解は存在する。

次に、一意性を示す。二つの行列 $C_1, C_2$ が共に満たすとすると、$B (C_1 - C_2) + (C_1 - C_2) B = O$ である。
上と同様に、
$
B (C_1 - C_2) + (C_1 - C_2) B = O &<=> P D P^T (C_1 - C_2) + (C_1 - C_2) P D P^T = O\
&<=> D (P^T (C_1 - C_2) P) + (P^T (C_1 - C_2) P) D = O\
&<=> D C'' + C'' D = O\
$
成分ごとに書くと、$lambda_i C''_(i j) + lambda_j C''_(i j) = 0$ より、$C''_(i j) = 0 thick (forall i, j)$。よって、$C_1 - C_2 = P C'' P^T = O$ であり、解は一意である。

== (2)
$ B C_(A, B) = C_(A, B) B &<=> D (P^T C_(A, B) P) = (P^T C_(A, B) P) D \
&<=> D C' = C'D \
&<=> lambda_i C'_(i j) = lambda_j C'_(i j) quad forall i, j \
&<=> lambda_i A'_(i j) = lambda_j A'_(i j) quad forall i, j \
&<=> D A' = A' D
$
一方で、
$ A B = B A &<=> P A' D P^T = P D A' P^T \
&<=> A' D = D A'
$
よって2つは同値。
