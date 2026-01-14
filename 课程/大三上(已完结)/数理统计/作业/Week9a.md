# 第十五讲

## 郑博引23339147

> [!NOTE]
>
> #### 期中考信息：
>
> 置信区间：
>
> 1. **枢轴量**
> 2. 给定置信区间的边界和概念
> 3. 推导出置信区间
> 4. 代入量
> 5. 得到区间
>
> 假设检验：
>
> 1. 检验的假设
> 2. **给出检验统计量**
> 3. 推导出$H_0$和拒绝域
> 4. 代入
> 5. 判断
>
> 极大似然估计：
>
> * 注意可以直接有最值的唯一性得到导数为0的唯一解就是我们的目标解。
>
> 第6章第二节有一道大题（第二题，也就是第一题解答题）分为两小题 是考研题 其他都是4-5内容的作业内容。
>
> 第一题为填空题，四小题。
>
> 剩下3-8为解答题，都为4-5内容。

> #### 1.
>
> 1. 设$\theta_0$是真参数。在
>    * ($R0$): $pdf$是确定的，即$\theta \neq \theta' \to f(x_i;\theta) \neq f(x_i;\theta')$
>    * ($R1$): 对于所有$\theta$, $pdf$具有共同支集
>
> 
>这两个条件下，求证:
>$$
> \lim_{n \to \infty} P_{\theta_0} [L(\theta_0,X)>L(\theta,X)]=1, \text{对于所有} \theta \neq \theta_0.
> $$

> [!NOTE]
>
> 真参数：真实分布相应的参数。
>
> 对于所有$\theta$, $pdf$具有共同支集：概率密度函数的定义域（或者说非零值的区域）对于所有可能的参数$\theta$都是相同的。
>
> 无共同支集情况：考虑一个在区间 $[0, \theta]$ 上均匀分布的随机变量。

**解：**

事实上我们有如下正则条件：

> [!NOTE]
>
> 假设6.1.1(正则条件)
> ($R0$): $pdf$是确定的，即$\theta \neq \theta' \Rightarrow f(x_i; \theta) \neq f(x_i; \theta')$。
> ($R1$): 对于所有$\theta$， $pdf$具有共同支集。
> ($R2$): 点$\theta_0$是$\Omega$的内点。

非常自然对于一步是我们对于概率选取对数来求证，我们将$L(\theta_0,X)>L(\theta,X)$等价于

$$
\frac{1}{n} \sum_{i=1}^{n} \log \left[\frac{f(X_i; \theta)}{f(X_i; \theta_0)}\right] < 0
$$

由于被加数都是$iid$的、具有有限期望，且函数$\phi(x)=-\log(x)$为严格凸的，由大数定律和詹生不等式可得，当 $\theta_0$ 是真参数时，

$$
\frac{1}{n}\sum_{i=1}^{n}\log\left[\frac{f(X_i;\theta)}{f(X_i;\theta_0)}\right]\xrightarrow{P}E_{\theta_0}\left[\log\frac{f(X_1;\theta)}{f(X_1;\theta_0)}\right]<\log E_{\theta_0}\left[\frac{f(X_1;\theta)}{f(X_1;\theta_0)}\right]
$$

> [!NOTE]
>
> 詹森不等式：
>
> 如果 $\phi$ 是一个凸函数，并且 $X$ 是一个随机变量，那么：
>
> $$
> E[\phi(X)] \ge \phi(E[X])
> $$

而

$$
E_{\theta_0}\left[\frac{f(X_1;\theta)}{f(X_1;\theta_0)}\right]=\int\frac{f(x;\theta)}{f(x;\theta_0)}f(x;\theta_0)dx=1
$$

因为$\log 1=0$，所以定理得证。注意，为了获得最后的等式而需要$pdf$共同支集。

(这里依概率收敛到一个数)

**证毕。**

---

> #### 2.
>
> 2. 设$X_1, X_2, \dots, X_n$是$iid$的，具有密度
>
> $$
> f(x_i; \theta) = \frac{\exp\{-(x-\theta)\}}{[1+\exp\{-(x-\theta)\}]^2}, -\infty < x < +\infty, -\infty < \theta < +\infty.
> $$
>
> 求$\theta$的极大似然估计量。
>
> > [!IMPORTANT]
> >
> > 不考。

**解：**

