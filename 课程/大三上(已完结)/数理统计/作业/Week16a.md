# 第二十九讲

## 23339147

> [!NOTE]
>
> 多道题涉及似然函数。
>
> 证明独立：
>
> 用定义证明不是充分统计量$y_1,y_n$。
>
> 用定义证明正则指数组


#### 题目 (作业$1$ 第$1$题):
>
>设随机变量 $X$ 的概率密度函数为
>
>$$
>f(x;\theta)=
>\begin{cases}
>\dfrac{1}{\theta}e^{-x/\theta},& 0<x<+\infty;\\[4pt]
>0,& \text{其他}.
>\end{cases}
>$$
>
>设 $X_1,X_2$ 为来自该分布的容量为 $2$ 的随机样本。检验简单假设 $H_0:\theta=2$ 与备择假设 $H_1:\theta>2$。
>
>（$1$）在显著性水平 $\alpha=0.05$ 下，求检验统计量 $T$ 与最优临界域 $C$；
>
>（$2$）求 $\theta\ge 2$ 时的功效函数 $\gamma(\theta)$，并计算 $\gamma(2),\gamma(4),\gamma(9.5)$。

**解：**

令 $S=X_1+X_2$。样本联合密度为

$$
L(\theta;x_1,x_2)=\frac{1}{\theta^2}\exp\!\left(-\frac{x_1+x_2}{\theta}\right)\mathbf{1}_{\{x_1>0,x_2>0\}}
=\frac{1}{\theta^2}\exp\!\left(-\frac{S}{\theta}\right)\mathbf{1}_{\{x_1>0,x_2>0\}}.
$$

对任意固定的 $\theta_1>2$，似然比为

$$
\frac{L(\theta_1;x_1,x_2)}{L(2;x_1,x_2)}
=\left(\frac{2}{\theta_1}\right)^2\exp\!\left[S\left(\frac{1}{2}-\frac{1}{\theta_1}\right)\right].
$$

由于 $\theta_1>2\Rightarrow \dfrac{1}{2}-\dfrac{1}{\theta_1}>0$，上式随 $S$ 单调递增，因此由奈曼–皮尔逊思想（并结合单调似然比性质），水平为 $\alpha$ 的最优（并且对 $\theta>2$ 为一致最优）检验可取为“大 $S$ 拒绝”。

（$1$）取检验统计量

$$
T=S=X_1+X_2,
$$

临界域为

$$
C=\{S\ge c\},
$$

其中 $c$ 由 $P_{\theta=2}(S\ge c)=\alpha$ 确定。

> [!NOTE]
>
> **卡方分布** $\chi^2(k)$ 实际上是形状参数为 $k/2$、尺度参数为 $2$ 的伽马分布，即：
>
>$$
>\chi^2(k) \equiv \Gamma\left(\frac{k}{2}, 2\right)
> $$

在 $H_0:\theta=2$ 下，$S\sim \Gamma(2,\text{尺度 }2)$，等价地 $S\sim \chi^2_{4}$，故

$$
c=\chi^2_{4,\,1-\alpha}=\chi^2_{4,\,0.95}\approx 9.488.
$$

知最优临界域为

$$
C=\{S\ge 9.488\},
$$

（$2$）对一般 $\theta>0$，$S\sim \Gamma(2,\text{尺度 }\theta)$，因此

$$
\gamma(\theta)=P_\theta(S\ge c)
=\int_{c}^{+\infty}\frac{1}{\theta^2}s\,e^{-s/\theta}\,ds
=e^{-c/\theta}\left(1+\frac{c}{\theta}\right),\qquad \theta\ge 2.
$$

从而

$$
\gamma(2)=0.05,\qquad
\gamma(4)=e^{-c/4}\left(1+\frac{c}{4}\right)\approx 0.315,\qquad
\gamma(9.5)=e^{-c/9.5}\left(1+\frac{c}{9.5}\right)\approx 0.736,
$$

其中 $c\approx 9.488$。

**证毕。**

---

#### 题目 (作业$1$ 第$2$题):
>
> 设 $X_1,X_2,\dots,X_n$ 为来自正态分布 $N(\theta,1)$ 的随机样本，$\theta$ 未知。证明：对简单假设 $H_0:\theta=\theta_0$（$\theta_0$ 为常数）与备择复合假设 $H_1:\theta\ne\theta_0$，不存在一致最大功效检验。

