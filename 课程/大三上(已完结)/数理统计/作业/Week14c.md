# 第二十五讲

## 23339147郑博引

#### 题目 $1$.（多项式分布）:
>
> 考察导致 $k$ 个结果或类别之一且仅一个结果的随机试验。设 $X_j$ 是 $1$ 或 $0$，其结果依赖于第 $j$ 个结果发生与否，其中 $j=1,2,\dots,k$。假定第 $j$ 个结果发生的概率是 $p_j$。设 $\mathbf{X}=(X_1, X_2, \dots, X_{k-1})'$ 而 $\boldsymbol{\theta}=(p_1,\dots,p_{k-1})'$。$\mathbf{X}$ 的分布服从多项式分布，求 $p_j$ 参数极小方差无偏估计量，$j=1,2,\dots,k-1$。

**解：**

设 $\mathbf{X}^{(1)}, \mathbf{X}^{(2)}, \dots, \mathbf{X}^{(n)}$ 是 $n$ 个独立同分布的观测。由于每次试验仅有一个结果发生，有 $\sum_{j=1}^{k} X_j = 1$。

定义 $N_j = \sum_{i=1}^{n} X_j^{(i)}$ 表示第 $j$ 个结果在 $n$ 次试验中发生的总次数。则 $(N_1, N_2, \dots, N_{k-1})$ 服从多项分布，且是 $(p_1, \dots, p_{k-1})$ 的**完备充分统计量**。

> [!NOTE]
>
> 多参数下指数组的要求：
>
> $$
> f(x;\boldsymbol{\theta}) =
> \begin{cases}
> \exp\left[\sum_{j=1}^{m} p_j(\boldsymbol{\theta})K_j(x) + H(x) + q(\theta_1, \theta_2, \dots, \theta_m)\right], & \text{对于所有 } x \in S \\
> 0, & \text{其他}
> \end{cases}
> $$
>
> 这里的证明是使用了伯努利分布是正则指数族：
>
> $$
> f(\mathbf{x}, \mathbf{p}) = \exp\left\{\sum_{j=1}^{k-1} \left[\log\left[\frac{p_j}{1-\sum_{i \neq k} p_i}\right]\right] x_j + \log\left(1-\sum_{i \neq k} p_i\right)\right\}
> $$
>
> 这里$K_j(\mathbf{x})=x_j$，得到$(N_1, N_2, \dots, N_{k-1})$为完备充分统计量。

考虑估计量 $\hat{p}_j = \dfrac{N_j}{n}$。首先验证其无偏性：

$$
E(\hat{p}_j) = E\left(\frac{N_j}{n}\right) = \frac{1}{n} \cdot np_j = p_j
$$

由于 $\hat{p}_j = \dfrac{N_j}{n}$ 是完备充分统计量 $(N_1, \dots, N_{k-1})$ 的函数，且是 $p_j$ 的无偏估计，根据 **Lehmann-Scheffé 定理**，它是 $p_j$ 的唯一极小方差无偏估计量（UMVUE）。

因此，$p_j$ 的极小方差无偏估计量为：

$$
\hat{p}_j = \frac{N_j}{n} = \frac{1}{n}\sum_{i=1}^{n} X_j^{(i)}, \quad j=1,2,\dots,k-1
$$

**证毕。**

---

#### 题目 $2$
>
> 设 $X_1, X_2, \dots, X_n$ 是来自下述分布的随机样本，此分布具有 pdf：
>
> $$
> f(x;\theta_1,\theta_2) = \begin{cases} \dfrac{1}{2\theta_2}, & \theta_1-\theta_2 < x < \theta_1+\theta_2 \\ 0, & \text{其他} \end{cases}
> $$
>
> 其中 $-\infty<\theta_1<\infty$，$0<\theta_2<\infty$。设 $Y_1<Y_2<\dots<Y_n$ 是次序统计量。求证：$Y_1$ 与 $Y_n$ 关于 $\theta_1$ 与 $\theta_2$ 是联合充分统计量。

> [!IMPORTANT]
>
> 必考。

**解：**

样本 $X_1, X_2, \dots, X_n$ 的联合概率密度函数为：

$$
f(x_1,\dots,x_n;\theta_1,\theta_2) = \prod_{i=1}^{n} \frac{1}{2\theta_2} \cdot I(\theta_1-\theta_2 < x_i < \theta_1+\theta_2)
$$

其中 $I(\cdot)$ 为示性函数。所有示性函数同时成立的条件等价于：

$$
\theta_1 - \theta_2 < \min_{1 \le i \le n} x_i \quad \text{且} \quad \max_{1 \le i \le n} x_i < \theta_1 + \theta_2
$$

因此，联合密度函数可改写为：

$$
f(x_1,\dots,x_n;\theta_1,\theta_2) = \frac{1}{(2\theta_2)^n} \cdot I(Y_1 > \theta_1 - \theta_2) \cdot I(Y_n < \theta_1 + \theta_2)
$$

其中 $Y_1 = \min_i X_i$，$Y_n = \max_i X_i$。

