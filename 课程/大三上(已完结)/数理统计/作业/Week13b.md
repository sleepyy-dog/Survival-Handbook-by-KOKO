# 第二十一讲

## 郑博引23339147

> #### 题目 ($1.$):
>
> 设 $X_1,X_2,X_3$ 是来自均值 $\theta>0$ 的指数分布的随机样本，其 $pdf$ 为
>
> $$
> f(x;\theta)=
> \begin{cases}
> \dfrac{1}{\theta}\,e^{-x/\theta},& 0<x<\infty,\ \theta>0,\\[6pt]
> 0,& \text{其他}.
> \end{cases}
> $$
>
> $(1)$ 求证：$Y_1=X_1+X_2+X_3$ 是 $\theta$ 的充分统计量。
>
> $(2)$ 求 $\theta$ 的无偏估计量，使其是充分统计量 $Y_1$ 的函数。
>
> $(3)$ 设 $Y_2=X_2+X_3,\ Y_3=X_3$，求
>
> $$
> T(y_3)=E_\theta\!\left[\left.\dfrac{Y}{3}\right|\,Y_3=y_3\right],\quad \text{其中 } Y=X_1+X_2+X_3.
> $$
>
> $(4)$ 证：$E_\theta[T(Y_3)]=\theta$，且 $Var[T(Y_3)]\le Var(Y_1/3)=\theta^2/3$，但 $T(Y_3)$ 不是统计量。

> [!IMPORTANT]
>
> 重要。

**解：**

$(1)$ 联合密度为

$$
f(x_1,x_2,x_3;\theta)=\prod_{i=1}^{3}\frac{1}{\theta}e^{-x_i/\theta}\,I(x_i>0)
=\theta^{-3}\exp\!\left(-\frac{x_1+x_2+x_3}{\theta}\right)\prod_{i=1}^{3}I(x_i>0).
$$

令 $Y_1=x_1+x_2+x_3$，则

$$
f(x_1,x_2,x_3;\theta)=\underbrace{\theta^{-3}e^{-Y_1/\theta}}_{g(Y_1;\theta)}
\cdot \underbrace{\prod_{i=1}^{3}I(x_i>0)}_{h(x_1,x_2,x_3)},
$$

其中 $h(\cdot)$ 与 $\theta$ 无关。由分解定理得 $Y_1$ 是 $\theta$ 的充分统计量。

$(2)$ 取

$$
\delta(Y_1)=\frac{Y_1}{3},
$$

则

$$
E_\theta[\delta(Y_1)]=\frac{1}{3}E_\theta[X_1+X_2+X_3]=\frac{1}{3}\cdot 3\theta=\theta,
$$

故 $\delta(Y_1)=Y_1/3$ 是 $\theta$ 的无偏估计量，且它是充分统计量 $Y_1$ 的函数。

$(3)$ 因 $X_1,X_2,X_3$ 相互独立，且 $E_\theta[X_i]=\theta$，于是

$$
T(y_3)=E_\theta\!\left[\left.\frac{X_1+X_2+X_3}{3}\right|\,X_3=y_3\right]
=\frac{E_\theta[X_1]+E_\theta[X_2]+y_3}{3}
=\frac{2\theta+y_3}{3}.
$$

$(4)$ 由上式，

$$
E_\theta[T(Y_3)]=E_\theta\!\left[\frac{2\theta+Y_3}{3}\right]
=\frac{2\theta+E_\theta[Y_3]}{3}=\frac{2\theta+\theta}{3}=\theta.
$$

又

$$
Var\big(T(Y_3)\big)=Var\!\left(\frac{2\theta+Y_3}{3}\right)=\frac{1}{9}Var(Y_3)=\frac{\theta^2}{9}
\le \frac{\theta^2}{3}=Var(Y_1/3),
$$

其中最后一步用了方差不增原理 $Var\!\big(E[U|V]\big)\le Var(U)$，取 $U=Y_1/3,\ V=Y_3$。
并且 $T(Y_3)=\dfrac{2\theta+Y_3}{3}$ 的表达式含未知参数 $\theta$，不是仅依赖样本的函数，故 $T(Y_3)$ 不是统计量。

