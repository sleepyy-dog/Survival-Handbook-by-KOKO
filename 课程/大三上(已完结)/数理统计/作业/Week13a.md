# 第二十讲

## 23339147郑博引

#### 题目 ($1$):
>
> 设 $X_1,X_2,\dots,X_n$ 表示来自如下分布的一个随机样本，此分布具有 $pmf$
>
> $$
> f(x;\theta)=
> \begin{cases}
> \theta^{x}(1-\theta)^{1-x}, & x=0,1,\ 0<\theta<1\\
> 0, & 其他
> \end{cases}
> $$
>
> 统计量 $Y_1=(X_1+X_2+\cdots+X_n)$。求证：当 $y=0,1,2,\dots,n$ 时，$Y_1$ 是 $\theta$ 的充分统计量。

**解：**

> [!NOTE]
>
> 设 $X=(X_1,\dots,X_n)$ 的联合分布依赖参数 $\theta$。统计量 $T(X)$ 称为对参数 $\theta$ 的充分统计量，当：
>
> $$
> P_\theta(X\mid T(X)=t) \quad \text{与}\ \theta\ \text{无关}
> $$
>
> 我们有因子分解定理：
>
> 设样本 $X=(X_1,\dots,X_n)$ 来自密度/质量函数 $f(x\mid\theta)$，$x$ 表示所有样本的取值。
>
> 统计量 $T(X)$ 对 $\theta$ 是**充分的**，当且仅当存在非负函数 $g$ 与 $h$，使得：
>
> $$
> f(x\mid \theta)=g(T(x),\theta)\,h(x),
> $$
>
> 对所有可能的 $x$ 和 $\theta$ 成立。

样本的联合 $pmf$ 为

$$
L(\theta;\boldsymbol x)=\prod_{i=1}^{n}\theta^{x_i}(1-\theta)^{1-x_i}\,I_{\{0,1\}}(x_i)
=\theta^{\sum_{i=1}^{n}x_i}(1-\theta)^{\,n-\sum_{i=1}^{n}x_i}\prod_{i=1}^{n}I_{\{0,1\}}(x_i).
$$

令 $T(\boldsymbol x)=\sum_{i=1}^{n}x_i=y$，则

$$
L(\theta;\boldsymbol x)=\underbrace{\theta^{y}(1-\theta)^{\,n-y}}_{g_\theta(y)}\,
\underbrace{\prod_{i=1}^{n}I_{\{0,1\}}(x_i)}_{h(\boldsymbol x)}.
$$

由因子分解定理，$T(\boldsymbol X)=Y_1$ 对 $\theta$ 充分，且其取值 $y=0,1,2,\dots,n$。

最终结论：$Y_1$ 是 $\theta$ 的充分统计量。

**证毕。**

---

#### 题目 ($2$):
>
> 设 $X_1,X_2,\dots,X_n$ 是来自伽马分布的随机样本，$X_i$ 具有 $pdf$
>
> $$
> f(x;\theta)=
> \begin{cases}
> \dfrac{1}{\Gamma(\alpha)\beta^{\alpha}}x^{\alpha-1}e^{-x/\beta}, & 0<x<\infty\\
> 0, & 其他
> \end{cases}
> $$
>
> 其中 $\alpha=2$，$\beta=\theta>0$。求证：$Y_1=(X_1+X_2+\cdots+X_n)$ 是 $\theta$ 的充分统计量。

**解：**

当 $\alpha=2,\ \beta=\theta$ 时，此时$\Gamma(2)=(2-1)!=1$。

$$
f(x;\theta)=\frac{1}{\Gamma(2)\theta^{2}}\,x\,e^{-x/\theta}I_{(0,\infty)}(x)
=\frac{1}{\theta^{2}}\,x\,e^{-x/\theta}I_{(0,\infty)}(x).
$$

联合 $pdf$ 为

$$
L(\theta;\boldsymbol x)=\prod_{i=1}^{n}\frac{1}{\theta^{2}}x_i e^{-x_i/\theta}I_{(0,\infty)}(x_i)
=\underbrace{\theta^{-2n}\exp\!\left(-\frac{\sum_{i=1}^{n}x_i}{\theta}\right)}_{g_\theta(\sum x_i)}
\,\underbrace{\left(\prod_{i=1}^{n}x_i\right)\prod_{i=1}^{n}I_{(0,\infty)}(x_i)}_{h(\boldsymbol x)}.
$$

依因子分解定理，$Y_1=\sum_{i=1}^{n}X_i$ 对 $\theta$ 充分。

最终结论：$Y_1$ 是 $\theta$ 的充分统计量。

**证毕。**

---

