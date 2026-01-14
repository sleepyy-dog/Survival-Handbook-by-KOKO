# 第五讲

---

## 郑博引 23339147

> #### **题目 (来源: $2025$年$9$月$26$日 数理统计第$5$讲作业 $1$):**
>
> 1.设总体 $X$ 的密度函数为 $f(x)$ 与支集 $(a, b)$ 的连续分布，分布函数为 $F(x)$，随机样本 $X_1, X_2, \dots, X_n$ 来自总体 $X$，$Y_1 < Y_2 < \dots < Y_n$ 表示该样本的 $n$ 个次序统计量。
>
> $(1)$ 求证：$Y_1, Y_2, \dots, Y_n$ 的联合 pdf 为
> $$
> g(y_1, y_2, \dots, y_n) = \begin{cases} n! f(y_1) f(y_2) \cdots f(y_n), & a < y_1 < y_2 < \dots < y_n < b \\ 0, & \text{其他} \end{cases}
> $$
>
> $(2)$ 求证：第 $k$ 个次序统计量 $Y_k$ 的密度函数为：
> $$
> g_k(y_k) = \begin{cases} \frac{n!}{(k-1)!(n-k)!} [F(y_k)]^{k-1} [1-F(y_k)]^{n-k} f(y_k), & a < y_k < b \\ 0, & \text{其他} \end{cases}
> $$
>
> $(3)$ 求证：任意两个次序统计量 $Y_i < Y_j$ 的联合密度函数 $g_{ij}(y_i, y_j)$ 如下：
> $$
> g_{ij}(y_i, y_j) = \begin{cases} \frac{n!}{(i-1)!(j-i-1)!(n-j)!} [F(y_i)]^{i-1} [F(y_j)-F(y_i)]^{j-i-1} [1-F(y_j)]^{n-j} f(y_i)f(y_j), & a < y_i < y_j < b \\ 0, & \text{其他} \end{cases}
> $$

**解：**

$(1)$ 

一个很简单的证明：

这个概率密度等价于$P(Y_1=y_1,....Y_n=y_n)=P(X_i\text{大小次序为$y_i$})$。

也就对应$n!$种$X_i$的排列情况，而由概率
$$
\begin{align}
P(y_1\le Y_1\le y_1+dy_1,....y_n\le Y_n\le y_n+dy_n)&=n! P(y_1\le X_1\le y_1+dy_1,....y_n\le X_n\le y_n+dy_n)\\
&=n!\prod_{i=1}^{n} P(y_i\le X_i\le y_i+dy_i)\\
&=n!\prod_{i=1}^{n} f(y_i)dy_i(\forall i \in \{1,...,n\},dy_i\to 0)
\end{align}
$$
则由概率密度的定义知此时
$$
g(y_1, y_2, \dots, y_n) =  n! f(y_1) f(y_2) \cdots f(y_n)
$$

$a < y_1 < y_2 < \dots < y_n < b$时，以上$f(y_i)$非零，因此$g(y_1, y_2, \dots, y_n)$非零，其他情况时则存在$f(y_i)=0$等于零,即知此时概率密度为0。

> [!NOTE]
>
> 没有概率密度的加法法则可以直接使用，所以我们才将这个转化为概率质量的加法法则。

$(2)$ 

我们有（$x\ge a$）

$$
\int_a^x [F(w)]^{\alpha-1} f(w) dw = \frac{[F(x)]^\alpha}{\alpha}, \quad \alpha > 0
$$

以及($y\le b$)

$$
\int_y^b [1-F(w)]^{\beta-1} f(w) dw = \frac{[1-F(y)]^\beta}{\beta}, \quad \beta > 0
$$

积分得($x\ge 且y\le b$)

$$
g_k(y_k) = \int_a^{y_k} \cdots \int_a^{y_2} \int_{y_k}^b \cdots \int_{y_{n-1}}^b n! f(y_1) f(y_2) \cdots f(y_n) dy_n \cdots dy_{k+1} dy_1 \cdots dy_{k-1}\\
=\frac{n!}{(k-1)!(n-k)!} [F(y_k)]^{k-1} [1-F(y_k)]^{n-k} f(y_k)
$$

而在其他情况时，由$g(y_1,\cdots,y_n)=0$知$g_k (y_k)=0$,综上知：