**证毕。**

---

> #### 题目 ($2.$):
>
> 设 $X_1,X_2,\ldots,X_n$ 表示来自分布具有 $pdf$ 或 $pmf$ 为 $f(x;\theta)$ 的随机样本，$\theta\in\Omega_\theta$。如果 $\theta$ 的充分统计量 $\bar Y=u_1(X_1,\ldots,X_n)$ 存在，同时如果 $\theta$ 的极大似然估计量 $\hat\theta$ 唯一地存在，证明：$\hat\theta$ 是 $\bar Y=u_1(X_1,\ldots,X_n)$ 的函数。

**解：**

由分解定理，存在函数 $g,h$ 使

$$
f(x_1,\ldots,x_n;\theta)=g\big(u_1(x_1,\ldots,x_n),\theta\big)\,h(x_1,\ldots,x_n),
$$

其中 $h$ 与 $\theta$ 无关。对任意两组样本 $x^{(1)},x^{(2)}$ 满足 $u_1(x^{(1)})=u_1(x^{(2)})=y$，有

$$
\frac{f(x^{(1)};\theta)}{f(x^{(2)};\theta)}
=\frac{g(y,\theta)\,h(x^{(1)})}{g(y,\theta)\,h(x^{(2)})}
=\frac{h(x^{(1)})}{h(x^{(2)})},
$$

右端与 $\theta$ 无关，故两者的似然函数作为 $\theta$ 的函数是成比例的，极大值点完全相同。由于极大似然估计 $\hat\theta$ 唯一存在，于是对所有 $x$ 只要 $u_1(x)=y$，其极大似然估计值相同。定义

$$
\varphi(y)=\hat\theta(x)\quad \text{当 }u_1(x)=y,
$$

则 $\hat\theta=\varphi\big(u_1(X_1,\ldots,X_n)\big)=\varphi(\bar Y)$，即 $\hat\theta$ 是充分统计量 $\bar Y$ 的函数。

**证毕。**

---

> #### 题目 ($3.$):
>
> 设 $X_1,X_2,\ldots,X_n$ 为 $iid$，其 $pdf$ 为
>
> $$
> f(x;\theta)=
> \begin{cases}
> \theta e^{-\theta x},& 0<x<\infty,\ \theta>0,\\[4pt]
> 0,& \text{其他}.
> \end{cases}
> $$
>
> 求 $\theta$ 的极小方差无偏估计量。

**解：**

令 $Y=\sum_{i=1}^{n}X_i$。由分解定理 $Y$ 是 $\theta$ 的充分统计量，且

$$
Y\sim \Gamma(n,\text{rate}=\theta),\quad f_Y(y)=\frac{\theta^n}{\Gamma(n)}y^{n-1}e^{-\theta y},\ y>0.
$$

计算

$$
E_\theta\!\left[\frac{1}{Y}\right]
=\frac{\theta^n}{\Gamma(n)}\int_0^\infty y^{n-2}e^{-\theta y}\,dy
=\frac{\theta^n}{\Gamma(n)}\cdot \frac{\Gamma(n-1)}{\theta^{\,n-1}}
=\frac{\theta}{n-1},\quad n>1.
$$

故

$$
\delta(Y)=\frac{n-1}{Y}
$$

是 $\theta$ 的无偏估计量。

> [!NOTE]
>
> **定理（指数族的完备性）：**
> 若 $\{f(x;\theta)\}$ 构成一参数指数族
>
>$$
> f(x;\theta)
> = \exp\{ \theta T(x) - A(\theta)\} h(x),
> $$
>
>且参数空间为开区间，$T(X)$ 是自然充分统计量，则在适当的正则条件下，$T(X)$ 关于 $\theta$ 是完备的。
>
>密度可以写成规范指数族形式： $f_Y(y;\theta)=\exp\{n\log \theta - \theta y + (n-1)\log y - \log \Gamma(n)\},\quad y>0,$ 其中自然统计量是 $T(y) = y$；$A(\theta) = -n\log\theta$（或等价写法中）在 $(0,\infty)$ 上无限可导、解析；分布非退化，各种积分良好。

