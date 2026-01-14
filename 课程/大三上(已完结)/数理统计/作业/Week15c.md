# Week15c

## 23339147郑博引

#### 题目 (题号$1$):


> 设 $X_1,X_2,\dots,X_n$ 来自均匀分布 $U(\theta-1,\theta+1)$ 的随机样本。
>
> （$1$）证明次序统计量 $Y_1=\min_{1\le i\le n}X_i$ 与 $Y_n=\max_{1\le i\le n}X_i$ 构成 $\theta$ 的最小充分统计量，并说明最小充分统计量不唯一。
>
> （$2$）问 $\theta$ 的极大似然估计是否唯一？为什么？
>
> （$3$）问极大似然估计量 $\hat\theta=(Y_1+Y_n)/2$ 是否是参数 $\theta$ 的最小充分统计量？为什么？

> [!IMPORTANT]
>
> 必考。多考一个先证明单个不是充分统计量。会考从定义证明。
>
> **定义法证明：**
>
> 首先，均匀分布 $U(\theta-1, \theta+1)$ 的单个样本密度函数为：
>
> $$
> f(x; \theta) = \frac{1}{2}, \quad \theta-1 \le x \le \theta+1
> $$
>
> 利用指示函数 $I(\cdot)$，样本量为 $n$ 的联合密度函数为：
>
> $$
> f(x_1, \dots, x_n; \theta) = \left( \frac{1}{2} \right)^n \prod_{i=1}^n I_{[\theta-1, \theta+1]}(x_i)
> $$
>
> 由于 $\theta-1 \le x_i \le \theta+1$ 对所有 $i$ 成立等价于 $\theta-1 \le \min(x_i)$ 且 $\max(x_i) \le \theta+1$，联合密度可写为：
>
> $$
> f(\mathbf{x}; \theta) = \frac{1}{2^n} I_{[\theta-1, +\infty)}(y_1) \cdot I_{(-\infty, \theta+1]}(y_n) \cdot I_{\{y_1 \le x_1, \dots, x_n \le y_n\}}
> $$
>
> 为了使用定义法，我们需要先求出统计量 $T = (Y_1, Y_n)$ 的联合密度函数 $g(y_1, y_n; \theta)$。 对于 $n$ 个样本的均匀分布，其极值统计量的联合密度公式为：
>
> $$
> g(y_1, y_n; \theta) = n(n-1) [F(y_n) - F(y_1)]^{n-2} f(y_1) f(y_2)
> $$
>
> 代入本题参数：
>
> * $F(x) = \frac{x-(\theta-1)}{2}$
> * $f(x) = \frac{1}{2}$
>
> 在区域 $\theta-1 \le y_1 < y_n \le \theta+1$ 内：
>
> $$
> g(y_1, y_n; \theta) = n(n-1) \left[ \frac{y_n - y_1}{2} \right]^{n-2} \frac{1}{4} = \frac{n(n-1)}{2^n} (y_n - y_1)^{n-2}
> $$
>
> **定义法核心**：计算条件概率密度 $h(\mathbf{x} | y_1, y_n) = \frac{f(\mathbf{x}; \theta)}{g(y_1, y_n; \theta)}$，若结果与 $\theta$ 无关，则充分性得证。
>
>$$
>h(\mathbf{x} | y_1, y_n) = \frac{\frac{1}{2^n} I_{[\theta-1, \theta+1]}(\text{all } x_i)}{\frac{n(n-1)}{2^n} (y_n - y_1)^{n-2} I_{[\theta-1 \le y_1 < y_n \le \theta+1]}}
> $$
>
>**分析条件：**
>
>1. 当样本 $\mathbf{x}$ 确定的情况下，其对应的 $y_1$ 和 $y_n$ 是确定的。
>2. 如果样本观测值与给定的 $(y_1, y_n)$ 不一致（即 $\min x_i \neq y_1$ 或 $\max x_i \neq y_n$），则条件概率为 $0$。
>3. 如果一致，则指示函数中的 $\theta$ 范围限制在分子分母中是**同步**的。只要 $y_1, y_n$ 在允许范围内，指示函数的值都为 $1$。
>
>消去相同项后得到：
>
>$$
>h(\mathbf{x} | y_1, y_n) = \frac{1}{n(n-1)(y_n - y_1)^{n-2}}
> $$
>
>**结论**：该条件分布仅取决于样本观测值本身（通过 $y_1, y_n$ 体现），而与参数 $\theta$ 完全无关。因此，根据定义，$(Y_1, Y_n)$ 是 $\theta$ 的充分统计量。

**解：**

（$1$）对单个观测 $X_i$，其密度为

