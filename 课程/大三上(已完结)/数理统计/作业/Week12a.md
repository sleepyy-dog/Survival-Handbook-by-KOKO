# 第十九讲

## 郑博引 23339147

#### 1.

> 1. 设$X_1, X_2, \dots, X_9$表示来自分布$N(\theta, \sigma^2)$的一个随机样本，其中$-\infty < \theta < +\infty$。判断下面说法是否正确？为什么？
>因为当$n=9$时，统计量$\bar{X}_9 = (X_1 + X_2 + \dots + X_9)/9$的方差$Var(\bar{X}_9) = \sigma^2/9 < \sigma^2 = Var(X_1)$，且$E(\bar{X}_9) = E(X_1) = \theta$，所以$\bar{X}_9$是$\theta$的极小方差无偏估计量($MVUE$)。

**解：**

> [!NOTE]
>
> 在所有无偏估计量中，如果存在一个估计量，其方差 小于或等于任何其他无偏估计量的方差，那么这个估计量就被称为极小方差无偏估计量 (MVUE)。
>
> 注：此时我们可以将检验$CR$下降法作为一个充分条件的检验方法，因为此时为无偏，所以
>
> $$
>\frac{E'(\theta)^2}{nI(\theta)}=\frac{1}{nI(\theta)}
> $$

**该说法是错误的。** 虽然结论 "$\bar{X}_9$ 是 $\theta$ 的 $MVUE$" 本身正确，但题目给出的论证理由是不充分的。

**错误分析：**

题目的论证逻辑是：$\bar{X}_9$ 的方差比 $X_1$ 的方差小，所以 $\bar{X}_9$ 是 $MVUE$。

然而，$MVUE$ 的定义是：**在所有无偏估计量中方差最小的估计量**。

仅仅证明 $Var(\bar{X}_9) < Var(X_1)$ 只是说明 $\bar{X}_9$ 比 $X_1$ 这一个特定估计量更优，并不能保证 $\bar{X}_9$ 在所有无偏估计量中方差最小。

**正确的证明方法（$C$-$R$ 下界法）：**

对于正态分布 $N(\theta, \sigma^2)$，其概率密度函数为：

$$
f(x; \theta) = \frac{1}{\sqrt{2\pi}\sigma} \exp\left(-\frac{(x-\theta)^2}{2\sigma^2}\right)
$$

计算 $Fisher$ 信息量：

$$
\ln f(x; \theta) = -\frac{1}{2}\ln(2\pi\sigma^2) - \frac{(x-\theta)^2}{2\sigma^2}
$$

$$
\frac{\partial \ln f}{\partial \theta} = \frac{x-\theta}{\sigma^2}
$$

$$
I(\theta) = E\left[\left(\frac{\partial \ln f}{\partial \theta}\right)^2\right] = \frac{1}{\sigma^4} E[(X-\theta)^2] = \frac{1}{\sigma^2}
$$

对于 $n=9$ 个样本，$C$-$R$ 不等式下界为：

$$
Var(\hat{\theta}) \geq \frac{1}{9 \cdot I(\theta)} = \frac{\sigma^2}{9}
$$

而 $Var(\bar{X}_9) = \sigma^2/9$，恰好**达到** $C$-$R$ 下界。

因此，$\bar{X}_9$ 是 $\theta$ 的 $MVUE$。

**证毕。**

#### 2.

> 2. 设$X_1, X_2, \dots, X_{25}$是来自分布$N(\theta, 1)$的一个随机样本，其中$-\infty < \theta < +\infty$。设$Y = \overline{X}_{25}$，即随机样本的均值，同时设损失函数$L[\theta, \delta(y)] = [\theta - \delta(y)]^2$。对于$-\infty < y < +\infty$，将对由$\delta_1(y) = y$与$\delta_2(y) = 0$给出的两个决策函数进行比较。

**解：**

由于 $X_1, X_2, \dots, X_{25}$ 是来自 $N(\theta, 1)$ 的随机样本，样本均值 $Y = \overline{X}_{25}$ 服从分布：

$$
Y \sim N\left(\theta, \frac{1}{25}\right)
$$

决策函数的优劣通过**风险函数**（损失函数的期望）来比较：

$$
R(\theta, \delta) = E_\theta[L(\theta, \delta(Y))] = E_\theta[(\theta - \delta(Y))^2]
$$

**计算 $\delta_1(y) = y$ 的风险函数：**

$$
R(\theta, \delta_1) = E_\theta[(\theta - Y)^2] = \text{Var}(Y) = \frac{1}{25}
$$

因此，$R(\theta, \delta_1) = \frac{1}{25}$ 对所有 $\theta$ 恒成立。

**计算 $\delta_2(y) = 0$ 的风险函数：**

$$
R(\theta, \delta_2) = E_\theta[(\theta - 0)^2] = \theta^2
$$

**比较两个决策函数：**

- 当 $|\theta| < \frac{1}{5}$ 时，$\theta^2 < \frac{1}{25}$，即 $R(\theta, \delta_2) < R(\theta, \delta_1)$，此时 $\delta_2$ 更优。
- 当 $|\theta| > \frac{1}{5}$ 时，$\theta^2 > \frac{1}{25}$，即 $R(\theta, \delta_1) < R(\theta, \delta_2)$，此时 $\delta_1$ 更优。
- 当 $|\theta| = \frac{1}{5}$ 时，两者风险相等。

**结论：** 两个决策函数均不是一致最优的。$\delta_1(y) = y$ 在 $|\theta|$ 较大时表现更好，而 $\delta_2(y) = 0$ 在 $\theta$ 接近 $0$ 时表现更好。两者互不可容许（neither dominates the other）。

**证毕。**

---

#### 3.

> 3. 假定有两个统计学家$A$与$B$，观测到10次独立随机试验以成功或失败结束。设每次试验的成功概率为$\theta$，其中$0 < \theta < 1$。比如，每位统计学家在这10次试验中观测到有一次成功。然而，假定$A$预先决定采用$n=10$次这种观测值，并且发现仅有一次成功，而$B$决定采用为了得到第一次成功所需的那样多次观测值，这样刚好第10次试验获得成功。分别用两种方法分别求$A$与$B$在每次试验成功概率$\theta$的估计值，然后判别这些估计值的无偏性。

**解：**

**一、统计学家 $A$ 的情形（样本容量固定为 $n=10$）**

$A$ 事先固定做 $n=10$ 次试验，记每次成功概率为 $\theta$。记在 $10$ 次独立试验中成功次数为随机变量 $X$，则

$$
X \sim \mathrm{Bin}(10,\theta).
$$

题中观测到的是 $X=1$。

$A$ 自然的估计方法是用样本成功率作为 $\theta$ 的估计：

$$
\hat{\theta}_A=\frac{X}{10}.
$$

在本次具体观测下，$X=1$，因此

$$
\hat{\theta}_A=\frac{1}{10}.
$$

检验无偏性：有

$$
\mathbb{E}(X)=10\theta,
$$

于是

$$
\mathbb{E}(\hat{\theta}_A)
=\mathbb{E}\!\left(\frac{X}{10}\right)
=\frac{1}{10}\mathbb{E}(X)
=\frac{1}{10}\cdot 10\theta
=\theta.
$$

故 $\hat{\theta}_A$ 是 $\theta$ 的无偏估计。

---

**二、统计学家 $B$ 的情形（做到第一次成功为止）**

$B$ 的方案是：一直试验，直到第一次成功出现为止。令随机变量 $Y$ 表示为获得第一次成功所需的试验次数，则

$$
Y\sim\mathrm{Geometric}(\theta),
$$

且

$$
\mathbb{P}(Y=k)=(1-\theta)^{k-1}\theta,\quad k=1,2,\dots
$$

题中观测到 $Y=10$，即前 $9$ 次失败，第 $10$ 次成功。

对几何分布的参数 $\theta$，似然函数为

$$
L(\theta;y)
=(1-\theta)^{y-1}\theta.
$$

取对数似然：

$$
\ell(\theta;y)
=\ln L(\theta;y)
=(y-1)\ln(1-\theta)+\ln\theta.
$$

对 $\theta$ 求导并令为 $0$：

$$
\frac{\partial\ell}{\partial\theta}
=(y-1)\frac{-1}{1-\theta}+\frac{1}{\theta}
=0.
$$

整理：

$$
-\,\frac{y-1}{1-\theta}+\frac{1}{\theta}=0
\quad\Longrightarrow\quad
\frac{1}{\theta}=\frac{y-1}{1-\theta}
\quad\Longrightarrow\quad
1-\theta=\theta(y-1)
\quad\Longrightarrow\quad
1=\theta y,
$$

故极大似然估计为

$$
\hat{\theta}_B=\frac{1}{Y}.
$$

在本次具体观测下，$Y=10$，于是

$$
\hat{\theta}_B=\frac{1}{10}.
$$

---

**三、判别 $\hat{\theta}_B$ 的无偏性**

由 $Y\sim\mathrm{Geometric}(\theta)$（取 $1,2,\dots$ 型）可得

$$
\mathbb{P}(Y=k)=(1-\theta)^{k-1}\theta,\quad k=1,2,\dots
$$

因此

$$
\mathbb{E}\!\left(\frac{1}{Y}\right)
=\sum_{k=1}^{\infty}\frac{1}{k}\,(1-\theta)^{k-1}\theta.
$$

这个和可以化简为一个已知的闭式：
注意到对 $|x|<1$ 有
$$
-\ln(1-x)=\sum_{k=1}^{\infty}\frac{x^{k}}{k}.
$$

令 $x=1-\theta$，则

$$
-\ln(1-(1-\theta))
=-\ln\theta
=\sum_{k=1}^{\infty}\frac{(1-\theta)^{k}}{k}.
$$

于是

$$
\sum_{k=1}^{\infty}\frac{(1-\theta)^{k-1}}{k}
=\frac{1}{1-\theta}\sum_{k=1}^{\infty}\frac{(1-\theta)^{k}}{k}
=\frac{-\ln\theta}{1-\theta}.
$$

代回期望式：

$$
\mathbb{E}\!\left(\frac{1}{Y}\right)
=\theta\sum_{k=1}^{\infty}\frac{(1-\theta)^{k-1}}{k}
=\theta\cdot\frac{-\ln\theta}{1-\theta}
=-\,\frac{\theta\ln\theta}{1-\theta}.
$$

所以

$$
\mathbb{E}(\hat{\theta}_B)
=\mathbb{E}\!\left(\frac{1}{Y}\right)
=-\,\frac{\theta\ln\theta}{1-\theta}.
$$

对于 $0<\theta<1$，有 $\ln\theta<0$，故 $-\ln\theta>0$，但一般

$$
-\,\frac{\theta\ln\theta}{1-\theta}\neq \theta.
$$

因此 $\hat{\theta}_B=\frac{1}{Y}$ 不是 $\theta$ 的无偏估计量。

---

**总结：**

$1.$ 统计学家 $A$ 的估计量：

$$
\hat{\theta}_A=\frac{X}{10}\quad(\text{本次观测为 }1/10),
$$

且

$$
\mathbb{E}(\hat{\theta}_A)=\theta,
$$

故 $\hat{\theta}_A$ 是无偏估计。

$2.$ 统计学家 $B$ 的估计量：

$$
\hat{\theta}_B=\frac{1}{Y}\quad(\text{本次观测为 }1/10),
$$

但

$$
\mathbb{E}(\hat{\theta}_B)
=-\,\frac{\theta\ln\theta}{1-\theta}\neq\theta,
$$

故 $\hat{\theta}_B$ 是有偏估计。

**证毕。**
