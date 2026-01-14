# 第二十三讲

## 23339147郑博引

> [!NOTE]
>
> 期末出一道考研大题，剩下60%是作业题，其他都是作业题改一下。
>
> 只考第6，7，8，9章作业题。

#### 题目 $1$：
>
> 若 $f(x;\theta)$ 服从 $N(0,\theta)$，试判别正态族 $\{f(x;\theta), 0<\theta<+\infty\}$ 的每个成员是否都表示连续型随机变量正则指数类？

**解：**

正态分布 $N(0, \theta)$ 的概率密度函数为：

$$
f(x;\theta) = \frac{1}{\sqrt{2\pi\theta}} \exp\left(-\frac{x^2}{2\theta}\right)
$$

正则指数类的标准形式为：

$$
f(x;\theta) = C(\theta) h(x) \exp\{Q(\theta) K(x)\}
$$

将 $N(0,\theta)$ 的密度函数改写为：

$$
f(x;\theta) = \frac{1}{\sqrt{2\pi\theta}} \cdot 1 \cdot \exp\left\{\left(-\frac{1}{2\theta}\right) \cdot x^2\right\}
$$

对比可得：

- $C(\theta) = \frac{1}{\sqrt{2\pi\theta}}$
- $h(x) = 1$
- $Q(\theta) = -\frac{1}{2\theta}$
- $K(x) = x^2$

验证 $Q(\theta)$ 的单调性：

$$
\frac{dQ(\theta)}{d\theta} = \frac{1}{2\theta^2} > 0, \quad \forall \theta \in (0, +\infty)
$$

因此 $Q(\theta)$ 是 $\theta$ 的严格单调递增函数。

**结论**：正态族 $\{f(x;\theta), 0<\theta<+\infty\}$ 的每个成员**都是**正则指数类。

**证毕。**

---

#### 题目 $2$：
>
> 若 $f(x;\theta)$ 服从均匀分布 $U(0,\theta)$，试判别均匀族 $\{f(x;\theta), 0<\theta<+\infty\}$ 的每个成员是否都表示正则指数类？

**解：**

均匀分布 $U(0, \theta)$ 的概率密度函数为：

$$
f(x;\theta) = \frac{1}{\theta} I(0 < x < \theta)
$$

其中 $I(\cdot)$ 为示性函数。

正则指数类要求密度函数可分解为 $C(\theta) h(x) \exp\{Q(\theta) K(x)\}$ 的形式，其中：

- $C(\theta)$ 和 $Q(\theta)$ 仅依赖于 $\theta$
- $h(x)$ 和 $K(x)$ 仅依赖于 $x$

对于均匀分布，示性函数 $I(0 < x < \theta)$ 的取值同时依赖于 $x$ 和 $\theta$，无法将其分离成仅含 $x$ 的部分和仅含 $\theta$ 的部分的乘积形式。

**结论**：均匀族 $\{f(x;\theta), 0<\theta<+\infty\}$ 的成员**不属于**正则指数类。

**证毕。**

---

#### 题目 $3$：
>
> 设 $X_1, X_2, \ldots, X_n$ 表示来自代表正则指数类情况分布的一个随机样本。求证：$Y_1 = \sum_{i=1}^{n} K(x_i)$ 是参数 $\theta$ 的充分统计量。

**解：**

设总体 $X$ 的密度函数属于正则指数类：

$$
f(x;\theta) = C(\theta) h(x) \exp\{Q(\theta) K(x)\}
$$

样本 $X_1, X_2, \ldots, X_n$ 的联合密度函数为：

$$
f(x_1, \ldots, x_n; \theta) = \prod_{i=1}^{n} C(\theta) h(x_i) \exp\{Q(\theta) K(x_i)\}
$$

整理得：

$$
f(x_1, \ldots, x_n; \theta) = [C(\theta)]^n \exp\left\{Q(\theta) \sum_{i=1}^{n} K(x_i)\right\} \cdot \prod_{i=1}^{n} h(x_i)
$$

令 $Y_1 = \sum_{i=1}^{n} K(x_i)$，则上式可分解为：

$$
f(x_1, \ldots, x_n; \theta) = \underbrace{[C(\theta)]^n \exp\{Q(\theta) Y_1\}}_{g(Y_1, \theta)} \cdot \underbrace{\prod_{i=1}^{n} h(x_i)}_{h^*(x_1, \ldots, x_n)}
$$

其中 $g(Y_1, \theta)$ 仅通过 $Y_1$ 依赖于样本，$h^*(x_1, \ldots, x_n)$ 不依赖于 $\theta$。

由**因子分解定理**，$Y_1 = \sum_{i=1}^{n} K(x_i)$ 是参数 $\theta$ 的充分统计量。

**证毕。**

事实上，以上这个命题可以配合另一个命题来快速得到一个完备充分统计量，进而得到极小方差无偏估计。

> [!NOTE]
>
> **定理（指数族完备性）**：若分布族具有形式 $f(x;\theta) = \exp\{\eta(\theta) \cdot T(x) - B(\theta)\} h(x)$ 且自然参数空间 $\mathcal{H} = \{\eta(\theta) : \theta \in \Theta\}$ 包含一个 **$\mathbb{R}^k$ 中的开集**，则 $T(X)$ 是**完备的**。
>
> 此时我们可以有以下命题：
>
> 设指数分布族具有形式 $f(x;\theta) = C(\theta) \, h(x) \exp\{Q(\theta) K(x)\}$，若自然参数空间 $\mathcal{H} = \{Q(\theta) : \theta \in \Theta\}$ 包含 $\mathbb{R}$ 中一个**开区间**，则 ：
>
> $$
> \boxed{Y = \sum_{i=1}^{n} K(X_i) \text{ 是 } \theta \text{ 的完备充分统计量}}
> $$