**由于 $\{f_Y(y;\theta)\}$ 作为 $\theta$ 的一参数指数族在统计量 $Y$ 下是完备的**，$\delta(Y)$ 为充分统计量的函数且无偏，依完备-充分定理:

> [!NOTE]
>
> 若 $T$ 是关于 $\theta$ 的完备且充分的统计量，且 $\delta(T)$ 是 $g(\theta)$ 的无偏估计量，则 $\delta(T)$ 是 $g(\theta)$ 的唯一 UMVUE。

知其即为极小方差无偏估计量：

$$
\widehat{\theta}_{UMVUE}=\frac{n-1}{\sum_{i=1}^{n}X_i},\quad n\ge 2.
$$

**证毕。**

---

> #### 题目 ($4.$):
>
> 设 $X_1,X_2,\ldots,X_n$ 为来自总体 $X$ 的样本，总体 $X$ 服从参数为 $\lambda$ 的指数分布。试求参数 $\lambda$ 的矩估计、无偏估计、无偏估计的方差、最小方差无偏估计。

**解：**

- 矩估计：$E[X]=1/\lambda$，令样本均值 $\overline X=\dfrac{1}{n}\sum_{i=1}^{n}X_i$，解得

  $$
  \hat\lambda_{MM}=\frac{1}{\overline X}.
  $$

- 无偏估计与其方差：令 $Y=\sum_{i=1}^{n}X_i\sim \Gamma(n,\text{rate}=\lambda)$，（指数分布的和服从伽马分布），即

  $$
  f_Y(y) = \frac{\lambda^n}{\Gamma(n)} y^{n-1} e^{-\lambda y}, \quad y>0.
  $$

  > [!NOTE]
  >
  > 设随机变量 $X$ 服从形状参数 $\alpha$ 和尺度参数 $\beta$ 的伽马分布，记作 $X \sim \Gamma(\alpha, \beta)$，其概率密度函数为：
>
  > $$
  > f(x) = \frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha-1} e^{-\beta x}, \quad x > 0
  > $$
>
  > 均值为$\frac{\alpha}{\beta}$,方差为$\frac{\alpha}{\beta^2}$。
  >
  > 同时和指数分布有一定关系：
>
  > $$
  > \Gamma(1, \beta) = Exp(\beta)
  > $$
>
  > 若 $X_1, X_2, \ldots, X_n$ 独立同分布于 $Exp(\beta)$，则：
>
  > $$
  > \sum_{i=1}^{n} X_i \sim \Gamma(n, \beta)
  > $$

  与上题同理，有

$$
  E_\lambda\!\left[\frac{1}{Y}\right]=\frac{\lambda}{n-1},\quad
  E_\lambda\!\left[\frac{1}{Y^2}\right]=\frac{\lambda^2}{(n-1)(n-2)},\ n>2.
$$

  故

$$
  \hat\lambda_U=\frac{n-1}{Y}=\frac{n-1}{\sum_{i=1}^{n}X_i},\quad n\ge 2,
$$

  且当 $n>2$ 时

$$
  Var(\hat\lambda_U)=(n-1)^2\left(E\!\left[\frac{1}{Y^2}\right]-E\!\left[\frac{1}{Y}\right]^2\right)
  =\frac{\lambda^2}{n-2}.
$$

- 最小方差无偏估计：$Y$ 为 $\lambda$ 的完备充分统计量，$\hat\lambda_U$ 是其函数且无偏，故

  $$
  \widehat{\lambda}_{UMVUE}=\frac{n-1}{\sum_{i=1}^{n}X_i}\quad (n\ge 2).
  $$

**证毕。**

> [!NOTE]
>
> 这题似乎挺重要的。可能会把参数$\theta$改成$\frac{1}{\theta}$来考。
