# 第二十七讲

## 23339147郑博引

> [!NOTE]
>
> 考研题剩下两题，是来源。

> #### 题目 ($1$.)：
>
> 设 $X_1,X_2,\dots,X_n$ 表示来自 $N(\mu,\sigma^2)$ 分布的样本量为 $n$ 的随机样本。对于每个已知 $\sigma^2$，求证：$\mu$ 的完备充分统计量样本均值 $\overline{X}$ 与样本方差 $S^2$ 是独立的。

**解：**

记

$$
\overline{X}=\frac{1}{n}\sum_{i=1}^{n}X_i,\qquad S^2=\frac{1}{n-1}\sum_{i=1}^{n}\bigl(X_i-\overline{X}\bigr)^2.
$$

**（$1$）证明 $\overline{X}$ 对 $\mu$ 充分且完备（已知 $\sigma^2$）**

样本联合密度为

$$
f(\mathbf{x};\mu)=\prod_{i=1}^{n}\frac{1}{\sqrt{2\pi}\sigma}\exp\!\left(-\frac{(x_i-\mu)^2}{2\sigma^2}\right)
=(2\pi\sigma^2)^{-\frac{n}{2}}\exp\!\left(-\frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i-\mu)^2\right).
$$

展开平方和：

$$
\sum_{i=1}^{n}(x_i-\mu)^2=\sum_{i=1}^{n}x_i^2-2\mu\sum_{i=1}^{n}x_i+n\mu^2.
$$

代回得

$$
f(\mathbf{x};\mu)
=\underbrace{(2\pi\sigma^2)^{-\frac{n}{2}}\exp\!\left(-\frac{1}{2\sigma^2}\sum_{i=1}^{n}x_i^2\right)}_{h(\mathbf{x})}
\cdot
\exp\!\left(\frac{\mu}{\sigma^2}\sum_{i=1}^{n}x_i-\frac{n\mu^2}{2\sigma^2}\right).
$$

由因子分解定理，$\sum_{i=1}^{n}X_i$（等价地 $\overline{X}$）是 $\mu$ 的充分统计量。

同时，上式是一个一参数满指数族，其自然参数为 $\eta=\mu/\sigma^2\in\mathbb{R}$（开区间），故其自然充分统计量 $\sum_{i=1}^{n}X_i$（亦即 $\overline{X}$）对 $\mu$ 完备。

> [!NOTE]
>
> 事实上我们也可以直接使用正则指数组来直接证明。

**（$2$）证明 $S^2$ 对 $\mu$ 为从属统计量**

写成标准化形式：令 $Z_i=(X_i-\mu)/\sigma$，则 $Z_1,\dots,Z_n$ 相互独立且同分布于 $N(0,1)$，并且

$$
S^2=\frac{\sigma^2}{n-1}\sum_{i=1}^{n}\bigl(Z_i-\overline{Z}\bigr)^2,\qquad \overline{Z}=\frac{1}{n}\sum_{i=1}^{n}Z_i.
$$

因此 $S^2$ 的分布只与已知的 $\sigma^2$ 有关，与 $\mu$ 无关，故 $S^2$ 是关于 $\mu$ 的从属统计量。

**（$3$）由巴苏定理得独立性**

由（$1$）知 $\overline{X}$ 是 $\mu$ 的完备充分统计量，由（$2$）知 $S^2$ 是关于 $\mu$ 的从属统计量。由巴苏定理可得

$$
\overline{X}\ \perp\ S^2.
$$

**证毕。**

> [!NOTE]
>
> **巴苏定理：**
>
> 设 $\mathcal{P} = \{P_\theta : \theta \in \Theta\}$ 是一族概率分布。若统计量 $T$ 是关于参数 $\theta$ 的**完备充分统计量**，而统计量 $V$ 是关于 $\theta$ 的**从属统计量**(与 $\theta$ 无关)（Ancillary Statistic），则 $T$ 与 $V$ 相互独立。

---