---

#### 题目 $4$：
>
>设 $X$ 服从泊松分布 $p(\theta)$，它的参数 $\theta \in (0, \infty)$。$X_1, X_2, \ldots, X_n$ 表示来自 $X$ 的一个随机样本。
>
> $(1)$ 试判别泊松分布是否是正则指数类的元素？$(2)$ 求充分统计量 $Y_1$；$(3)$ 求 $R(y_1)$；$(4)$ 求 $E(Y_1)$ 和 $\text{Var}(Y_1)$；$(5)$ 求 $\theta$ 的唯一极小方差无偏估计量。

> [!NOTE]
>
> 这里对$R(y_1)$的解读是：
>
> $$
> f_{Y_1}(y_1;\theta) = R(y_1)\exp\left[p(\theta)y_1 + nq(\theta)\right]
> $$

**解：**

泊松分布的概率函数为：

$$
P(X = x) = \frac{\theta^x e^{-\theta}}{x!}, \quad x = 0, 1, 2, \ldots
$$

**(1) 判断是否为正则指数类**

将概率函数改写为：

$$
f(x;\theta) = e^{-\theta} \cdot \frac{1}{x!} \cdot e^{x \ln\theta} = e^{-\theta} \cdot \frac{1}{x!} \cdot \exp\{(\ln\theta) \cdot x\}
$$

对比标准形式，得：

- $C(\theta) = e^{-\theta}$
- $h(x) = \frac{1}{x!}$
- $Q(\theta) = \ln\theta$
- $K(x) = x$

由于 $Q(\theta) = \ln\theta$ 在 $(0, +\infty)$ 上严格单调递增，故泊松分布**是**正则指数类的元素。

**(2) 充分统计量 $Y_1$**

由题目 $3$ 的结论：

$$
Y_1 = \sum_{i=1}^{n} K(X_i) = \sum_{i=1}^{n} X_i
$$

**(3) 求 $R(y_1)$**

此时$Y_1$服从$possin(n\theta)$，此时我们有：

$$
f_{Y_1}(y_1;\theta) = \frac{n^{y_1}}{y_1!} \cdot \theta^{y_1} \cdot e^{-n\theta}
$$

进一步变形：

$$
f_{Y_1}(y_1;\theta) = \frac{n^{y_1}}{y_1!} \cdot \exp\left[y_1 \ln\theta - n\theta\right]
$$

得到

$$
R(y_1)=\frac{n^{y_1}}{y_1!}
$$

**(4) 求 $E(Y_1)$ 和 $\text{Var}(Y_1)$**

由于 $X_i \sim P(\theta)$，有 $E(X_i) = \theta$，$\text{Var}(X_i) = \theta$。

$$
E(Y_1) = E\left(\sum_{i=1}^{n} X_i\right) = n\theta
$$

$$
\text{Var}(Y_1) = \text{Var}\left(\sum_{i=1}^{n} X_i\right) = n\theta
$$

**(5) $\theta$ 的唯一极小方差无偏估计量**

由于 $E(Y_1) = n\theta$，构造无偏估计：

$$
\hat{\theta} = \frac{Y_1}{n} = \frac{1}{n}\sum_{i=1}^{n} X_i = \bar{X}
$$

验证：$E(\bar{X}) = \frac{n\theta}{n} = \theta$，是无偏的。

由 $\text{Lehmann-Scheffé}$ 定理，$Y_1$ 是完全充分统计量，故基于 $Y_1$ 的无偏估计是 $\text{UMVUE}$。

**结论**：$\theta$ 的唯一极小方差无偏估计量为 $\hat{\theta} = \bar{X}$。

**证毕。**

---

#### 题目 $5$：
>
> 设 $X_1, X_2, \ldots, X_n$ 表示来自正态分布 $N(\theta, \sigma^2)$ 的随机样本，任意固定 $\sigma^2 > 0$，求 $\theta$ 的唯一极小方差无偏估计量。

**解：**

正态分布 $N(\theta, \sigma^2)$ 的概率密度函数为：

$$
f(x;\theta) = \frac{1}{\sqrt{2\pi}\sigma} \exp\left(-\frac{(x-\theta)^2}{2\sigma^2}\right)
$$

展开指数部分：

$$
f(x;\theta) = \frac{1}{\sqrt{2\pi}\sigma} \exp\left(-\frac{\theta^2}{2\sigma^2}\right) \cdot \exp\left(-\frac{x^2}{2\sigma^2}\right) \cdot \exp\left(\frac{\theta}{\sigma^2} \cdot x\right)
$$

对比正则指数类标准形式，得：

- $C(\theta) = \frac{1}{\sqrt{2\pi}\sigma} \exp\left(-\frac{\theta^2}{2\sigma^2}\right)$
- $h(x) = \exp\left(-\frac{x^2}{2\sigma^2}\right)$
- $Q(\theta) = \frac{\theta}{\sigma^2}$（严格单调递增）
- $K(x) = x$

故充分统计量为：

$$
Y_1 = \sum_{i=1}^{n} X_i
$$

由于 $E(X_i) = \theta$，有 $E(Y_1) = n\theta$。

构造无偏估计：

$$
\hat{\theta} = \frac{Y_1}{n} = \bar{X}
$$

对于正态分布族，$Y_1$ 是完全充分统计量。由 $\text{Lehmann-Scheffé}$ 定理，基于完全充分统计量的无偏估计是唯一的 $\text{UMVUE}$。

**结论**：$\theta$ 的唯一极小方差无偏估计量为 $\hat{\theta} = \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i$。

**证毕。**