#### 题目 ($3$):
>
> 设 $Y_1<Y_2<\cdots<Y_n$ 表示来自下述分布的样本次序统计量，总体 $pdf$ 为
>
> $$
> f(x;\theta)=e^{-(x-\theta)}\,I_{(\theta,\infty)}(x).
> $$
>
> 用两种方法证明：第一个次序统计量 $Y_1=\min(X_1,X_2,\dots,X_n)$ 是 $\theta$ 的充分统计量。

**解：**

- 方法一（因子分解）：样本联合 $pdf$ 为

  $$
  L(\theta;\boldsymbol x)=\prod_{i=1}^{n}e^{-(x_i-\theta)}I_{(\theta,\infty)}(x_i)
  =e^{-\sum_{i=1}^{n}x_i}\,e^{n\theta}\,I_{(\theta,\infin)}\!\left(\min_{1\le i\le n}x_i\right).
  $$

  记 $T(\boldsymbol x)=\min_{1\le i\le n}x_i=Y_1$，则

  $$
  L(\theta;\boldsymbol x)=\underbrace{e^{n\theta}\,I(\theta\le Y_1)}_{g_\theta(Y_1)}\,
  \underbrace{e^{-\sum_{i=1}^{n}x_i}}_{h(\boldsymbol x)}.
  $$

  因此 $Y_1$ 对 $\theta$ 充分。

- 方法二（条件分布不含参数）：先求 $Y_1$ 的分布。对 $y>\theta$，

  $$
  P_\theta(Y_1\ge y)=\prod_{i=1}^{n}P_\theta(X_i\ge y)=\left(e^{-(y-\theta)}\right)^n=e^{-n(y-\theta)}.
  $$

  因而

  $$
  f_{Y_1}(y;\theta)=n\,e^{-n(y-\theta)}\,I_{(\theta,\infty)}(y).
  $$

  由无记忆性，给定 $Y_1=y$ 后，$\{X_i-y:i=1,2,\dots,n\}$ 中恰有一个为 $0$，其余 $n-1$ 个为独立的指数 $(1)$ 变量，故

  $$
  f_{\boldsymbol X\,|\,Y_1}( \boldsymbol x\,|\,y)\ \propto\ e^{-\sum_{i=1}^{n}(x_i-y)}\,
  I\!\left(x_i\ge y,\ \min_{1\le i\le n}x_i=y\right),
  $$

  > [!NOTE]
  >
  > 我们有
  >
  > $$
  > f_{\boldsymbol X|Y_1}(\boldsymbol x|y;\theta) =\frac{f_{\boldsymbol X}(\boldsymbol x;\theta)}{f_{Y_1}(y;\theta)}, \quad \text{在 } y = \min_i x_i \text{ 且 } y>\theta \text{ 时}.
  > $$
  >
  > 我们只需要证明这个量和$\theta$无关即说明充分统计量的充分性：
  >
  > $T(X)$ 对 $\theta$ 充分 $\Longleftrightarrow$ 对任意 $t$，给定 $T(X)=t$ 后，条件分布 $f_{X\mid T}(x\mid t)$ **不再依赖于 $\theta$**。

由：

$$
\begin{aligned}
f_{\boldsymbol{X}|Y_1}(\boldsymbol{x}|y; \theta) &= \frac{e^{-\sum x_i + n\theta}}{n e^{-ny + n\theta}} \\
&= \frac{1}{n} e^{-\sum x_i + ny} \\
&= \frac{1}{n} e^{-\sum_{i=1}^n (x_i - y)}
\end{aligned}
$$

最终结论：$Y_1=\min(X_1,\dots,X_n)$ 是 $\theta$ 的充分统计量。

**证毕。**

---

#### 题目 ($4$):
>
> 设 $X_1,X_2,\dots,X_n$ 表示来自具有 $pdf$ 或 $pmf$ 为 $f(x;\theta)$ 的总体的随机样本，$\theta\in\Omega$。求证：统计量 $Y_1=u_1(X_1,X_2,\dots,X_n)$ 是 $\theta$ 的充分统计量，当且仅当，存在两个非负函数 $k_1,k_2$ 使
>
> $$
> \prod_{i=1}^{n}f(x_i;\theta)=k_1\!\left(u_1(x_1,\dots,x_n);\theta\right)\,k_2(x_1,\dots,x_n),
> $$
>
> 其中 $k_2(x_1,\dots,x_n)$ 不依赖于 $\theta$。
>
> > [!IMPORTANT]
> >
> > 不考。

**解：**

- 充分性（“若”）：若上式因子分解成立，则对任意可测集合 $A$ 与 $y$，

  $$
  P_\theta\!\left(\boldsymbol X\in A\,\big|\,u_1(\boldsymbol X)=y\right)
  =\frac{\int_{A\cap\{u_1(\boldsymbol x)=y\}}k_1(y;\theta)\,k_2(\boldsymbol x)\,d\boldsymbol x}
  {\int_{\{u_1(\boldsymbol x)=y\}}k_1(y;\theta)\,k_2(\boldsymbol x)\,d\boldsymbol x}
  =\frac{\int_{A\cap\{u_1(\boldsymbol x)=y\}}k_2(\boldsymbol x)\,d\boldsymbol x}
  {\int_{\{u_1(\boldsymbol x)=y\}}k_2(\boldsymbol x)\,d\boldsymbol x},
  $$

  结果与 $\theta$ 无关，故 $Y_1$ 对 $\theta$ 充分。