> #### 题目 ($2$.)：
>
> 设 $X_1,X_2$ 表示来自如下分布的随机样本（$n=2$），其概率密度函数为
>
> $$
> f(x;\theta)=
> \begin{cases}
> \dfrac{1}{\theta}\mathrm{e}^{-x/\theta},&0<x<+\infty,\ 0<\theta<+\infty,\\
> 0,&\text{其他}.
> \end{cases}
> $$
>
> （$1$）求证：统计量 $Y_1=X_1+X_2$ 是 $\theta$ 的完备充分统计量。
>
> （$2$）求证：$Y_1$ 与每一个尺度不变统计量 $u(X_1,X_2)$ 独立。
>
> （$3$）列举尺度不变统计量的性质，并举出尺度不变统计量的实例。

**解：**

**（$1$）$Y_1=X_1+X_2$ 的充分性与完备性**

联合密度为（$x_1>0,x_2>0$）

$$
f(x_1,x_2;\theta)=\frac{1}{\theta^2}\exp\!\left(-\frac{x_1+x_2}{\theta}\right)\mathbf{1}_{(0,+\infty)}(x_1)\mathbf{1}_{(0,+\infty)}(x_2).
$$

令 $y=x_1+x_2$，则可写为

$$
f(x_1,x_2;\theta)=\underbrace{\mathbf{1}_{(0,+\infty)}(x_1)\mathbf{1}_{(0,+\infty)}(x_2)}_{h(x_1,x_2)}
\cdot
\underbrace{\frac{1}{\theta^2}\exp\!\left(-\frac{y}{\theta}\right)}_{g(y;\theta)}.
$$

由因子分解定理，$Y_1=X_1+X_2$ 对 $\theta$ 充分。

再求 $Y_1$ 的边际分布：$Y_1$ 服从形状参数为 $2$、尺度参数为 $\theta$ 的伽马分布，其密度为

$$
f_{Y_1}(y;\theta)=\frac{y}{\theta^2}\mathrm{e}^{-y/\theta},\qquad y>0.
$$

若对某可测函数 $a(\cdot)$ 有 $\mathbb{E}_\theta[a(Y_1)]=0$ 对一切 $\theta>0$ 成立，则

$$
0=\int_{0}^{+\infty}a(y)\frac{y}{\theta^2}\mathrm{e}^{-y/\theta}\mathrm{d}y.
$$

令 $\lambda=1/\theta>0$，则

$$
0=\lambda^2\int_{0}^{+\infty}\bigl[y\,a(y)\bigr]\mathrm{e}^{-\lambda y}\mathrm{d}y,\qquad \forall\,\lambda>0.
$$

记 $b(y)=y\,a(y)$，上式说明 $b(\cdot)$ 的拉普拉斯变换在一切 $\lambda>0$ 处为 $0$，由拉普拉斯变换唯一性可得 $b(y)=0$（几乎处处），从而 $a(y)=0$（在 $y>0$ 上几乎处处）。故 $Y_1$ 完备。

综上，$Y_1$ 是 $\theta$ 的完备充分统计量。

> [!NOTE]
>
> 同样，我们也可以直接使用正则指数组来直接得到完备充分性。

**（$2$）$Y_1$ 与任意尺度不变统计量独立**

> [!NOTE]
>
> 尺度不变指对任意 $c>0$，
>
> $$
> u(c x_1,c x_2)=u(x_1,x_2).
> $$
>

本模型可写作 $X_i=\theta W_i$，其中 $W_i$ 相互独立且同分布于尺度为 $1$ 的指数分布（其分布不含 $\theta$）。于是

$$
u(X_1,X_2)=u(\theta W_1,\theta W_2)=u(W_1,W_2),
$$

故 $u(X_1,X_2)$ 的分布与 $\theta$ 无关，即 $u(X_1,X_2)$ 是关于 $\theta$ 的从属统计量。由巴苏定理（完备充分统计量与从属统计量独立）知

$$
Y_1\ \perp\ u(X_1,X_2).
$$

**（$3$）尺度不变统计量的性质与例子**

性质：对任意 $c>0$ 满足

$$
u(c x_1,c x_2)=u(x_1,x_2),
$$

因此在尺度族 $X_i=\theta W_i$ 下，$u(X_1,X_2)$ 的分布不依赖于 $\theta$（从属性）。

例子：$u(X_1,X_2)=\dfrac{X_1}{X_2}$，或 $u(X_1,X_2)=\dfrac{X_1}{X_1+X_2}$（均满足尺度不变）。

**证毕。**

---

