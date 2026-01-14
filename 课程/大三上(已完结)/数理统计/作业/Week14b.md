# 第二十四讲

## 23339147郑博引

#### 题目 $1$ ($2025$年$12$月$8$日数理统计第$24$讲作业$1$):
>
> 设 $X_1, X_2, \ldots, X_n$ 表示来自分布 $b(1, \theta)$ 的样本量为 $n>1$ 随机样本的观测值，其中 $0 < \theta < 1$。令 $\delta = \theta(1-\theta)$。
>
> $(1)$ 求证 $\bar{X}_n$ 是 $\theta$ 的唯一极小方差无偏估计量，并求 $Var(\bar{X}_n)$。
>
> $(2)$ 求 $\delta/n$ 的极小方差无偏估计量 $\hat{\delta}/n$，并求 $Y_1/n$ 的方差。
>
> $(3)$ 求证：当 $\theta \neq 1/2$ 时，$\sqrt{n}(\hat{\delta} - \delta) \xrightarrow{D} N(0, \theta(1-\theta)(1-2\theta)^2)$。
>
> > [!TIP]
> >
> > $$
> > y_1=\sum_{i=1}^nX_n
> > $$

> [!IMPORTANT]
>
> 不考。

**解：**

**(1)** 由于 $X_i \sim b(1, \theta)$（伯努利分布），令 $T = \sum_{i=1}^n X_i$，则 $T \sim b(n, \theta)$。

伯努利分布属于指数族，$T$ 是 $\theta$ 的**完备充分统计量**。

> [!NOTE]
>
> 伯努利分布的概率质量函数为：
>
> $$
> P(X=x|p) = p^x (1-p)^{1-x}, \quad x \in \{0,1\}
> $$
>
> **变换过程**：
>
> $$
> p^x (1-p)^{1-x} = \exp\left[x\ln p + (1-x)\ln(1-p)\right]\\
> = \exp\left[x\ln\frac{p}{1-p} + \ln(1-p)\right]
> $$
>
> 注意到以上有$T(x)=x$,则知$T = \sum_{i=1}^n T(X_i)= \sum_{i=1}^n X_i$为完备充分统计量。
>
> 事实上，以下都是正则指数族：
>
> 1. 伯努利分布
> 2. 二项分布
> 3. 指数分布
> 4. 泊松分布
> 5. 伽马分布
>
> | 分布                                       | 均值 $\mu$     | 充分统计量                              | 均值的 UMVUE                  |
> | ------------------------------------------ | -------------- | --------------------------------------- | ----------------------------- |
> | **伯努利分布** $\text{Bernoulli}(p)$       | $p$            | $T = \sum X_i$                          | $\bar{X} = T/n$               |
> | **二项分布** $\text{Binomial}(m, p)$       | $mp$           | $T = \sum X_i$                          | $\bar{X}$                     |
> | **指数分布** $\text{Exp}(\lambda)$         | $1/\lambda$    | $T = \sum X_i$                          | $\bar{X}$                     |
> | **泊松分布** $\text{Poisson}(\lambda)$     | $\lambda$      | $T = \sum X_i$                          | $\bar{X}$                     |
> | **伽马分布** $\text{Gamma}(\alpha, \beta)$ | $\alpha/\beta$ | $(T_1, T_2) = (\sum X_i, \sum \ln X_i)$ | $\bar{X}$（当 $\alpha$ 已知） |
>
> 反例有均匀分布,其充分统计量是$Y_n = \max\{X_1, X_2, \ldots, X_n\}$。

由于 $E(\bar{X}_n) = E(T/n) = n\theta/n = \theta$，所以 $\bar{X}_n$ 是 $\theta$ 的无偏估计。

根据 **Lehmann-Scheffé 定理**，基于完备充分统计量的无偏估计是唯一的 MVUE。

故 $\bar{X}_n$ 是 $\theta$ 的**唯一极小方差无偏估计量**。

方差计算：

$$
Var(\bar{X}_n) = \frac{1}{n^2}Var(T) = \frac{n\theta(1-\theta)}{n^2} = \frac{\theta(1-\theta)}{n} = \frac{\delta}{n}
$$