- 必要性（“仅当”）：若 $Y_1$ 对 $\theta$ 充分，则令

  $$
  k_1(y;\theta)=f_{Y_1}(y;\theta),\qquad
  k_2(\boldsymbol x)=f_{\boldsymbol X\,|\,Y_1}\!\left(\boldsymbol x\,\big|\,u_1(\boldsymbol x)\right),
  $$

  则由分解公式

  $$
  f_{\boldsymbol X}(\boldsymbol x;\theta)
  =f_{\boldsymbol X\,|\,Y_1}\!\left(\boldsymbol x\,\big|\,u_1(\boldsymbol x)\right)\,
   f_{Y_1}\!\left(u_1(\boldsymbol x);\theta\right)
  =k_2(\boldsymbol x)\,k_1\!\left(u_1(\boldsymbol x);\theta\right),
  $$

  且因 $Y_1$ 充分，$k_2$ 不依赖于 $\theta$。于是得到所需因子分解。

最终结论：上述等价性成立，即因子分解定理。

**证毕。**

---

#### 题目 ($5$):
>
> 设 $X_1,X_2,\dots,X_n$ 表示来自如下分布的随机样本，此分布具有 $pdf$
>
> $$
> f(x;\theta)=
> \begin{cases}
> \theta\,x^{\theta-1}, & 0<x<1\\
> 0, & 其他
> \end{cases}
> $$
>
> 其中 $\theta>0$。求证：$u_1(X_1,X_2,\dots,X_n)=\displaystyle\prod_{i=1}^{n}X_i$ 是 $\theta$ 的充分统计量。

**解：**
样本联合 $pdf$ 为

$$
L(\theta;\boldsymbol x)=\prod_{i=1}^{n}\theta\,x_i^{\theta-1}I_{(0,1)}(x_i)
=\theta^n\left(\prod_{i=1}^{n}x_i\right)^{\theta-1}\prod_{i=1}^{n}I_{(0,1)}(x_i).
$$

令 $T(\boldsymbol x)=\prod_{i=1}^{n}x_i=y$，则

$$
L(\theta;\boldsymbol x)=\underbrace{\theta^n\,y^{\theta-1}}_{g_\theta(y)}\,
\underbrace{\prod_{i=1}^{n}I_{(0,1)}(x_i)}_{h(\boldsymbol x)}.
$$

由因子分解定理，$u_1(\boldsymbol X)=\prod_{i=1}^{n}X_i$ 对 $\theta$ 充分。
最终结论：$\prod_{i=1}^{n}X_i$ 是 $\theta$ 的充分统计量。

**证毕。**

---

#### 题目 ($6$):
>
> 设 $X_1,X_2,\dots,X_n$ 表示来自分布 $N(\theta,\sigma^2)$ 的随机样本，其中 $-\infty<x<\infty$，方差 $\sigma^2>0$ 已知。求证：样本均值
>
> $$
> \bar X=\frac{1}{n}\sum_{i=1}^{n}X_i
> $$
>
> 是 $\theta$ 的一个充分统计量。

**解：**
联合 $pdf$ 为

$$
L(\theta;\boldsymbol x)=(2\pi\sigma^2)^{-n/2}\exp\!\left\{-\frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i-\theta)^2\right\}.
$$

利用恒等式

$$
\sum_{i=1}^{n}(x_i-\theta)^2=\sum_{i=1}^{n}(x_i-\bar x)^2+n(\bar x-\theta)^2,
$$

得

$$
L(\theta;\boldsymbol x)=(2\pi\sigma^2)^{-n/2}
\exp\!\left\{-\frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i-\bar x)^2\right\}
\cdot
\exp\!\left\{-\frac{n}{2\sigma^2}(\bar x-\theta)^2\right\}.
$$

即

$$
L(\theta;\boldsymbol x)=\underbrace{\exp\!\left\{-\frac{n}{2\sigma^2}(\bar x-\theta)^2\right\}}_{g_\theta(\bar x)}
\cdot
\underbrace{(2\pi\sigma^2)^{-n/2}\exp\!\left\{-\frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i-\bar x)^2\right\}}_{h(\boldsymbol x)}.
$$

由因子分解定理，$\bar X$ 对 $\theta$ 充分。
最终结论：样本均值 $\bar X$ 是 $\theta$ 的充分统计量。

**证毕。**