> #### 题目 ($3$.)：
>
> 设 $X_1,X_2,\dots,X_n$ 是来自如下分布的随机样本，其概率密度函数为
>
> $$
> f(x;\theta)=
> \begin{cases}
> \mathrm{e}^{-(x-\theta)},&\theta<x<+\infty,\ -\infty<\theta<+\infty,\\
> 0,&\text{其他}.
> \end{cases}
> $$
>
> （$1$）求证：第一个次序统计量 $Y_1=\min(X_i)$ 是 $\theta$ 的完备充分统计量。
>
> （$2$）求证：$Y_1$ 与每一个位置不变统计量 $u(X_1,X_2,\dots,X_n)$ 独立。
>
> （$3$）列举位置不变统计量的性质，并举出位置不变统计量的实例。

**解：**

**（$1$）$Y_1=\min(X_i)$ 的充分性与完备性**

样本联合密度为

$$
f(\mathbf{x};\theta)=\prod_{i=1}^{n}\mathrm{e}^{-(x_i-\theta)}\mathbf{I}_{(\theta,+\infty)}(x_i)
=\exp\!\left(-\sum_{i=1}^{n}x_i+n\theta\right)\mathbf{I}_{(\theta,+\infty)}\!\bigl(\min x_i\bigr).
$$

令 $y_1=\min(x_i)$，则

$$
f(\mathbf{x};\theta)
=\underbrace{\exp\!\left(-\sum_{i=1}^{n}x_i\right)}_{h(\mathbf{x})}\cdot
\underbrace{\exp(n\theta)\mathbf{I}_{(\theta,+\infty)}(y_1)}_{g(y_1;\theta)}.
$$

由因子分解定理，$Y_1=\min(X_i)$ 对 $\theta$ 充分。

再证完备性。由次序统计量性质可得 $Y_1$ 的密度为

$$
f_{Y_1}(y;\theta)=n\,\mathrm{e}^{-n(y-\theta)}\mathbf{I}_{(\theta,+\infty)}(y),\qquad -\infty<\theta<+\infty.
$$

若对某可测函数 $a(\cdot)$ 有 $\mathbb{E}_\theta[a(Y_1)]=0$ 对一切 $\theta$ 成立，则

$$
0=\int_{\theta}^{+\infty}a(y)\,n\,\mathrm{e}^{-n(y-\theta)}\mathrm{d}y
=\mathrm{e}^{n\theta}\int_{\theta}^{+\infty}a(y)\,n\,\mathrm{e}^{-ny}\mathrm{d}y,\qquad \forall\,\theta.
$$

因此对一切 $\theta$，

$$
\int_{\theta}^{+\infty}a(y)\,n\,\mathrm{e}^{-ny}\mathrm{d}y=0.
$$

取任意 $a<b$，两式相减得

$$
0=\int_{a}^{b}a(y)\,n\,\mathrm{e}^{-ny}\mathrm{d}y.
$$

由于对任意区间积分均为 $0$，可推出 $a(y)\mathrm{e}^{-ny}=0$（几乎处处），从而 $a(y)=0$（几乎处处）。故 $Y_1$ 完备。

综上，$Y_1$ 是 $\theta$ 的完备充分统计量。

**（$2$）$Y_1$ 与任意位置不变统计量独立**

位置不变指对任意实数 $c$，

$$
u(x_1+c,\dots,x_n+c)=u(x_1,\dots,x_n).
$$

本模型可写作 $X_i=\theta+W_i$，其中 $W_i$ 相互独立同分布且其分布不含 $\theta$。于是

$$
u(X_1,\dots,X_n)=u(\theta+W_1,\dots,\theta+W_n)=u(W_1,\dots,W_n),
$$

故 $u(X_1,\dots,X_n)$ 的分布不依赖于 $\theta$，即其为从属统计量。由巴苏定理得

$$
Y_1\ \perp\ u(X_1,\dots,X_n).
$$

**（$3$）位置不变统计量的性质与例子**

性质：对任意 $c\in\mathbb{R}$，

$$
u(x_1+c,\dots,x_n+c)=u(x_1,\dots,x_n),
$$

因此在位置族 $X_i=\theta+W_i$ 下，$u(X_1,\dots,X_n)$ 的分布不依赖于 $\theta$（从属性）。

例子：$u(X_1,\dots,X_n)=X_{(n)}-X_{(1)}$（样本极差），或 $u(X_1,\dots,X_n)=X_1-X_2$（样本差）。