**(2)**

我们现在需要找一个$T$的函数满足

$$
E(f(T))=\delta
$$

考虑 $\bar{X}_n(1-\bar{X}_n)$，计算其期望：

$$
E(\bar{X}_n^2) = Var(\bar{X}_n) + [E(\bar{X}_n)]^2 = \frac{\delta}{n} + \theta^2
$$

$$
E[\bar{X}_n(1-\bar{X}_n)] = \theta - \frac{\delta}{n} - \theta^2 = \delta - \frac{\delta}{n} = \frac{(n-1)\delta}{n}
$$

因此：

$$
\hat{\delta} = \frac{n}{n-1}\bar{X}_n(1-\bar{X}_n) = \frac{T(n-T)}{n(n-1)}
$$

是 $\delta$ 的 MVUE。从而 $\delta/n$ 的极小方差无偏估计量为：

$$
\frac{\hat{\delta}}{n} = \frac{T(n-T)}{n^2(n-1)}
$$

对于 $Y_1/n = \bar{X_n}$，故

$$
Var(Y_1/n) = \delta/n
$$

**(3)**

此时我们有

$$
\hat{\delta} = \frac{T(n-T)}{n(n-1)}
$$

令 $g(\theta) = \theta(1-\theta) = \delta$，则 $g'(\theta) = 1 - 2\theta$。

由中心极限定理：

$$
\sqrt{n}(\bar{X}_n - \theta) \xrightarrow{D} N(0, \theta(1-\theta))
$$

当 $\theta \neq 1/2$ 时，$g'(\theta) = 1-2\theta \neq 0$。由 **Delta 方法**：