> [!NOTE]
>
> 写出似然比，判断出估计（依据为奈曼–皮尔逊引理，拒绝域方向使得似然比增大），对于此估计量判断分布，代入显著性水平求得具体拒绝域。

**解：**

> [!IMPORTANT]
>
> 必考。

> [!NOTE]
>
> 还会将以上$H_1$修改为$\theta\ge0$来来求解最大一致功效临界域。

用反证法。设在显著性水平 $\alpha\in(0,1)$ 下存在一致最大功效检验 $\varphi(x_1,\dots,x_n)$，即对任意水平为 $\alpha$ 的检验 $\psi$ 与任意 $\theta\ne\theta_0$，有

$$
E_\theta[\varphi]\ge E_\theta[\psi].
$$

取任意 $\theta_1>\theta_0$。对简单备择 $H_1:\theta=\theta_1$，由奈曼–皮尔逊引理，水平为 $\alpha$ 的最强检验必为右尾检验。具体地，

$$
\frac{L(\theta_1;x)}{L(\theta_0;x)}
=\exp\!\left((\theta_1-\theta_0)\sum_{i=1}^{n}x_i-\frac{n}{2}(\theta_1^2-\theta_0^2)\right),
$$

其随 $\sum_{i=1}^{n}x_i$（等价地随 $\bar X$）严格递增，因此最强临界域形如

$$
C_1=\left\{\sum_{i=1}^{n}X_i\ge k_1\right\}
\quad\Big(\text{或 }\{\bar X\ge c_1\}\Big),
\qquad P_{\theta_0}(C_1)=\alpha.
$$

由于 $\varphi$ 对所有 $\theta\ne\theta_0$ 都应最强，特别地对 $\theta=\theta_1$ 也应达到上述最强功效，从而 $\varphi$ 必须（在 $P_{\theta_0}$ 意义下）等价于该右尾检验。

再取任意 $\theta_2<\theta_0$。同理，对简单备择 $H_1:\theta=\theta_2$，似然比随 $\sum_{i=1}^{n}x_i$ 严格递减，因此水平为 $\alpha$ 的最强检验必为左尾检验，临界域形如

$$
C_2=\left\{\sum_{i=1}^{n}X_i\le k_2\right\}
\quad\Big(\text{或 }\{\bar X\le c_2\}\Big),
\qquad P_{\theta_0}(C_2)=\alpha.
$$

同理，$\varphi$ 也必须（在 $P_{\theta_0}$ 意义下）等价于该左尾检验。

但在连续情形下，满足 $P_{\theta_0}(C)=\alpha$ 的右尾集合 $C_1$ 不可能与满足 $P_{\theta_0}(C)=\alpha$ 的左尾集合 $C_2$ 在 $P_{\theta_0}$ 意义下相同（除非 $\alpha\in\{0,1\}$，与 $\alpha\in(0,1)$ 矛盾）。故假设不成立。

因此，检验 $H_0:\theta=\theta_0$ 对 $H_1:\theta\ne\theta_0$ 不存在一致最大功效检验。

**证毕。**

---

#### 题目 (作业$2$ 第$3$题):
>
> 设 $X_1,X_2,\dots,X_n$ 为来自参数 $p=\theta$ 的伯努利分布 $b(1,\theta)$ 的随机样本，$0<\theta<1$。证明：在显著性水平 $\alpha$ 下，检验
>
> $$
> H_0:\theta\le \theta_0 \quad\text{对}\quad H_1:\theta>\theta_0
> $$
>
> 的一致最大功效检验为：令 $Y=\sum_{i=1}^{n}X_i$，当 $Y\ge c$ 时拒绝 $H_0$，其中 $c$ 由题设条件（例如 $\alpha=P_{\theta_0}(Y>c)$ 或等价地用 $P_{\theta_0}(Y\ge c)$ 控制水平）确定。

**解：**

样本联合分布为

$$
L(\theta;x_1,\dots,x_n)=\prod_{i=1}^{n}\theta^{x_i}(1-\theta)^{1-x_i}
=\theta^{\sum_{i=1}^{n}x_i}(1-\theta)^{n-\sum_{i=1}^{n}x_i}.
$$

令

$$
Y=\sum_{i=1}^{n}X_i,
$$