**证毕。**

---

> #### 题目 ($4$.)：
>
> 设 $X_1,X_2,\dots,X_n$ 是来自均匀分布 $U(\theta-1,\theta+1)$ 的随机样本。$P314$ 例$7.8.1$ 和 $P315$ 例$7.8.2$ 已经证明了次序统计量 $Y_1=\min(X_i)$ 与 $Y_n=\max(X_i)$ 都是 $\theta$ 的最小充分统计量，$T_1=(Y_1+Y_n)/2$ 是 $\theta$ 的极大似然估计量，样本极差 $T_2=Y_n-Y_1$ 是从属统计量。
>
> （$1$）求在给定 $T_2=t$ 时，$T_1$ 的条件数学期望和方差。
>
> （$2$）讨论 $T_1$ 与 $T_2$ 之间的关系。
>
> > [!IMPORTANT]
> >
> > 不考。

**解：**

令

$$
U_i=X_i-\theta,\qquad i=1,2,\dots,n,
$$

则 $U_i\sim U(-1,1)$ 且与 $\theta$ 无关。记

$$
U_{(1)}=\min(U_i),\quad U_{(n)}=\max(U_i),
$$

则

$$
Y_1=\theta+U_{(1)},\quad Y_n=\theta+U_{(n)},\quad T_2=Y_n-Y_1=U_{(n)}-U_{(1)}.
$$

并且

$$
T_1=\frac{Y_1+Y_n}{2}=\theta+\frac{U_{(1)}+U_{(n)}}{2}.
$$

设

$$
M=\frac{U_{(1)}+U_{(n)}}{2},\qquad R=U_{(n)}-U_{(1)}.
$$

则 $T_1=\theta+M$，$T_2=R$。

**（$1$）计算 $\mathbb{E}(T_1\mid T_2=t)$ 与 $\operatorname{Var}(T_1\mid T_2=t)$**

对 $U_i\sim U(-1,1)$，其最小值与最大值的联合密度为

$$
f_{U_{(1)},U_{(n)}}(a,b)=\frac{n(n-1)}{2^n}(b-a)^{n-2},\qquad -1<a<b<1.
$$

> [!NOTE]
>
> 设 $X_{(1)}, X_{(2)}, \dots, X_{(n)}$ 是来自总体 $f(x)$ 的样本次序统计量。第 $i$ 个和第 $j$ 个次序统计量（$1 \le i < j \le n$）的联合密度函数公式为：
>
> $$
> f_{X_{(i)}, X_{(j)}}(a, b) = \frac{n!}{(i-1)!(j-i-1)!(n-j)!} [F(a)]^{i-1} [F(b) - F(a)]^{j-i-1} [1 - F(b)]^{n-j} f(a) f(b)
> $$
>
> 其中限定条件为 $a < b$。

作变换

$$
m=\frac{a+b}{2},\qquad r=b-a,
$$

则

$$
a=m-\frac{r}{2},\quad b=m+\frac{r}{2},\quad \left|\frac{\partial(a,b)}{\partial(m,r)}\right|=1,
$$

并且约束变为

$$
0<r<2,\qquad -1+\frac{r}{2}<m<1-\frac{r}{2}.
$$

故

$$
f_{M,R}(m,r)=\frac{n(n-1)}{2^n}r^{n-2},\qquad 0<r<2,\ -1+\frac{r}{2}<m<1-\frac{r}{2}.
$$

对固定的 $r$，上式对 $m$ 为常数，因此

$$
M\mid (R=r)\sim U\!\left(-1+\frac{r}{2},\,1-\frac{r}{2}\right),
$$

区间长度为 $2-r$，且关于 $0$ 对称。于是

$$
\mathbb{E}(M\mid R=r)=0,\qquad \operatorname{Var}(M\mid R=r)=\frac{(2-r)^2}{12}.
$$

回到 $T_1=\theta+M$，$T_2=R$，得（$0<t<2$）

$$
\mathbb{E}(T_1\mid T_2=t)=\theta+\mathbb{E}(M\mid R=t)=\theta,
$$

$$
\operatorname{Var}(T_1\mid T_2=t)=\operatorname{Var}(M\mid R=t)=\frac{(2-t)^2}{12}.
$$