$$
g_k(y_k) = \begin{cases} \frac{n!}{(k-1)!(n-k)!} [F(y_k)]^{k-1} [1-F(y_k)]^{n-k} f(y_k), & a < y_k < b \\ 0, & \text{其他} \end{cases}
$$
$(3)$ 
$$
g_{ij}(y_i, y_j) = \int_a^{y_1} \cdots \int_a^{y_2} \int_{y_i}^{y_j} \cdots \int_{y_{j-2}}^{y_j} \int_{y_j}^{b} \cdots \int_{y_{n-1}}^{b} n! f(y_1) \times \cdots \times f(y_n) dy_n \cdots dy_{j+1} dy_{j-1} \cdots dy_1 \cdots dy_{i-1}
$$

因为对于$\gamma > 0$，

$$
\int_x^y [F(y) - F(w)]^{\gamma-1} f(w) dw = -\frac{[F(y) - F(w)]^\gamma}{\gamma} \Big|_x^y = \frac{[F(y) - F(x)]^\gamma}{\gamma}
$$

所以可建立

$$
g_{ij}(y_i, y_j) = \begin{cases}
\frac{n!}{(i-1)!(j-i-1)!(n-j)!} [F(y_i)]^{i-1} [F(y_j) - F(y_i)]^{j-i-1} [1-F(y_j)]^{n-j} f(y_i) f(y_j), & a < y_i < y_j < b \\
0, & \text{其他}
\end{cases}
$$
**证毕。**

---

> #### **题目 (来源: $2025$年$9$月$26$日 数理统计第$5$讲作业 $2$):**
>
> 2.设 $X$ 是连续型随机变量，具有 pdf $f(x)$，并且 $f(x)$ 是正的且连续，其支集 $S=(a,b)$，其中 $-\infty \le a < b \le +\infty$。$X$ 的分布函数 $F(x)$ 可写成
> $$F(x) = \int_a^x f(w) dw, \quad a < x < b$$
> 若 $x \le a$，则 $F(x)=0$；而若 $b \le x$，则 $F(x)=1$。
> 因而，此分布存在唯一中位数 $m$，$F(m)=1/2$。
> 设 $X_1, X_2, X_3$ 表示来自于这一分布的随机样本，并设 $Y_1 < Y_2 < Y_3$ 表示该样本次序统计量。其中 $Y_2$ 是样本中位数。计算 $P(Y_2 \le m)$ 的概率。

**解：**
根据上题已证明的次序统计量 $Y_k$ 的密度函数公式，得到其概率密度函数为：
$$
g_2(y_2) = \frac{3!}{(2-1)!(3-2)!} [F(y_2)]^{2-1} [1-F(y_2)]^{3-2} f(y_2)
$$
$$
g_2(y_2) = 6 F(y_2) [1-F(y_2)] f(y_2), \quad a < y_2 < b
$$
我们需要计算的概率是 $P(Y_2 \le m)$。我们可以通过对 $g_2(y_2)$ 从 $a$到 $m$ 积分来求得：
$$
P(Y_2 \le m) = \int_a^m g_2(y_2) dy_2 = \int_a^m 6 F(y_2) [1-F(y_2)] f(y_2) dy_2
$$
$$
P(Y_2 \le m) = \int_0^{1/2} 6u(1-u) du = 6 \int_0^{1/2} (u-u^2) du
$$
$$
= 6 \left[ \frac{1}{2}u^2 - \frac{1}{3}u^3 \right]_0^{1/2}=\frac{1}{2}
$$
因此，$Y_2 \le m$ 的概率为 $1/2$。

**证毕。**

---

> #### **题目 (来源: $2025$年$9$月$26$日 数理统计第$5$讲作业 $3$):**
>
> 3.设 $Y_1, Y_2, Y_3$ 是样本量为 $3$ 的随机样本次序统计量，该随机样本分布的 pdf 为
> $$
> f(x) = \begin{cases} 1, & 0 < x < 1 \\ 0, & \text{其他} \end{cases}
> $$
> 求样本极差 $Z_1 = Y_3 - Y_1$ 的 pdf。