则 $L(\theta;x)=\theta^{Y}(1-\theta)^{n-Y}$，故似然仅通过 $Y$ 变化。

取任意 $\theta_1>\theta_0$，对简单假设 $H_0:\theta=\theta_0$ 与 $H_1:\theta=\theta_1$，似然比为

$$
\frac{L(\theta_1;x)}{L(\theta_0;x)}
=\left(\frac{\theta_1}{\theta_0}\right)^{Y}
\left(\frac{1-\theta_1}{1-\theta_0}\right)^{n-Y}.
$$

取对数得

$$
\log\frac{L(\theta_1;x)}{L(\theta_0;x)}
=Y\log\!\left(\frac{\theta_1(1-\theta_0)}{\theta_0(1-\theta_1)}\right)+n\log\!\left(\frac{1-\theta_1}{1-\theta_0}\right).
$$

因 $\theta_1>\theta_0\Rightarrow \dfrac{\theta_1(1-\theta_0)}{\theta_0(1-\theta_1)}>1$，故上式随 $Y$ 严格递增。由奈曼–皮尔逊引理，水平为 $\alpha$ 的最强检验临界域必形如

$$
C=\{Y\ge c\}\quad(\text{或等价地用 }\{Y>c\}),
$$

其中 $c$ 由 $P_{\theta_0}(Y\in C)=\alpha$（或使之不超过 $\alpha$）确定。

又因为对固定的 $c$，函数 $P_\theta(Y\ge c)$ 随 $\theta$ 单调递增，所以

$$
\sup_{\theta\le \theta_0}P_\theta(Y\ge c)=P_{\theta_0}(Y\ge c),
$$

从而按上述选取 $c$ 即可保证检验水平为 $\alpha$。并且由于对每个 $\theta_1>\theta_0$ 都是由同一单调似然比结构导出的最强形式，该检验对复合备择 $H_1:\theta>\theta_0$ 为一致最大功效检验。

**证毕。**

---

#### 题目 (作业$2$ 第$4$题):
>
>设 $X_1,X_2,\dots,X_n$ 为来自正态分布 $N(0,\theta)$ 的随机样本，其中方差参数 $\theta>0$ 未知。
>
>（$1$）证明：对 $H_0:\theta=\theta_0$ 与 $H_1:\theta>\theta_0$，存在显著性水平为 $\alpha$ 的一致最大功效检验（$\theta_0>0$ 为常数）；
>
>（$2$）给出该检验的统计量与临界域；
>
>（$3$）对 $H_0:\theta=3$ 与 $H_1:\theta>3$，取 $n=15,\alpha=0.05$，已知自由度为 $15$ 的卡方分布在概率 $0.95$ 处的分位数为 $24.996$，求 $c$ 使
>
>$$
>P_{H_0}\!\left(\sum_{i=1}^{n}X_i^2\ge c\right)=\alpha.
>$$

> [!IMPORTANT]
>
> 必考。

**解：**

（$1$）样本联合密度为

$$
L(\theta;x_1,\dots,x_n)
=(2\pi\theta)^{-n/2}\exp\!\left(-\frac{1}{2\theta}\sum_{i=1}^{n}x_i^2\right).
$$

令

$$
S=\sum_{i=1}^{n}X_i^2.
$$

对任意 $\theta_1>\theta_0$，似然比

$$
\frac{L(\theta_1;x)}{L(\theta_0;x)}
=\left(\frac{\theta_0}{\theta_1}\right)^{n/2}
\exp\!\left[\frac{S}{2}\left(\frac{1}{\theta_0}-\frac{1}{\theta_1}\right)\right].
$$

由于 $\theta_1>\theta_0\Rightarrow \dfrac{1}{\theta_0}-\dfrac{1}{\theta_1}>0$，上式随 $S$ 单调递增。故由奈曼–皮尔逊引理（并利用单调似然比结构）可知存在以“大 $S$ 拒绝”为形式的最强检验；且该形式与 $\theta_1$ 无关，从而对复合备择 $H_1:\theta>\theta_0$ 得到一致最大功效检验。

（$2$）取检验统计量

$$
T=S=\sum_{i=1}^{n}X_i^2.
$$

在 $H_0:\theta=\theta_0$ 下，

$$
\frac{S}{\theta_0}\sim \chi^2_{n}.
$$