$$
f(x_i;\theta)=\frac{1}{2}\,\mathbf{1}\{\theta-1\le x_i\le \theta+1\}.
$$

故样本联合密度为

$$
f_\theta(x_1,\dots,x_n)=2^{-n}\mathbf{1}\{\theta-1\le x_i\le \theta+1,\ i=1,2,\dots,n\}.
$$

令 $Y_1=\min_{1\le i\le n}X_i$，$Y_n=\max_{1\le i\le n}X_i$，则约束$\theta-1\le x_i\le \theta+1\ (\forall i)$ 等价于

$$
\theta-1\le Y_1,\qquad Y_n\le \theta+1
\iff
Y_n-1\le \theta\le Y_1+1.
$$

因此

$$
f_\theta(x_1,\dots,x_n)=2^{-n}\mathbf{1}\{Y_n-1\le \theta\le Y_1+1\},
$$

由因子分解定理知 $T=(Y_1,Y_n)$ 为 $\theta$ 的充分统计量。

再用最小充分统计量的似然比判别准则。对两组样本 $x$ 与 $x'$，有

$$
\frac{f_\theta(x)}{f_\theta(x')}
=
\frac{\mathbf{1}\{Y_n(x)-1\le \theta\le Y_1(x)+1\}}
{\mathbf{1}\{Y_n(x')-1\le \theta\le Y_1(x')+1\}}.
$$

若该比值与 $\theta$ 无关，则必有两区间
$[Y_n(x)-1,\,Y_1(x)+1]$ 与 $[Y_n(x')-1,\,Y_1(x')+1]$ 相同，从而

$$
Y_1(x)=Y_1(x'),\qquad Y_n(x)=Y_n(x').
$$

反之若上式成立，则比值恒为常数。故 $T=(Y_1,Y_n)$ 为最小充分统计量。

并且最小充分统计量不唯一：例如令

$$
T_1=Y_1+Y_n,\qquad T_2=Y_n-Y_1,
$$

则 $(T_1,T_2)\leftrightarrow(Y_1,Y_n)$ 一一对应，因此 $(T_1,T_2)$ 也是最小充分统计量。

（$2$）似然函数为

$$
L(\theta)=2^{-n}\mathbf{1}\{Y_n-1\le \theta\le Y_1+1\}.
$$

它在区间 $[Y_n-1,\,Y_1+1]$ 上取同一常数 $2^{-n}$，故任意

$$
\theta\in[Y_n-1,\,Y_1+1]
$$

都是极大似然解，极大似然估计一般不唯一。

（$3$）$\hat\theta=(Y_1+Y_n)/2$ 不是最小充分统计量（甚至不充分）。取 $n=2$：

* 样本 $x=(0,1)$，则 $\hat\theta=0.5$，且 $L_x(\theta)>0\iff \theta\in[0,1]$；
* 样本 $x'=(-0.49,1.49)$，则 $\hat\theta=0.5$，且 $L_{x'}(\theta)>0\iff \theta\in[0.49,0.51]$。

两样本满足 $\hat\theta(x)=\hat\theta(x')$，但对应似然函数对 $\theta$ 的依赖不同，故仅由 $\hat\theta$ 不能刻画 $L(\theta)$，从而 $\hat\theta$ 不充分，更不可能是最小充分统计量。

**证毕。**

---

> #### 题目 (题号$2$):
>
> 尺度模型：$X_i=\theta W_i$，$i=1,2,\dots,n$（$7.8.4$），其中 $\theta>0$，且 $W_1,W_2,\dots,W_n$ 独立同分布，其概率密度函数与 $\theta$ 无关。
> （$1$）说明为什么任一尺度不变统计量 $Z=u(X_1,X_2,\dots,X_n)$ 的分布不依赖于 $\theta$。
> （$2$）举若干尺度不变统计量的例子。
> （$3$）说明为什么 $X_1/(X_1+X_2)$ 具有尺度不变性。

**解：**

（$1$）尺度不变指对任意 $c>0$，

$$
u(c x_1,c x_2,\dots,c x_n)=u(x_1,x_2,\dots,x_n).
$$

由模型 $X_i=\theta W_i$ 得

$$
Z=u(X_1,\dots,X_n)=u(\theta W_1,\dots,\theta W_n)=u(W_1,\dots,W_n).
$$

右端不含 $\theta$，且 $W_1,\dots,W_n$ 的分布与 $\theta$ 无关，故 $Z$ 的分布不依赖于 $\theta$。

（$2$）尺度不变统计量例子（均满足对任意 $c>0$ 不变）：

* 比值 $X_i/X_j$；
* 归一化向量 $(X_1/X_n,\dots,X_{n-1}/X_n)$；
* 变异系数 $S/\bar X$（其中 $\bar X=\frac{1}{n}\sum_{k=1}^n X_k$，$S=\sqrt{\frac{1}{n-1}\sum_{k=1}^n (X_k-\bar X)^2}$）。

（$3$）对任意 $c>0$，

$$
\frac{cX_1}{cX_1+cX_2}=\frac{X_1}{X_1+X_2},
$$

故 $X_1/(X_1+X_2)$ 具有尺度不变性。

**证毕。**

---

> #### 题目 (题号$3$):
>
> 位置模型：$X_i=\theta+W_i$，$i=1,2,\dots,n$（$7.8.3$），其中 $\theta\in(-\infty,+\infty)$，且 $W_1,W_2,\dots,W_n$ 独立同分布，其概率密度函数与 $\theta$ 无关。
>
> （$1$）说明为什么任一位置不变统计量 $Z=u(X_1,X_2,\dots,X_n)$ 的分布不依赖于 $\theta$。
> （$2$）举若干位置不变统计量的例子。
> （$3$）说明为什么极差 $\max_{1\le i\le n}X_i-\min_{1\le i\le n}X_i$ 具有位置不变性。

**解：**

（$1$）位置不变指对任意 $a\in\mathbb{R}$，

$$
u(x_1+a,x_2+a,\dots,x_n+a)=u(x_1,x_2,\dots,x_n).
$$

由模型 $X_i=\theta+W_i$ 得

$$
Z=u(X_1,\dots,X_n)=u(\theta+W_1,\dots,\theta+W_n)=u(W_1,\dots,W_n),
$$

右端不含 $\theta$，且 $W_1,\dots,W_n$ 的分布与 $\theta$ 无关，故 $Z$ 的分布不依赖于 $\theta$。

（$2$）位置不变统计量例子：

* 差值 $X_i-X_j$；
* 中心化残差 $X_i-\bar X$（$\bar X=\frac{1}{n}\sum_{k=1}^n X_k$）；
* 极差 $R=\max_{1\le i\le n}X_i-\min_{1\le i\le n}X_i$；
* 样本方差 $S^2=\frac{1}{n-1}\sum_{k=1}^n (X_k-\bar X)^2$。

（$3$）对任意 $a\in\mathbb{R}$，

$$
\max_{i}(X_i+a)-\min_{i}(X_i+a)
=
\bigl(\max_{i}X_i+a\bigr)-\bigl(\min_{i}X_i+a\bigr)
=
\max_{i}X_i-\min_{i}X_i,
$$

故极差具有位置不变性。

**证毕。**

---

> #### 题目 (题号$4$):
>
> 考察位置模型 $X_i=\theta+W_i$（$7.8.2$），其中 $W_1,W_2,\dots,W_n$ 独立同分布，具有共同密度 $f(w)$ 及连续分布函数 $F(w)$。由例$7.7.5$ 知次序统计量 $Y_1<Y_2<\dots<Y_n$ 是该模型下一个完备充分统计量集合。问：是否能获得比 $\{Y_1,\dots,Y_n\}$ 更小的最小充分统计量集合？举例说明。

**解：**

是否能“缩小”取决于 $f$ 的具体形式；在某些特殊分布下确可用更低维的统计量达到最小充分。

例如令 $W_i\sim N(0,\sigma^2)$（$\sigma^2$ 已知），则 $X_i\sim N(\theta,\sigma^2)$，其联合密度为

$$
f_\theta(x_1,\dots,x_n)=(2\pi\sigma^2)^{-n/2}\exp\!\left(-\frac{1}{2\sigma^2}\sum_{i=1}^n(x_i-\theta)^2\right).
$$

展开平方和：

$$
\sum_{i=1}^n(x_i-\theta)^2=\sum_{i=1}^n x_i^2-2\theta\sum_{i=1}^n x_i+n\theta^2,
$$

从而

$$
f_\theta(x_1,\dots,x_n)
=
\exp\!\left(\frac{\theta}{\sigma^2}\sum_{i=1}^n x_i-\frac{n\theta^2}{2\sigma^2}\right)\cdot
(2\pi\sigma^2)^{-n/2}\exp\!\left(-\frac{1}{2\sigma^2}\sum_{i=1}^n x_i^2\right).
$$

由因子分解定理，统计量

$$
T=\sum_{i=1}^n X_i\quad(\text{等价地 } \bar X)
$$

为充分统计量；且该一参数正态族为满秩指数族，故 $T$ 还是完备充分统计量，从而为最小充分统计量。于是相较于 $\{Y_1,\dots,Y_n\}$，此处可用单个统计量 $\{T\}$ 给出更小的最小充分统计量集合。

**证毕。**

---

> #### 题目 (题号$5$):
>
> 位置—尺度模型：$X_i=\theta_1+\theta_2W_i$，$i=1,2,\dots,n$（$7.8.5$），其中 $\theta_2>0$，$W_1,W_2,\dots,W_n$ 独立同分布，其概率密度函数与 $\theta_1,\theta_2$ 无关。
> （$1$）说明为什么任一位置与尺度不变统计量 $Z=u(X_1,\dots,X_n)$ 的分布不依赖于 $\theta_1$，也不依赖于 $\theta_2$。
> （$2$）举若干位置与尺度不变统计量的例子。
> （$3$）说明统计量 $T_4=\lvert X_i-X_j\rvert/S$ 具有位置与尺度不变性（$S$ 为样本标准差）。

**解：**

（$1$）位置与尺度不变指对任意 $a\in\mathbb{R}$、$b>0$，

$$
u(a+bx_1,a+bx_2,\dots,a+bx_n)=u(x_1,x_2,\dots,x_n).
$$

由模型 $X_i=\theta_1+\theta_2W_i$ 得

$$
Z=u(X_1,\dots,X_n)=u(\theta_1+\theta_2W_1,\dots,\theta_1+\theta_2W_n)=u(W_1,\dots,W_n),
$$

右端不含 $\theta_1,\theta_2$，且 $W_1,\dots,W_n$ 的分布与二者无关，故 $Z$ 的分布同时不依赖于 $\theta_1$ 与 $\theta_2$。

（$2$）位置与尺度不变统计量例子：

* 标准化残差 $(X_i-\bar X)/S$；
* 样本偏度

$$
b_1=\frac{\frac{1}{n}\sum_{k=1}^n (X_k-\bar X)^3}{S^3};
$$

* 样本峰度

$$
b_2=\frac{\frac{1}{n}\sum_{k=1}^n (X_k-\bar X)^4}{S^4}.
$$

（$3$）令

$$
\bar X=\frac{1}{n}\sum_{k=1}^n X_k,\qquad
S=\sqrt{\frac{1}{n-1}\sum_{k=1}^n (X_k-\bar X)^2}.
$$

对任意 $a\in\mathbb{R}$、$b>0$，令变换后样本 $X_k'=a+bX_k$，则

$$
\bar X'=a+b\bar X,\qquad S'=bS.
$$

于是

$$
\frac{|X_i'-X_j'|}{S'}
=
\frac{|(a+bX_i)-(a+bX_j)|}{bS}
=
\frac{b|X_i-X_j|}{bS}
=
\frac{|X_i-X_j|}{S},
$$

故 $T_4=|X_i-X_j|/S$ 具有位置与尺度不变性。

**证毕。**

---

> #### 题目 (题号$6$):
>
> 设 $X_1,X_2,\dots,X_n$ 来自均匀分布 $U(\theta-1,\theta+1)$。证明次序统计量 $Y_1=\min_{1\le i\le n}X_i$ 与 $Y_n=\max_{1\le i\le n}X_i$ 构成参数 $\theta$ 的最小充分统计量。

**解：**

对单个观测 $X_i$，

$$
f(x_i;\theta)=\frac{1}{2}\,\mathbf{1}\{\theta-1\le x_i\le \theta+1\},
$$

故联合密度为

$$
f_\theta(x_1,\dots,x_n)=2^{-n}\mathbf{1}\{\theta-1\le x_i\le \theta+1,\ i=1,2,\dots,n\}.
$$

令 $Y_1=\min_{i}X_i$，$Y_n=\max_{i}X_i$，则

$$
\{\theta-1\le x_i\le \theta+1,\ \forall i\}
\iff
\{Y_n-1\le \theta\le Y_1+1\},
$$

从而

$$
f_\theta(x_1,\dots,x_n)=2^{-n}\mathbf{1}\{Y_n-1\le \theta\le Y_1+1\}.
$$

由因子分解定理，$T=(Y_1,Y_n)$ 为充分统计量。

再用似然比判别准则：对样本点 $x,x'$，

$$
\frac{f_\theta(x)}{f_\theta(x')}
=
\frac{\mathbf{1}\{Y_n(x)-1\le \theta\le Y_1(x)+1\}}
{\mathbf{1}\{Y_n(x')-1\le \theta\le Y_1(x')+1\}}.
$$

该比值与 $\theta$ 无关当且仅当

$$
Y_1(x)=Y_1(x'),\qquad Y_n(x)=Y_n(x'),
$$

故 $T=(Y_1,Y_n)$ 为最小充分统计量。

**证毕。**
