# 第二十八讲

## 233339147郑博引

#### 题目 (题$1$):
>
>考察服从二项分布 $b(n,p)$ 的随机变量 $X$，其中 $n=5$，$p=\theta$。记 $f(x;\theta)$ 为 $X$ 的概率质量函数。现用观测到的 $X$ 来检验简单假设 $H_0:\theta=\frac12$ 与备择简单假设 $H_1:\theta=\frac34$。
>
>（$1$）当显著性水平分别为 $\alpha=\frac{1}{32}$ 与 $\alpha=\frac{6}{32}$ 时，求最优临界域 $C$。
>
>（$2$）求水平为 $\alpha=\frac{6}{32}$ 的检验功效。

**解：**

在 $H_0$ 与 $H_1$ 下，

$$
f(x;\theta)=\binom{5}{x}\theta^{x}(1-\theta)^{5-x},\quad x=0,1,2,3,4,5.
$$

令 $f_0(x)=f\!\left(x;\frac12\right)$，$f_1(x)=f\!\left(x;\frac34\right)$，则 似然比

$$
\Lambda(x)=\frac{f_0(x)}{f_1(x)}
=\frac{\binom{5}{x}\left(\frac12\right)^{5}}{\binom{5}{x}\left(\frac34\right)^{x}\left(\frac14\right)^{5-x}}
=\frac{32}{3^{x}}.
$$

显然 $\Lambda(x)$ 随 $x$ 单调递减，因此由尼曼–皮尔逊引理，最优检验应取“$x$ 越大越拒绝 $H_0$”。

（$1$）

- 当 $\alpha=\frac{1}{32}$ 时，在 $H_0$ 下

  $$
  P_{H_0}(X=5)=\frac{1}{32}=\alpha,
  $$

  **确定临界值 $c$ 的方法**：选择最小的 $c$，使得

  $$
  P_{H_0}(X \in C) = P_{H_0}(X \geq c) \leq \alpha
  $$

  故可取最优临界域

  $$
  C=\{5\}.
  $$

- 当 $\alpha=\frac{6}{32}$ 时，在 $H_0$ 下

  $$
  P_{H_0}(X\in\{4,5\})=\frac{5}{32}+\frac{1}{32}=\frac{6}{32}=\alpha,
  $$

  故可取最优临界域

  $$
  C=\{4,5\}.
  $$

（$2$）当 $\alpha=\frac{6}{32}$ 时，检验功效（在 $H_1$ 下拒绝概率）为

$$
\beta=P_{H_1}(X\in C)
=P_{H_1}(X=4)+P_{H_1}(X=5)
=\frac{405}{1024}+\frac{243}{1024}
=\frac{648}{1024}
=\frac{81}{128}.
$$

**证毕。**

> [!NOTE]
>
> 我们的一个计算步骤为：
>
> **第一步：确定拒绝方向**
>
> 通过似然比 $\Lambda(x) = \frac{f_0(x)}{f_1(x)}$ 的单调性确定：
>
> - $\Lambda(x)$ 递减 → **$x$ 越大越拒绝 $H_0$** → 临界域形如 $C = \{x \geq c\}$
> - $\Lambda(x)$ 递增 → **$x$ 越小越拒绝 $H_0$** → 临界域形如 $C = \{x \leq c\}$
>
> **第二步：确定临界值 $c$**
>
> 选择 $c$ 使得在 $H_0$ 下：
>
> $$
> P_{H_0}(X \in C) \leq \alpha
> $$
>
> 且尽量接近 $\alpha$（充分利用显著性水平）。
>
> **第三步：求解检验功效**
>
> 检验功效为：
>
> $$
> P_{H_1}(X\in C)
> $$
>
> 如果在$H_1$有多个值时，我们是一个函数的形式。

---