**（$2$）讨论 $T_1$ 与 $T_2$ 的关系**

由上面的条件分布可直接写出

$$
T_1\mid (T_2=t)\sim U\!\left(\theta-1+\frac{t}{2},\,\theta+1-\frac{t}{2}\right).
$$

因此：

- $T_2$ 的分布与 $\theta$ 无关（从属统计量），而 $T_1$ 在给定 $T_2=t$ 时的分布区间长度为 $2-t$，随 $t$ 改变，故 $T_1$ 与 $T_2$ **不独立**。
- 由于 $\mathbb{E}(T_1\mid T_2)=\theta$ 为常数，

$$
\operatorname{Cov}(T_1,T_2)=\mathbb{E}\!\bigl[(T_1-\theta)T_2\bigr]
=\mathbb{E}\!\Bigl[T_2\,\mathbb{E}(T_1-\theta\mid T_2)\Bigr]=0,
$$

即二者虽不独立，但 **不相关**。

> [!NOTE]
>
> **全期望公式（Law of Iterated Expectations）：**
>
> 对于任意随机变量 $X, Y$，有
>
> $$
> \mathbb{E}[X] = \mathbb{E}[\mathbb{E}(X|Y)]
> $$

**证毕。**

---

> #### 题目 ($5$.)：
>
> 设随机样本 $X_1,X_2,\dots,X_n$ 源自位置模型：$X_i=\theta+W_i$，$i=1,2,\dots,n$，其中参数 $\theta\in(-\infty,+\infty)$，而 $W_1,W_2,\dots,W_n$ 相互独立同分布，且具有不依赖于 $\theta$ 的概率密度函数 $f(w)$。问位置不变统计量 $Z=u(X_1,X_2,\dots,X_n)$ 是从属统计量吗？为什么？

**解：**

位置不变指对任意 $c\in\mathbb{R}$，

$$
u(x_1+c,\dots,x_n+c)=u(x_1,\dots,x_n).
$$

由模型 $X_i=\theta+W_i$ 得

$$
Z=u(X_1,\dots,X_n)=u(\theta+W_1,\dots,\theta+W_n)=u(W_1,\dots,W_n).
$$

右端只由 $W_1,\dots,W_n$ 决定，而其联合分布不含 $\theta$，因此 $Z$ 的分布不依赖于 $\theta$，即 $Z$ 是关于 $\theta$ 的从属统计量。

**证毕。**

---

> #### 题目 (选作 $6$.)：
>
> 设 $X_1,X_2,\dots,X_n$ 表示来自具有概率密度函数 $f(x;\theta)$ 分布的随机样本，$\theta\in\Omega$，其中 $\Omega$ 是一个区间集合。假定：
> （$1$）统计量 $Y$ 是 $\theta$ 的完备且充分统计量；
> （$2$）$Z=u(X_1,X_2,\dots,X_n)$ 是任意其他统计量；若 $Z$ 的分布不依赖于 $\theta$，证明：$Z$ 与完备充分统计量 $Y$ 独立。

**解：**

取任意有界可测函数 $\varphi(\cdot)$，记常数

$$
c=\mathbb{E}_\theta[\varphi(Z)].
$$

由于 $Z$ 的分布不依赖于 $\theta$，故 $c$ 与 $\theta$ 无关。

令

$$
g(Y)=\mathbb{E}_\theta[\varphi(Z)\mid Y]-c.
$$

则由全期望公式，

$$
\mathbb{E}_\theta[g(Y)]
=\mathbb{E}_\theta\!\Bigl[\mathbb{E}_\theta[\varphi(Z)\mid Y]\Bigr]-c
=\mathbb{E}_\theta[\varphi(Z)]-c
=c-c=0,\qquad \forall\,\theta\in\Omega.
$$

由于 $Y$ 对 $\theta$ 完备，$\mathbb{E}_\theta[g(Y)]=0$ 对一切 $\theta$ 成立推出

$$
g(Y)=0\quad \text{几乎必然}.
$$

即

$$
\mathbb{E}_\theta[\varphi(Z)\mid Y]=c=\mathbb{E}_\theta[\varphi(Z)]\quad \text{几乎必然}.
$$

这对任意有界可测 $\varphi$ 都成立，从而 $Z$ 与 $Y$ 独立。

**证毕。**