$$
f(x;\theta) = \frac{\exp\{-(x-\theta)\}}{(1+\exp\{-(x-\theta)\})^2}, \quad -\infty < x < \infty, -\infty < \theta < \infty
\label{eq:6.1.8}
$$

似然对数可简化成

$$
l(\theta) = \sum_{i=1}^{n} \log f(x_i;\theta) = n\theta - n\bar{x} - 2\sum_{i=1}^{n} \log(1+\exp\{-(x_i-\theta)\})
$$

上式的一阶偏导数是

$$
l'(\theta) = n-2\sum_{i=1}^{n} \frac{\exp\{-(x_i-\theta)\}}{1+\exp\{-(x_i-\theta)\}}
\label{eq:6.1.9}
$$

令此式等于$0$，并重新整理方程中各项，得到

$$
\sum_{i=1}^{n} \frac{\exp\{-(x_i-\theta)\}}{1+\exp\{-(x_i-\theta)\}} = \frac{n}{2}
\label{eq:6.1.10}
$$

尽管这个式子不能进行简化了，不过可以证明，式$\ref{eq:6.1.10}$具有唯一解。式$\ref{eq:6.1.10}$左边的导数简化成

$$
(\partial/\partial\theta)\sum_{i=1}^{n} \frac{\exp\{-(x_i-\theta)\}}{1+\exp\{-(x_i-\theta)\}} = \sum_{i=1}^{n} \frac{\exp\{-(x_i-\theta)\}}{(1+\exp\{-(x_i-\theta)\})^2} > 0
$$

因而，式$\ref{eq:6.1.10}$的左边是$\theta$的严格递增函数。最后，当$\theta \to -\infty$时，式$\ref{eq:6.1.10}$左边趋于$0$，而当$\theta \to \infty$时，它趋于$n$。因此，式$\ref{eq:6.1.10}$具有唯一解。而且，$l(\theta)$的二阶导数对于所有$\theta$来说均是严格负的，因此，此解是极大解。

**证毕。**

---

> #### 3.
>
> 3. 设总体$X$是伯努利分布$b(1, \theta)$，$X_1, X_2, \dots, X_n$是来自$X$的随机样本，$X$具有密度，其中$0 \le \theta \le 1/3$。
>
> (1) 求成功概率$\theta$的极大似然估计量。
>
> (2) 当$0 < \theta < 1$时，求$\sqrt{\theta(1-\theta)}$的极大似然估计量。

**解：**

（1）

$x_i$有$pmf$

$$
p(x) =
\begin{cases}
\theta^x (1-\theta)^{1-x}, & x = 0,1 \\
0, & \text{其他}
\end{cases}
$$

其中$0 \le \theta \le 1$，我们已经讨论了成功概率$\theta$的极大似然估计量。前面提及，该极大似然估计量是$\bar{X}$，即样本成功比例。现在，假定我们预先知道$\theta$由不等式$0 \le \theta \le 1/3$所限定，而不是由$0 \le \theta \le 1$所限定，如果出现观测值使得$\bar{x} > 1/3$，那么$\bar{x}$就不是满意的估计值。由于

$$
\frac{\partial l(\theta)}{\partial \theta} > 0
$$

倘若$\theta < \bar{x}$，在$0 \le \theta \le 1/3$限制条件下，可通过取$\hat{\theta} = \min\{\bar{x}, 1/3\}$使$l(\theta)$极大化。

(2)

此时我们有定理：

> [!NOTE]
>
> #### 定理$6.1.2$
>
> 设$X_1, \dots, X_n$是$iid$的，具有$pdf$ $f(x; \theta)$, $\theta \in \Omega$。对特定函数$g$，设$\eta=g(\theta)$是关注的参数。假定$\hat{\theta}$是$\theta$的极大似然估计量($mle$)，那么$g(\hat{\theta})$是$\eta=g(\theta)$的极大似然估计量。

则我们有$\hat{\theta}=\bar{X}$是$\theta$的极大似然估计量,则知$\sqrt{\theta(1-\theta)}$的极大似然估计量是$\sqrt{\hat{\theta}(1-\hat{\theta})}$。

**证毕。**

> #### 4.
>
> 4. (拉普拉斯分布)设$X_1, X_2, \dots, X_n$是$iid$的，具有密度
>
> $$
> f(x; \theta)=2^{-1}e^{-|x-\theta|}, \quad -\infty<x<+\infty, \quad -\infty<\theta<+\infty.
> $$
>
> 求$\theta$的极大似然估计量。

**解：**

其似然对数可简化成