**解：**
该分布为区间 $(0,1)$ 上的均匀分布 $U(0,1)$。其分布函数 $F(x) = x$，$0 < x < 1$。
样本量 $n=3$。我们要求 $Z_1 = Y_3 - Y_1$ 的密度函数。首先需要求出 $Y_1$ 和 $Y_3$ 的联合密度函数 $g_{1,3}(y_1, y_3)$。
根据第一题的结果，令 $i=1, j=3, n=3$，我们有：
$$
g_{ij}(y_i, y_j) = \frac{n!}{(i-1)!(j-i-1)!(n-j)!} [F(y_i)]^{i-1} [F(y_j)-F(y_i)]^{j-i-1} [1-F(y_j)]^{n-j} f(y_i)f(y_j)
$$
代入 $i=1, j=3, n=3$：
$$
g_{1,3}(y_1, y_3) = \frac{3!}{(1-1)!(3-1-1)!(3-3)!} [F(y_1)]^{0} [F(y_3)-F(y_1)]^{1} [1-F(y_3)]^{0} f(y_1)f(y_3)
$$
$$
g_{1,3}(y_1, y_3) = 6 [F(y_3)-F(y_1)] f(y_1)f(y_3)
$$
对于 $U(0,1)$ 分布，有 $f(x)=1$ 和 $F(x)=x$，所以：
$$
g_{1,3}(y_1, y_3) = 6(y_3-y_1), \quad 0 < y_1 < y_3 < 1
$$
接下来，使用变量替换法求 $Z_1$ 的 pdf。令 $Z_1 = Y_3 - Y_1$，$Z_2 = Y_1$。
反解得到 $Y_1 = Z_2$，$Y_3 = Z_1 + Z_2$。
变换的雅可比行列式为：
$$
J = \det \begin{pmatrix} \frac{\partial y_1}{\partial z_1} & \frac{\partial y_1}{\partial z_2} \\ \frac{\partial y_3}{\partial z_1} & \frac{\partial y_3}{\partial z_2} \end{pmatrix} = \det \begin{pmatrix} 0 & 1 \\ 1 & 1 \end{pmatrix} = -1
$$
其绝对值 $|J|=1$。
$(Z_1, Z_2)$ 的联合密度函数 $h(z_1, z_2)$ 为：
$$
h(z_1, z_2) = g_{1,3}(z_2, z_1+z_2) |J| = 6((z_1+z_2)-z_2) \cdot 1 = 6z_1
$$
我们将 $h(z_1, z_2)$ 对 $z_2$ 积分：
$$
f_{Z_1}(z_1) = \int_0^{1-z_1} h(z_1, z_2) dz_2 = \int_0^{1-z_1} 6z_1 dz_2
$$
$$
=  6z_1 (1-z_1), \quad 0 < z_1 < 1
$$
所以，样本极差 $Z_1$ 的 pdf 为 $f_{Z_1}(z_1) = 6z_1(1-z_1)$，其中 $0 < z_1 < 1$。

**证毕。**

---

> #### 题目 (来源: $2025$年$9$月$26$日 数理统计第$5$讲作业 $4$):
>
> 4.设 $X_1, X_2, X_3, X_4$ 表示来自连续型总体 $X$ 的随机样本，$Y_1 < Y_2 < Y_3 < Y_4$ 是该随机样本的次序统计量。总体 $X$ 的 pdf 是
> $$
> f(x) = \begin{cases} 2x, & 0 < x < 1 \\ 0, & \text{其他} \end{cases}
> $$
> 计算 $P(1/2 < Y_3)$。

**解：**
首先，计算总体 $X$ 的累积分布函数 $F(x)$。对于 $0 < x < 1$：
$$
F(x) = \int_0^x f(t) dt = \int_0^x 2t dt = [t^2]_0^x = x^2
$$
所以，
$$
F(x) = \begin{cases} 0, & x \le 0 \\ x^2, & 0 < x < 1 \\ 1, & x \ge 1 \end{cases}
$$
所以

$$
g_3(y_3) = \begin{cases}
\frac{4!}{2!1!} (y_3^2)^2 (1-y_3^2) (2y_3), & 0 < y_3 < 1 \\
0, & \text{其他}
\end{cases}
$$

因而

$$
P\left(\frac{1}{2} < Y_3\right) = \int_{1/2}^{\infty} g_3(y_3) dy_3 = \int_{1/2}^{1} 24(y_3^5 - y_3^7) dy_3 = \frac{243}{256}
$$
**证毕。**