#### 题目 (题$2$):
>
>设 $X_1,X_2,\ldots,X_n$ 为来自分布族 $f(x;\theta)$ 的随机样本（$f$ 可为概率密度函数或概率质量函数），其中 $n$ 为固定正整数。样本点 $x=(x_1,x_2,\ldots,x_n)$ 的似然函数为 $L(\theta;x)=\prod_{i=1}^{n}f(x_i;\theta)$。取两点参数值 $\theta',\theta''$（$\theta'\ne\theta''$），并设常数 $k>0$。若存在样本空间子集 $C$ 使得
> （$a$）对任意 $x\in C$，$\dfrac{L(\theta';x)}{L(\theta'';x)}\le k$；
> （$b$）对任意 $x\in C^{c}$，$\dfrac{L(\theta';x)}{L(\theta'';x)}\ge k$；
> （$c$）$\alpha=P_{\theta'}(X\in C)$。
> 证明：$C$ 是检验 $H_0:\theta=\theta'$ 与 $H_1:\theta=\theta''$ 的水平为 $\alpha$ 的最优临界域。

**解：**

取任意另一临界域 $D$，满足其检验水平不超过 $\alpha$，即

$$
P_{\theta'}(X\in D)\le \alpha=P_{\theta'}(X\in C).
$$

记在参数为 $\theta$ 时，样本落入集合 $A$ 的概率为

$$
P_{\theta}(X\in A)=\int_{A}L(\theta;x)\,\mathrm{d}x
$$

（离散情形时将积分理解为求和）。

考虑功效差

$$
\Delta
=P_{\theta''}(X\in C)-P_{\theta''}(X\in D)
=\int_{C\setminus D}L(\theta'';x)\,\mathrm{d}x-\int_{D\setminus C}L(\theta'';x)\,\mathrm{d}x.
$$

由条件（$a$），对 $x\in C$ 有 $L(\theta'';x)\ge \frac{1}{k}L(\theta';x)$；由条件（$b$），对 $x\in C^{c}$ 有 $L(\theta'';x)\le \frac{1}{k}L(\theta';x)$。于是

$$
\int_{C\setminus D}L(\theta'';x)\,\mathrm{d}x
\ge \frac{1}{k}\int_{C\setminus D}L(\theta';x)\,\mathrm{d}x,
\qquad
\int_{D\setminus C}L(\theta'';x)\,\mathrm{d}x
\le \frac{1}{k}\int_{D\setminus C}L(\theta';x)\,\mathrm{d}x.
$$

从而

$$
\Delta
\ge \frac{1}{k}\left(\int_{C\setminus D}L(\theta';x)\,\mathrm{d}x-\int_{D\setminus C}L(\theta';x)\,\mathrm{d}x\right)
=\frac{1}{k}\Big(P_{\theta'}(X\in C)-P_{\theta'}(X\in D)\Big)
\ge 0.
$$

即对任意满足水平不超过 $\alpha$ 的 $D$，都有

$$
P_{\theta''}(X\in D)\le P_{\theta''}(X\in C),
$$

因此 $C$ 为水平 $\alpha$ 的最优临界域。

**证毕。**

---

#### 题目 (题$3$):
>
> 设 $X_1,X_2,\ldots,X_n$ 为来自正态分布 $N(\theta,1)$ 的随机样本。
>
> （$1$）对简单假设 $H_0:\theta=0$ 与备择简单假设 $H_1:\theta=1$ 构造最优检验，并写出其检验功效（在 $H_1$ 下的拒绝概率）。
>
> （$2$）若 $n=25$，并规定在 $H_0$ 成立时拒绝 $H_0$ 的概率为 $\alpha=0.05$，求此时检验功效。

**解：**

（$1$）样本点 $x=(x_1,\ldots,x_n)$ 的似然函数为

$$
L(\theta;x)=(2\pi)^{-\frac{n}{2}}\exp\!\left(-\frac12\sum_{i=1}^{n}(x_i-\theta)^2\right).
$$

故似然比

$$
\Lambda(x)=\frac{L(0;x)}{L(1;x)}
=\exp\!\left\{-\frac12\sum_{i=1}^{n}x_i^2+\frac12\sum_{i=1}^{n}(x_i-1)^2\right\}
=\exp\!\left(-\sum_{i=1}^{n}x_i+\frac{n}{2}\right).
$$

$\Lambda(x)$ 随 $\sum_{i=1}^{n}x_i$ 单调递减，因此最优检验拒绝域可取

$$
C=\left\{x:\sum_{i=1}^{n}x_i\ge c\right\}
=\left\{x:\bar{x}\ge \frac{c}{n}\right\},
\quad \bar{x}=\frac{1}{n}\sum_{i=1}^{n}x_i.
$$

令 $z_{1-\alpha}=\Phi^{-1}(1-\alpha)$，其中 $\Phi$ 为标准正态分布函数。由

$$
\sum_{i=1}^{n}X_i\mid H_0 \sim N(0,n),
$$

取

$$
c=\sqrt{n}\,z_{1-\alpha},
$$

则 $P_{H_0}(X\in C)=\alpha$。

检验功效（在 $H_1$ 下）为

$$
\beta
=P_{H_1}\!\left(\sum_{i=1}^{n}X_i\ge \sqrt{n}\,z_{1-\alpha}\right).
$$

而

$$
\sum_{i=1}^{n}X_i\mid H_1 \sim N(n,n),
$$

所以

$$
\beta
=1-\Phi\!\left(\frac{\sqrt{n}\,z_{1-\alpha}-n}{\sqrt{n}}\right)
=1-\Phi\!\left(z_{1-\alpha}-\sqrt{n}\right)
=\Phi\!\left(\sqrt{n}-z_{1-\alpha}\right).
$$

（$2$）当 $n=25$，$\alpha=0.05$ 时，$z_{1-\alpha}=z_{0.95}\approx 1.64485$，于是

$$
\beta=\Phi\!\left(5-1.64485\right)=\Phi(3.35515)\approx 0.9996.
$$

**证毕。**

---

#### 题目 (题$4$):
>
>设 $X_1,X_2,\ldots,X_n$ 为来自某离散分布的随机样本，其概率质量函数 $f(x)$ 仅在非负整数 $x=0,1,2,\ldots$ 上取正值。考虑简单检验：
> $H_0:f(x)=\dfrac{e^{-1}}{x!}$（$x=0,1,2,\ldots$，其余处为 $0$）；
> $H_1:f(x)=\left(\dfrac12\right)^{x+1}$（$x=0,1,2,\ldots$，其余处为 $0$）。
>
>（$1$）求最优临界域 $C$ 的一般形式。
>
>（$2$）当 $k=1$ 且 $n=1$ 时，求最优临界域 $C$、检验水平 $\alpha$，以及在 $H_1$ 成立时的最佳检验功效。

**解：**

（$1$）在 $H_0$ 与 $H_1$ 下的联合似然分别为

$$
L_0(x)=\prod_{i=1}^{n}\frac{e^{-1}}{x_i!}=\frac{e^{-n}}{\prod_{i=1}^{n}x_i!},
\qquad
L_1(x)=\prod_{i=1}^{n}\left(\frac12\right)^{x_i+1}
=2^{-\left(\sum_{i=1}^{n}x_i+n\right)}.
$$

因此似然比

$$
\Lambda(x)=\frac{L_0(x)}{L_1(x)}
=e^{-n}2^{\sum_{i=1}^{n}x_i+n}\Big/\prod_{i=1}^{n}x_i!.
$$

由尼曼–皮尔逊引理，水平为 $\alpha$ 的最优临界域可写为

$$
C=\{x:\Lambda(x)\le k\}
=\left\{x:\frac{e^{-n}2^{\sum_{i=1}^{n}x_i+n}}{\prod_{i=1}^{n}x_i!}\le k\right\},
$$

其中阈值 $k$ 由水平条件 $P_{H_0}(X\in C)=\alpha$（必要时在边界处作随机化）确定。

（$2$）当 $n=1$ 且 $k=1$ 时，

$$
\Lambda(x)=\frac{e^{-1}2^{x+1}}{x!}\le 1.
$$

直接比较：

$$
\Lambda(0)=\frac{2}{e}<1,\qquad
\Lambda(1)=\frac{4}{e}>1,\qquad
\Lambda(2)=\frac{4}{e}>1,\qquad
\Lambda(3)=\frac{8}{3e}<1.
$$

并且对 $x\ge 2$，

$$
\frac{\Lambda(x+1)}{\Lambda(x)}=\frac{2}{x+1}<1,
$$

故当 $x\ge 3$ 时恒有 $\Lambda(x)\le 1$。于是

$$
C=\{0\}\cup\{3,4,5,\ldots\}.
$$

检验水平

$$
\alpha=P_{H_0}(X\in C)
=P_{H_0}(X=0)+P_{H_0}(X\ge 3).
$$

在 $H_0$ 下 $X\sim \mathrm{Poisson}(1)$，故

$$
P_{H_0}(X=0)=e^{-1},\quad
P_{H_0}(X\ge 3)=1-\left(e^{-1}+e^{-1}+\frac{e^{-1}}{2}\right)=1-\frac{5}{2}e^{-1},
$$

从而

$$
\alpha=1-\frac{3}{2}e^{-1}.
$$

在 $H_1$ 下 $P(X=x)=2^{-(x+1)}$，于是最佳检验功效

$$
\beta=P_{H_1}(X\in C)
=P_{H_1}(X=0)+P_{H_1}(X\ge 3)
=\frac12+\sum_{x=3}^{\infty}2^{-(x+1)}
=\frac12+\frac18
=\frac58.
$$

**证毕。**