故显著性水平为 $\alpha$ 的临界域可取

$$
C=\left\{S\ge c\right\},
\qquad
c=\theta_0\,\chi^2_{n,\,1-\alpha}.
$$

（$3$）此时 $\theta_0=3$，$n=15$，$1-\alpha=0.95$，给定 $\chi^2_{15,\,0.95}=24.996$，因此

$$
c=\theta_0\,\chi^2_{15,\,0.95}=3\times 24.996=74.988.
$$

**证毕。**

---

#### 题目 (作业$3$ 第$5$题):
>
>设 $X_1,X_2,\dots,X_{10}$ 为来自均值参数为 $\theta$ 的泊松分布 $P(\theta)$ 的容量为 $10$ 的随机样本。
>
>（$1$）证明：由 $\sum_{i=1}^{10}x_i\ge 3$ 所定义的临界域 $C$ 是检验 $H_0:\theta=0.1$ 与 $H_1:\theta=0.5$ 的最优临界域；并求该检验的显著性水平 $\alpha$ 及在 $\theta=0.5$ 处的功效；
>
>（$2$）证明：（$1$）中的临界域 $C$ 也是检验 $H_0:\theta=0.1$ 与 $H_1:\theta>0.5$ 的一致最大功效临界域。

**解：**

令

$$
Y=\sum_{i=1}^{10}X_i.
$$

样本联合概率为

$$
L(\theta;x_1,\dots,x_{10})
=\prod_{i=1}^{10}\frac{e^{-\theta}\theta^{x_i}}{x_i!}
=\frac{e^{-10\theta}\theta^{Y}}{\prod_{i=1}^{10}x_i!}.
$$

（$1$）对 $\theta_0=0.1$ 与 $\theta_1=0.5$，似然比

$$
\frac{L(\theta_1;x)}{L(\theta_0;x)}
=\exp\!\big(-10(\theta_1-\theta_0)\big)\left(\frac{\theta_1}{\theta_0}\right)^{Y}
=e^{-4}\cdot 5^{Y},
$$

其随 $Y$ 严格递增。由奈曼–皮尔逊引理，最优（最强）检验应当在 $Y$ 取较大值时拒绝 $H_0$，即临界域形如 $\{Y\ge c\}$。题设给出 $C=\{Y\ge 3\}$，确为上述形式，因此是该检验的最优临界域。

又因泊松可加性，在 $H_0:\theta=0.1$ 下有

$$
Y\sim P(10\theta_0)=P(1),
$$

故显著性水平

$$
\alpha=P_{\theta=0.1}(Y\ge 3)
=1-\sum_{y=0}^{2}e^{-1}\frac{1^{y}}{y!}
=1-e^{-1}\left(1+1+\frac{1}{2}\right)
=1-\frac{5}{2}e^{-1}
\approx 0.0803.
$$

在 $\theta=0.5$ 下，

$$
Y\sim P(10\theta_1)=P(5),
$$

故功效

$$
\gamma(0.5)=P_{\theta=0.5}(Y\ge 3)
=1-\sum_{y=0}^{2}e^{-5}\frac{5^{y}}{y!}
=1-e^{-5}\left(1+5+\frac{25}{2}\right)
=1-\frac{37}{2}e^{-5}
\approx 0.8753.
$$

（$2$）对任意 $\theta>\theta_0$，似然比

$$
\frac{L(\theta;x)}{L(\theta_0;x)}
=\exp\!\big(-10(\theta-\theta_0)\big)\left(\frac{\theta}{\theta_0}\right)^{Y}
$$

随 $Y$ 单调递增，故该族对统计量 $Y$ 具有单调似然比性质。于是对备择复合假设 $H_1:\theta>0.5$（当然也包含所有 $\theta>0.1$ 的情形），在固定显著性水平 $\alpha$ 下，拒绝域仍应为 $\{Y\ge c\}$ 形式，且阈值 $c$ 仅由水平条件 $P_{\theta=0.1}(Y\ge c)=\alpha$ 决定，与具体 $\theta>0.5$ 的取值无关。

因此，以 $C=\{Y\ge 3\}$（其水平为（$1$）所求的 $\alpha$）为拒绝域的检验，对所有 $\theta>0.5$ 都同时达到最大功效，即为一致最大功效检验。

**证毕。**
