# 第二十二讲

## 23339147郑博引

#### 题目 $1$（$2025$年$12$月$5$日数理统计第$22$讲作业）:
>
> 设 $X_1, X_2, \ldots, X_n$ 是源自均匀分布的随机变量，其pdf $f(x;\theta) = 1/\theta$，$0 < x < \theta$，$\theta > 0$，其他情况为 $0$。$Y_n = \max\{X_1, X_2, \ldots, X_n\}$。求证：$\frac{n+1}{n} Y_n$ 是 $\theta$ 的极小方差无偏估计量（MVUE）。

**解：**

> [!NOTE]
>
> 一个显然的思路是通过证明$\frac{n+1}{n} Y_n$的无偏，完备，充分。

###### 第一步：求 $Y_n$ 的分布

$Y_n$ 的分布函数为：

$$
F_{Y_n}(y) = P(Y_n \le y) = \prod_{i=1}^{n} P(X_i \le y) = \left(\frac{y}{\theta}\right)^n, \quad 0 < y < \theta
$$

因此 $Y_n$ 的概率密度函数为：

$$
f_{Y_n}(y;\theta) = \frac{n y^{n-1}}{\theta^n}, \quad 0 < y < \theta
$$

###### 第二步：验证无偏性

计算 $E[Y_n]$：

$$
E[Y_n] = \int_0^\theta y \cdot \frac{n y^{n-1}}{\theta^n} dy = \frac{n}{\theta^n} \cdot \frac{\theta^{n+1}}{n+1} = \frac{n\theta}{n+1}
$$

因此：

$$
E\left[\frac{n+1}{n} Y_n\right] = \frac{n+1}{n} \cdot \frac{n\theta}{n+1} = \theta
$$

故 $\frac{n+1}{n} Y_n$ 是 $\theta$ 的无偏估计。

###### 第三步：证明 $Y_n$ 是完备充分统计量

> [!NOTE]
>
> 完备性的定义：
>
> 对任意可测函数 $u(\cdot)$，如果对所有 $\theta\in\Theta$ 都有
>
> $$
> E_\theta[u(T)] = 0,
> $$
>
> 那么必有
>
> $$
> P_\theta\big(u(T)=0\big)=1 \quad \text{对所有 }\theta\in\Theta,
> $$
>
> 即 $u(T)=0$ 几乎处处成立（a.s.）。
>
> 则称$T$为**完备**。

由因子分解定理，$Y_n$ 是 $\theta$ 的充分统计量。

设对所有 $\theta > 0$，$E_\theta[u(Y_n)] = 0$，即：

$$
\int_0^\theta u(y) \cdot \frac{n y^{n-1}}{\theta^n} dy = 0
$$

令 $g(y) = u(y) \cdot y^{n-1}$，则 $\int_0^\theta g(y) dy = 0$ 对所有 $\theta > 0$ 成立。

由于 $\theta$ 可取任意正值，故 $g(y) = 0$ 几乎处处成立，从而 $u(y) = 0$ 几乎处处成立。

因此 $Y_n$ 是完备充分统计量。

###### 第四步：应用 Lehmann-Scheffé 定理

由于 $\frac{n+1}{n} Y_n$ 是基于完备充分统计量 $Y_n$ 的 $\theta$ 的无偏估计，根据 Lehmann-Scheffé 定理，$\frac{n+1}{n} Y_n$ 是 $\theta$ 的 MVUE。

**证毕。**

---

#### 题目 $2$（$2025$年$12$月$5$日数理统计第$22$讲作业）:
>
> 考察pdf $\{h(z;\theta), 0 < \theta < \infty\}$ 族。假定 $Z$ 具有由
>
> $$
> h(z;\theta) = \begin{cases} \frac{1}{\theta} e^{-z/\theta}, & 0 < z < +\infty \\ 0, & \text{其他} \end{cases}
> $$
>
> 给出的这一族中的pdf。设对于每一个 $\theta > 0$，$E[u(Z)] = 0$。求证：$\{h(z;\theta), 0 < \theta < \infty\}$ 族是完备的。
>
> > [!TIP]
> >
> > 设对于每一个 $\theta > 0$，$E[u(Z)] = 0$。
> >
> > 把这句话去掉好了，这就是完备的定义，放在这里毫无意义。

**解：**

假设对所有 $\theta > 0$，$E_\theta[u(Z)] = 0$，即：

$$
\int_0^\infty u(z) \cdot \frac{1}{\theta} e^{-z/\theta} dz = 0
$$

令 $t = 1/\theta$（$t > 0$），上式变为：

$$
\int_0^\infty u(z) \cdot t \cdot e^{-tz} dz = 0
$$

即：

$$
t \cdot \mathcal{L}\{u(z)\}(t) = 0
$$

其中 $\mathcal{L}\{u(z)\}(t) = \int_0^\infty u(z) e^{-tz} dz$ 是 $u(z)$ 的拉普拉斯变换。

由于 $t > 0$，故 $\mathcal{L}\{u(z)\}(t) = 0$ 对所有 $t > 0$ 成立。

根据拉普拉斯变换的唯一性定理，若一个函数的拉普拉斯变换在 $(0, +\infty)$ 上恒为零，则该函数几乎处处为零。

因此 $u(z) = 0$ 几乎处处成立，故 $\{h(z;\theta), 0 < \theta < \infty\}$ 族是完备的。

**证毕。**

---

#### 题目 $3$（$2025$年$12$月$5$日数理统计第$22$讲作业）:
>
> 设 $X_1, X_2, \ldots, X_n$ 是来自总体 $X$ 的随机样本，$X$ 服从参数为 $\theta$ 的泊松分布，由习题 $7.2.2$ 知道，$Y_1 = \sum_{i=1}^{n} X_i$ 是 $\theta$ 的充分统计量，求证：$Y_1$ 的概率质量函数族 $\{g_1(y_1;\theta), \theta > 0\}$ 为完备族。
>
> > [!IMPORTANT]
> >
> > 不考。

**解：**

由于 $X_i \sim \text{Poisson}(\theta)$，故 $Y_1 = \sum_{i=1}^{n} X_i \sim \text{Poisson}(n\theta)$。

$Y_1$ 的概率质量函数为：

$$
g_1(y_1;\theta) = \frac{(n\theta)^{y_1} e^{-n\theta}}{y_1!}, \quad y_1 = 0, 1, 2, \ldots
$$

假设对所有 $\theta > 0$，$E_\theta[u(Y_1)] = 0$，即：

$$
\sum_{y_1=0}^{\infty} u(y_1) \cdot \frac{(n\theta)^{y_1} e^{-n\theta}}{y_1!} = 0
$$

由于 $e^{-n\theta} > 0$，上式等价于：

$$
\sum_{y_1=0}^{\infty} \frac{u(y_1)}{y_1!} (n\theta)^{y_1} = 0
$$

令 $s = n\theta$（$s > 0$），则：

$$
\sum_{y_1=0}^{\infty} \frac{u(y_1)}{y_1!} s^{y_1} = 0, \quad \forall s > 0
$$

左边是关于 $s$ 的幂级数。根据幂级数的唯一性定理，若幂级数在某开区间上恒为零，则所有系数必为零。

因此 $\frac{u(y_1)}{y_1!} = 0$ 对所有 $y_1 = 0, 1, 2, \ldots$ 成立，即 $u(y_1) = 0$ 对所有 $y_1$ 成立。

故 $\{g_1(y_1;\theta), \theta > 0\}$ 是完备族。

**证毕。**

> [!NOTE]
>
> 事实上以上最后两题都可以使用正则指数族来实现。