$$
l(\theta) = -n\log 2 - \sum_{i=1}^{n} |x_i - \theta|
$$

其一阶偏导数是

$$
l'(\theta) = \sum_{i=1}^{n} \text{sgn}(x_i - \theta)
\label{eq:6.1.7}
$$

其中$\text{sgn}(t)=1, 0$或者$-1$，这依赖于$t>0, t=0$或者$t<0$。注意，除非$t=0$，否则我们习惯使用$\frac{d}{dt}|t|=\text{sgn}(t)$，令式($\ref{eq:6.1.7}$)等于$0$，得到的解是$\text{med}\{x_1, x_2, \dots, x_n\}$，因为中位数取表达式($\ref{eq:6.1.7}$)中一半非正项与一半非负项之和。前面提及，用$Q_2$表示样本中位数(即样本第二个四分位数)。因此，$\hat{\theta}=Q_2$是拉普拉斯$pdf$中$\theta$的极大似然估计量。

> [!NOTE]
>
> 其实我们还有更加精确的写法：
>
> **$n$ 为奇数：** 唯一的极大似然估计量是样本中位数 $x_{((n+1)/2)}$。
>
> **$n$ 为偶数：** 任何在排序后的第 $n/2$ 个观测值 $x_{(n/2)}$ 和第 $n/2+1$ 个观测值 $x_{(n/2+1)}$ 之间的值（包括这两个端点）都是极大似然估计量。也就是说，使得导数为0的点是一个区间 $[x_{(n/2)}, x_{(n/2+1)}]$。

> #### 5.
>
> 5. 假定$X_1, X_2, \dots, X_n$满足正则条件：
> ($R0$): $pdf$是确定的，即$\theta \neq \theta' \rightarrow f(x; \theta) \neq f(x; \theta')$.
> ($R1$): 对于所有$\theta$, $pdf$具有共同支集.
> ($R2$): 点$\theta_0$是$\Omega$的内点.
> 其中$\theta_0$表示真参数，同时$f(x; \theta)$关于$\Omega$中的$\theta$是可微的.
> 于是，似然方程
>
> $$
> \frac{\partial}{\partial \theta} L(\theta) = \frac{\partial}{\partial \theta} \left(\prod_{i=1}^{n} f(x_i; \theta)\right) = 0
> $$
>
> 或者等价地
>
> $$
> \frac{\partial}{\partial \theta} l(\theta) = \frac{\partial}{\partial \theta} (\log L(\theta)) = 0
> $$
>
> 具有解$\hat{\theta}_n$, 使得$\hat{\theta}_n \rightarrow \theta_0$.

> [!NOTE]
>
> 证明没讲。

**解：**

由于$\theta_0$是$\Omega$的内点，所以对于某个$a>0$，$(\theta_0-a, \theta_0+a) \subset \Omega$。把$S_n$定义成为事件

$$
S_n = \{\mathbf{X}: l(\theta_0; \mathbf{X}) > l(\theta_0-a; \mathbf{X})\} \cap \{\mathbf{X}: l(\theta_0; \mathbf{X}) > l(\theta_0+a; \mathbf{X})\}
$$

由题一知，$P(S_n) \to 1$。因而，把注意力限制在事件$S_n$上。不过，在$S_n$上$l(\theta)$具有局部极大值，不妨设$\hat{\theta}_n$使得$\theta_0-a < \hat{\theta}_n < \theta_0+a$，同时$l'(\hat{\theta}_n)=0$。也就是说

$$
S_n \subset \{\mathbf{X}: |\hat{\theta}_n(\mathbf{X}) - \theta_0| < a\} \cap \{\mathbf{X}: l'(\hat{\theta}_n(\mathbf{X})) = 0\}
$$

因此，

$$
1 = \lim_{n \to \infty} P(S_n) \le \lim_{n \to \infty} P[\{\mathbf{X}: |\hat{\theta}_n(\mathbf{X}) - \theta_0| < a\} \cap \{\mathbf{X}: l'(\hat{\theta}_n(\mathbf{X})) = 0\}] \le 1
$$

参看注释$5.2.3$对于$\overline{\lim}$的讨论。由此可得，对于解序列$\hat{\theta}_n$来说，$P[|\hat{\theta}_n - \theta_0| < a] \to 1$。

**证毕。**

> [!NOTE]
>
> 期末考试：
>
> 不考原题，毁了。
>
> 说她没讲的作业题就不考。