$$
\sqrt{n}(g(\bar{X}_n) - g(\theta)) \xrightarrow{D} N(0, [g'(\theta)]^2 \cdot \theta(1-\theta))
$$

注意到 $\hat{\delta} = \frac{n}{n-1}\bar{X}_n(1-\bar{X}_n)$ 与 $\bar{X}_n(1-\bar{X}_n)$ 渐近等价，因此：

$$
\sqrt{n}(\hat{\delta} - \delta) \xrightarrow{D} N(0, (1-2\theta)^2 \cdot \theta(1-\theta)) = N(0, \theta(1-\theta)(1-2\theta)^2)
$$

**证毕。**

---

#### 题目 $2$ ($2025$年$12$月$8$日数理统计第$24$讲作业$1$):
>
> 设 $X$ 服从参数为 $\theta$ 的泊松分布 $p(\theta)$，$0 < \theta < \infty$。可将 $X$ 考虑成源自该分布的样本量为 $1$ 的随机样本 $X_1$。
>
> 求证：$Y = (-1)^{X_1}$ 是 $e^{-2\theta}$ 的极小方差无偏估计量，但是 $Y$ 不在 $e^{-2\theta}$ 的取值范围内，故 $Y$ 是 $e^{-2\theta}$ 的不合适的估计值。

**解：**

**第一步：验证无偏性**

计算 $E[(-1)^{X_1}]$：

$$
E[(-1)^{X_1}] = \sum_{k=0}^{\infty} (-1)^k \cdot \frac{\theta^k e^{-\theta}}{k!} = e^{-\theta} \sum_{k=0}^{\infty} \frac{(-\theta)^k}{k!} = e^{-\theta} \cdot e^{-\theta} = e^{-2\theta}
$$

故 $Y = (-1)^{X_1}$ 是 $e^{-2\theta}$ 的无偏估计。

**第二步：证明是 MVUE**

泊松分布属于指数族，其概率质量函数可写为：

$$
p(x;\theta) = \frac{\theta^x e^{-\theta}}{x!} = \frac{1}{x!} \exp(x\ln\theta - \theta)
$$

对于样本量为 $1$ 的情形，$X_1$ 本身就是 $\theta$ 的**完备充分统计量**。

> [!NOTE]
>
> 事实上这里是使用了$\sum_{i-1}^n X_i$为完备充分统计量，取$n=1$。

由于 $Y = (-1)^{X_1}$ 是完备充分统计量 $X_1$ 的函数，且是 $e^{-2\theta}$ 的无偏估计，根据 **Lehmann-Scheffé 定理**，$Y$ 是 $e^{-2\theta}$ 的**唯一极小方差无偏估计量 (MVUE)**。

**第三步：说明 $Y$ 是不合适的估计值**

$Y = (-1)^{X_1}$ 的取值范围：当 $X_1$ 为偶数时 $Y = 1$，当 $X_1$ 为奇数时 $Y = -1$。

故 $Y \in \{-1, 1\}$。

而 $e^{-2\theta}$ 的取值范围：当 $0 < \theta < \infty$ 时，$e^{-2\theta} \in (0, 1)$。

显然 $Y$ 的任何可能取值（$\pm 1$）都**不在** $e^{-2\theta}$ 的实际取值范围 $(0,1)$ 内。

特别地，$Y = -1 < 0$，而 $e^{-2\theta} > 0$ 恒成立，这意味着有一半的概率估计值为负，这是荒谬的。

因此，虽然 $Y$ 是 MVUE，但作为 $e^{-2\theta}$ 的估计值是**不合适的**。

**证毕。**

---

#### 题目 $3$ ($2025$年$12$月$8$日数理统计第$24$讲作业$2$):
>
> 假设 $X_1, X_2, \ldots, X_n$ 是 iid 随机变量，服从共同均匀分布 $U(0, \theta)$。设 $Y_n = \max\{X_1, X_2, \ldots, X_n\}$。对于所有 $\theta$ 的可微函数 $g(\theta)$，求 $g(\theta)$ 的极小方差无偏估计量 (MVUE)。

**解：**

**第一步：确定完备充分统计量**

对于 $U(0, \theta)$ 分布，$Y_n = \max\{X_1, \ldots, X_n\}$ 是 $\theta$ 的**完备充分统计量**。

> [!NOTE]
>
> 注意到
>
> $$
> f(x_1,x_2\cdots,x_n,\theta)=\frac{1}{\theta^n}\cdot I_{(-\infin,\theta)}(y_n)\prod_{i=1}^nI_{(0,\infin)}(x_i)
> $$
>
> 则由因式分解定理知是充分统计量。
>
> 此时若$E(u(y_n))=0$,我们首先求$F(y_1)=(\frac{y_1}{\theta})^n,y_1\in[0,\theta]$，知$P(y_1)=\frac{ny_1^{n-1}}{\theta^n}$。
>
> 知
>
> $$
> \int_0^{\theta}\frac{ny_1^{n-1}}{\theta^n}u(y_1)dy_1=0
> $$
>
> 知
>
> $$
> \int_0^\theta y_1^nu(y_1)dy_1=0
> $$
>
> 知$y_1^nu(y_1)$几乎处处为0，则知$u(y_1)$几乎处处为0。
>
> 知为完备统计量。

$Y_n$ 的概率密度函数为：

$$
f_{Y_n}(y) = \frac{n y^{n-1}}{\theta^n}, \quad 0 \leq y \leq \theta
$$

**第二步：构造无偏估计**

设 $h(Y_n)$ 是 $g(\theta)$ 基于 $Y_n$ 的无偏估计，则需满足：

$$
E[h(Y_n)] = \int_0^{\theta} h(y) \cdot \frac{n y^{n-1}}{\theta^n} dy = g(\theta)
$$

即：

$$
\int_0^{\theta} h(y) \cdot n y^{n-1} dy = g(\theta) \cdot \theta^n
$$

注意到$\theta=0$时；等式两边都为0，则知上式等价于两边对 $\theta$ 求导：

$$
h(\theta) \cdot n \theta^{n-1} = g'(\theta) \cdot \theta^n + g(\theta) \cdot n\theta^{n-1}
$$

化简得：

$$
h(\theta) = g(\theta) + \frac{\theta \cdot g'(\theta)}{n}
$$

**第三步：给出 MVUE**

将 $\theta$ 替换为 $Y_n$，得到 $g(\theta)$ 的 MVUE 为：

$$
\boxed{\hat{g}(Y_n) = g(Y_n) + \frac{Y_n \cdot g'(Y_n)}{n}}
$$

**证毕。**

---

#### 题目 $4$ ($2025$年$12$月$8$日数理统计第$24$讲作业$2$):
>
> 设 $X_1, X_2, \ldots, X_n$ 是来自分布 $N(\theta, 1)$ 的样本量为 $n>1$ 的随机样本。求由
>
> $$
> P(X \leq c) = \int_{-\infty}^{c} \frac{1}{\sqrt{2\pi}} e^{-(x-\theta)^2/2} dx = \Phi(c - \theta)
> $$
>
> 定义的 $\theta$ 的函数 $F(c; \theta)$ 的极小方差无偏估计量 (MVUE)，其中 $c$ 表示固定常数。

**解：**

**第一步：确定完备充分统计量**

对于 $N(\theta, 1)$ 分布，$\bar{X} = \frac{1}{n}\sum_{i=1}^n X_i$ 是 $\theta$ 的**完备充分统计量**，且 $\bar{X} \sim N(\theta, 1/n)$。

> [!NOTE]
>
> 这里根据指数分布是正则指数族，且
>
> $$
> \frac{1}{\sqrt{2\pi}}e^{-\frac{(x-\theta)^2}{2}}= \frac{1}{\sqrt{2\pi}}e^{-\frac{x^2}{2}}e^{-\frac{\theta^2}{2}}e^{x\theta}
> $$
>
> 注意到$T(x)=x$，则知$\sum_{i=1}^n X_i$为完备统计量，进而得到$\bar{X} = \frac{1}{n}\sum_{i=1}^n X_i$为完备统计量。
>
> 这里使用一个一一对应函数下充分完备性的延扩性质。
>
###### 1. 充分性的保持
>
> **性质**：若 $T$ 是 $\theta$ 的充分统计量，$\varphi$ 是一一对应函数，则 $\varphi(T)$ 也是充分统计量。
>
> **证明**：由充分性定义，给定 $T$ 时样本的条件分布与 $\theta$ 无关。由于 $\varphi$ 一一对应，给定 $\varphi(T)$ 等价于给定 $T$，故条件分布仍与 $\theta$ 无关。
>
###### 2. 完备性的保持
>
> **性质**：若 $T$ 是完备统计量，$\varphi$ 是一一对应函数，则 $\varphi(T)$ 也是完备统计量。
>
> **证明**：设 $S = \varphi(T)$，若 $E_\theta[g(S)] = 0$ 对所有 $\theta$ 成立，则：
>
>$$
> E_\theta[g(\varphi(T))] = 0 \quad \forall \theta
> $$
>
>令 $h(T) = g(\varphi(T))$，由 $T$ 的完备性，$h(T) = 0$ a.s.，即 $g(\varphi(T)) = 0$ a.s.，从而 $g(S) = 0$ a.s.。故 $S$ 完备。

**第二步：找初始无偏估计**

令 $T = I(X_1 \leq c)$（示性函数），则：

$$
E[T] = P(X_1 \leq c) = \Phi(c - \theta)
$$

故 $T$ 是 $\Phi(c-\theta)$ 的无偏估计。

**第三步：应用 Rao-Blackwell 定理**

> [!NOTE]
>
> **Rao-Blackwell 定理**：设 $T$ 是参数 $\theta$ 的一个无偏估计量，$S$ 是 $\theta$ 的充分统计量。令
>
> $$
> T^* = E[T | S]
> $$
>
> 则：
>
> 1. **$T^*$ 仍是 $\theta$ 的无偏估计**：$E[T^*] = E[E[T|S]] = E[T] = \theta$
> 2. $T^*$ 的方差不大于 $T$ 的方差：$\text{Var}(T^*) \leq \text{Var}(T)$
> 3. $T^*$ 是 $S$ 的函数（即基于充分统计量）
>
> 我们将使用1 3两个结论。

计算 $E[I(X_1 \leq c) | \bar{X}]$。

> [!NOTE]
>
> $(X_1, \bar{X})$ 服从二维正态分布，其中：
>
> - $E[X_1] = \theta$，$Var(X_1) = 1$
> - $E[\bar{X}] = \theta$，$Var(\bar{X}) = 1/n$
> - $Cov(X_1, \bar{X}) = \frac{1}{n}$
>
> 对于二维正态 $(X, Y)$，条件分布为：
>
> $$
> X \mid Y = y \sim N\left(\mu_X + \frac{\sigma_{XY}}{\sigma_Y^2}(y - \mu_Y), \sigma_X^2 - \frac{\sigma_{XY}^2}{\sigma_Y^2}\right)
> $$

条件分布 $X_1 | \bar{X} = \bar{x}$ 为正态分布：

$$
E[X_1 | \bar{X} = \bar{x}] = \theta + \frac{Cov(X_1, \bar{X})}{Var(\bar{X})}(\bar{x} - \theta) = \theta + \frac{1/n}{1/n}(\bar{x} - \theta) = \bar{x}
$$

$$
Var(X_1 | \bar{X}) = Var(X_1) - \frac{[Cov(X_1, \bar{X})]^2}{Var(\bar{X})} = 1 - \frac{(1/n)^2}{1/n} = 1 - \frac{1}{n} = \frac{n-1}{n}
$$

因此 $X_1 | \bar{X} \sim N\left(\bar{X}, \frac{n-1}{n}\right)$。

**第四步：给出 MVUE**

$$
E[I(X_1 \leq c) | \bar{X}] = P(X_1 \leq c | \bar{X}) = \Phi\left(\frac{c - \bar{X}}{\sqrt{(n-1)/n}}\right)
$$

故 $\Phi(c - \theta)$ 的 **MVUE** 为：

$$
\boxed{\hat{F}(c; \theta) = \Phi\left(\frac{c - \bar{X}}{\sqrt{(n-1)/n}}\right) = \Phi\left(\sqrt{\frac{n}{n-1}}(c - \bar{X})\right)}
$$

**证毕。**

---

#### 考研题1
>
>设 $X_1, \dots, X_n \sim B(1, p)$，$g(p) = p^2(1-p)$，$n \ge 4$。
>
>a. 证明 $X_1 X_2 (1-X_3)$ 是 $g(p)$ 的无偏估计量。
>
>b. 计算 $X_1 X_2 (1-X_3)$ 的有效性。
>
>c. 给出 $g(p)$ 的 MVUE。

**解：**

###### (a)

$$
E[X_1 X_2 (1-X_3)] = E[X_1]E[X_2](1-E[X_3]) = p \cdot p \cdot (1-p) = g(p)
$$

得证。

###### (b)

首先$CRLB = \frac{[g'(p)]^2}{n I(p)} = \frac{[2p-3p^2]^2}{n/[p(1-p)]} = \frac{p^3(1-p)(2-3p)^2}{n}$。

还有$Var(T_0) = E[T_0^2] - g(p)^2 = g(p) - g(p)^2 = p^2[1-p](1-p^2(1-p))$。

$$
Eff = \frac{p(2-3p)^2}{n[1-p^2(1-p)]}
$$

###### (c)

利用充分完备统计量 $T = \sum X_i$，及 Lehmann-Scheffe 定理：

$$
\hat{g} = E[X_1 X_2 (1-X_3) | T] = \frac{\binom{n-3}{T-2}}{\binom{n}{T}} \quad (2 \le T \le n-1)
$$

代入化简得：

$$
\hat{g}_{MVUE} = \frac{T(T-1)(n-T)}{n(n-1)(n-2)}
$$

**证毕。**

> [!NOTE]
>
> 事实上，以上这两题，我们使用$E[T^*] = E[E[T|S]] = E[T]$这样的形式求解有一一个关键前提，就是我们已经构造出一个$T$满足$E(T)$等于$g(\theta)$，而这样的构造往往是困难的。