令 $g(Y_1, Y_n; \theta_1, \theta_2) = \dfrac{1}{(2\theta_2)^n} \cdot I(Y_1 > \theta_1 - \theta_2) \cdot I(Y_n < \theta_1 + \theta_2)$，$h(x_1,\dots,x_n) = 1$。

则联合密度满足分解：

$$
f(x_1,\dots,x_n;\theta_1,\theta_2) = g(Y_1, Y_n; \theta_1, \theta_2) \cdot h(x_1,\dots,x_n)
$$

根据**因子分解定理**，$(Y_1, Y_n)$ 是关于 $(\theta_1, \theta_2)$ 的联合充分统计量。

**证毕。**

---

#### 题目 $3$.
>
> 设 $X_1, X_2, \dots, X_n$ 是 $X$ 的随机样本，$X$ 服从 $N(\theta_1, \theta_2)$，$-\infty<\theta_1<\infty$，$0<\theta_2<\infty$。分别求 $\theta_1$ 与 $\theta_2$ 的唯一极小方差无偏估计量。

**解：**

设 $X \sim N(\theta_1, \theta_2)$，其中 $\theta_1$ 为均值，$\theta_2$ 为方差。

> [!NOTE]
>
> $$
> f(x;\theta_1, \theta_2) = \exp\left(-\frac{1}{2\theta_2}x^2 + \frac{\theta_1}{\theta_2}x - \frac{\theta_1^2}{2\theta_2} - \ln \sqrt{2\pi\theta_2}\right)
> $$

正态分布属于指数族，其完备充分统计量为 $\left(\sum_{i=1}^n X_i, \sum_{i=1}^n X_i^2\right)$，等价于 $(\bar{X}, S^2)$，其中：

$$
\bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i, \quad S^2 = \frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2
$$

**对于 $\theta_1$：**

$E(\bar{X}) = \theta_1$，故 $\bar{X}$ 是 $\theta_1$ 的无偏估计，且是完备充分统计量的函数。

**对于 $\theta_2$：**

由于 $\dfrac{(n-1)S^2}{\theta_2} \sim \chi^2(n-1)$，有 $E(S^2) = \theta_2$，故 $S^2$ 是 $\theta_2$ 的无偏估计，且是完备充分统计量的函数。

根据 **Lehmann-Scheffé 定理**，$\theta_1$ 与 $\theta_2$ 的唯一极小方差无偏估计量分别为：

$$
\hat{\theta}_1 = \bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i
$$

$$
\hat{\theta}_2 = S^2 = \frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2
$$

**证毕。**

---

#### 题目 $4$. (公式 $3.5.12$):
>
> 设 $\mathbf{X}$ 服从多元正态分布 $N_k(\boldsymbol{\mu}, \boldsymbol{\Sigma})$，其中 $\boldsymbol{\Sigma}=(\sigma_{ij})$ 是一个 $k \times k$ 正定矩阵，$\boldsymbol{\mu}=(\mu_1, \mu_2, \dots, \mu_k)'$，$\mathbf{X}$ 的 pdf 为：
>
> $$
> f_{\mathbf{X}}(x) = \frac{1}{|\boldsymbol{\Sigma}|^{1/2}(2\pi)^{k/2}} \exp\left\{-\frac{1}{2}(x-\boldsymbol{\mu})'\boldsymbol{\Sigma}^{-1}(x-\boldsymbol{\mu})\right\}, \quad x \in \mathbb{R}^k
> $$
>
> 给出。分别求 $\mu_j$ 和 $\sigma_j^2$ 的极小方差无偏估计量。

**解：**

设 $\mathbf{X}_1, \mathbf{X}_2, \dots, \mathbf{X}_n$ 是来自 $N_k(\boldsymbol{\mu}, \boldsymbol{\Sigma})$ 的随机样本，其中 $\mathbf{X}_i = (X_{i1}, X_{i2}, \dots, X_{ik})'$。

多元正态分布属于指数族，$(\bar{\mathbf{X}}, \mathbf{S})$ 是完备充分统计量，其中：

$$
\bar{\mathbf{X}} = \frac{1}{n}\sum_{i=1}^{n} \mathbf{X}_i, \quad \mathbf{S} = \frac{1}{n-1}\sum_{i=1}^{n}(\mathbf{X}_i - \bar{\mathbf{X}})(\mathbf{X}_i - \bar{\mathbf{X}})'
$$

设 $\mathbf{X}_1, \mathbf{X}_2, \dots, \mathbf{X}_n$ 是来自 $N_k(\boldsymbol{\mu}, \boldsymbol{\Sigma})$ 的独立同分布（i.i.d.）随机样本，其中 $\mathbf{X}_i = (X_{i1}, X_{i2}, \dots, X_{ik})'$。

> [!NOTE]
>
> 多元正态分布 $N_k(\boldsymbol{\mu}, \boldsymbol{\Sigma})$ 的单个样本密度函数为：
>
> $$
> f(\mathbf{x}; \boldsymbol{\mu}, \boldsymbol{\Sigma}) = (2\pi)^{-k/2} |\boldsymbol{\Sigma}|^{-1/2} \exp\left\{ -\frac{1}{2}(\mathbf{x}-\boldsymbol{\mu})'\boldsymbol{\Sigma}^{-1}(\mathbf{x}-\boldsymbol{\mu}) \right\}
> $$
>
> 展开指数部分：
>
> $$
> -\frac{1}{2}(\mathbf{x}-\boldsymbol{\mu})'\boldsymbol{\Sigma}^{-1}(\mathbf{x}-\boldsymbol{\mu}) = -\frac{1}{2}\mathbf{x}'\boldsymbol{\Sigma}^{-1}\mathbf{x} + \boldsymbol{\mu}'\boldsymbol{\Sigma}^{-1}\mathbf{x} - \frac{1}{2}\boldsymbol{\mu}'\boldsymbol{\Sigma}^{-1}\boldsymbol{\mu}
> $$
>
> 利用矩阵迹的性质 $\mathbf{x}'\mathbf{A}\mathbf{x} = \text{tr}(\mathbf{A}\mathbf{x}\mathbf{x}')$，令 $\boldsymbol{\Sigma}^{-1} = \mathbf{V} = (v_{ij})$，则：
>
> * $-\frac{1}{2}\mathbf{x}'\mathbf{V}\mathbf{x} = -\frac{1}{2} \sum_{j=1}^k v_{jj}x_j^2 - \sum_{1 \le j < l \le k} v_{jl}x_j x_l$
> * $\boldsymbol{\mu}'\mathbf{V}\mathbf{x} = \sum_{j=1}^k (\sum_{l=1}^k \mu_l v_{lj}) x_j$
>
> 代入原式，密度函数可表示为：
>
> $$
> f(\mathbf{x}; \boldsymbol{\theta}) = \exp\left\{ \sum_{j=1}^k \eta_j x_j + \sum_{j=1}^k \xi_{jj} x_j^2 + \sum_{j<l} \xi_{jl} x_j x_l + q(\boldsymbol{\mu}, \boldsymbol{\Sigma}) + H(\mathbf{x}) \right\}
> $$
>
> 其中 $H(\mathbf{x}) = 0$，$q(\boldsymbol{\mu}, \boldsymbol{\Sigma}) = -\frac{1}{2}\boldsymbol{\mu}'\boldsymbol{\Sigma}^{-1}\boldsymbol{\mu} - \frac{1}{2}\ln|\boldsymbol{\Sigma}| - \frac{k}{2}\ln(2\pi)$。
>
> 根据你给出的定理，对应的 $K(\mathbf{x})$ 函数族为：
>
> 1. 针对 $\boldsymbol{\mu}'\boldsymbol{\Sigma}^{-1}\mathbf{x}$ 部分：$K_j(\mathbf{x}) = x_j$ （共 $k$ 个）。
> 2. 针对 $-\frac{1}{2}\mathbf{x}'\boldsymbol{\Sigma}^{-1}\mathbf{x}$ 部分：$K_{jl}(\mathbf{x}) = x_j x_l$ （共 $k(k+1)/2$ 个）。
>
> 因此，对于样本量为 $n$ 的随机样本，其**完备充分统计量**向量为：
>
> $$
> \mathbf{Y} = \left( \sum_{i=1}^n X_{i1}, \dots, \sum_{i=1}^n X_{ik}, \sum_{i=1}^n X_{i1}^2, \dots, \sum_{i=1}^n X_{ij}X_{il}, \dots \right)
> $$
>
> 我们要证明的统计量是：
>
> $$
> \bar{\mathbf{X}} = \frac{1}{n} \sum_{i=1}^n \mathbf{X}_i, \quad \mathbf{S} = \frac{1}{n-1} \left( \sum_{i=1}^n \mathbf{X}_i \mathbf{X}_i' - n\bar{\mathbf{X}}\bar{\mathbf{X}}' \right)
> $$
>
> 双射是显然的。

**对于 $\mu_j$：**

样本均值的第 $j$ 个分量为 $\bar{X}_j = \dfrac{1}{n}\sum_{i=1}^{n} X_{ij}$，有 $E(\bar{X}_j) = \mu_j$。

**对于 $\sigma_j^2$（即 $\sigma_{jj}$，第 $j$ 个分量的方差）：**

样本协方差矩阵的第 $(j,j)$ 元素为 $S_{jj} = \dfrac{1}{n-1}\sum_{i=1}^{n}(X_{ij} - \bar{X}_j)^2$，有 $E(S_{jj}) = \sigma_j^2$。

根据 **Lehmann-Scheffé 定理**，$\mu_j$ 和 $\sigma_j^2$ 的极小方差无偏估计量分别为：

$$
\hat{\mu}_j = \bar{X}_j = \frac{1}{n}\sum_{i=1}^{n} X_{ij}
$$

$$
\hat{\sigma}_j^2 = S_{jj} = \frac{1}{n-1}\sum_{i=1}^{n}(X_{ij} - \bar{X}_j)^2
$$

**证毕。**
