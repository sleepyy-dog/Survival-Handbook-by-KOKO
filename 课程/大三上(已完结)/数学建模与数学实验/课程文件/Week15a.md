# 统计推断

## 参数估计

在统计中参数估计一般指的是，假定总体的概率分布的类型（如正态分布、指数分布）已知，由样本估计分布的参数（如正态分布的$\mu$和$\sigma$，指数分布的$\lambda$）。

### 点估计

有矩估计，极大似然估计。在确定分布的前提下，使用$x_i$来对$\theta$进行估计。

#### 点估计的评判标准

得到以上点估计的方法是恒定的，我们需要对于估计的方法的准确性做一个估计。

##### 无偏性

待估的总体参数记作$\theta$，从样本$x_1, x_2, \dots, x_n$得到的$\theta$的一个估计量记作$\hat{\theta}$，由于样本的随机性，$\hat{\theta}$也是随机的，如果$\hat{\theta}$的期望$E\hat{\theta} = \theta$，则称$\hat{\theta}$是$\theta$的无偏估计量。

而当

$$
\lim_{n\to \infin}E(\hat{\theta})=\theta
$$

我们称为渐进无偏估计。

##### 有效性

这里我们希望一个统计量$Y$的方差尽可能小（前提是它已经是无偏的了）

所以我们可以有

$$
D\hat{\theta} \geq \frac{1}{nI(\theta)}
$$

在取等时我们称其为有效估计量，但是事实上，有可能不存在取等的情况，此时我们取所有无偏的$\hat{\theta}$中方差最小的为极小方差无偏估计（$MVUE$），而我们求解一般流程时首先计算得到一个充分完备统计量（这一般是利用正则指数族，也可以直接从这两个性质来进行推导）。

正则指数族有：

1. 伯努利分布
2. 二项分布
3. 指数分布
4. 泊松分布
5. 伽马分布

| 分布                                       | 均值 $\mu$     | 充分统计量                              | 均值的 UMVUE                  |
| ------------------------------------------ | -------------- | --------------------------------------- | ----------------------------- |
| **伯努利分布** $\text{Bernoulli}(p)$       | $p$            | $T = \sum X_i$                          | $\bar{X} = T/n$               |
| **二项分布** $\text{Binomial}(m, p)$       | $mp$           | $T = \sum X_i$                          | $\bar{X}$                     |
| **指数分布** $\text{Exp}(\lambda)$         | $1/\lambda$    | $T = \sum X_i$                          | $\bar{X}$                     |
| **泊松分布** $\text{Poisson}(\lambda)$     | $\lambda$      | $T = \sum X_i$                          | $\bar{X}$                     |
| **伽马分布** $\text{Gamma}(\alpha, \beta)$ | $\alpha/\beta$ | $(T_1, T_2) = (\sum X_i, \sum \ln X_i)$ | $\bar{X}$（当 $\alpha$ 已知） |

反例有均匀分布,其充分统计量是$Y_n = \max\{X_1, X_2, \ldots, X_n\}$。

在得到一个充分完备统计量$Z$后，我们需要构造一个函数$g$，来取到$E(g(z))=h(\theta)$，则称$g(z)$为$h(\theta)$的$MVUE$。

以上这个函数的构造事实上是困难的，一个潜在的解决思路是对于$x_1$，我们构造一个$E(\varphi(x_1))=h(\theta)$，此时由于我们有

$$
E(E(\varphi(x_1)|Z=z))=h(\theta)
$$

因此我们有 $g(z)=E(\varphi(x_1)|Z=z)$ 为$MVUE$。

#### 一致性

$\forall \varepsilon > 0$ 满足

$$
\lim_{n \to \infty} P\{|\hat{\theta}_n - \theta| < \varepsilon\} = 1,
$$

则称 $\hat{\theta}_n$ 依概率收敛于 $\theta$ ，这样的$\hat{\theta}_n$称为 $\theta$ 的一致估计量。

## 假设检验的matlab实现

|                     假设检验                      | 原假设与备择假设                                             | 统计量                                                       | 检验规则                                                     | MATLAB命令                                                   |
| :-----------------------------------------------: | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
|        **单个总体均值** ($\sigma^2$ 已知)         | $H_0: \mu = \mu_0$ <br> $H_1: \mu \neq \mu_0$                | $z = \frac{\bar{x} - \mu_0}{\sigma / \sqrt{n}} \sim N(0,1)$  | $\|z\| \leqslant u_{1-\alpha/2}$ <br> 接受 $H_0$ (z检验)     | `h = ztest(x, mu, sigma)` <br> `[h,sig,ci,zval] = ztest(x, mu, sigma, alpha, tail)` |
|        **单个总体均值** ($\sigma^2$ 未知)         | $H_0: \mu = \mu_0$ <br> $H_1: \mu \neq \mu_0$                | $t = \frac{\bar{x} - \mu_0}{s / \sqrt{n}} \sim t(n-1)$       | $\|t\| \leqslant t_{1-\alpha/2}$ <br> 接受 $H_0$ (t检验)     | `h = ttest(x, mu)` <br> `[h, sig, ci] = ttest(x, mu, alpha, tail)` |
|                 **单个总体方差**                  | $H_0: \sigma^2 = \sigma_0^2$ <br> $H_1: \sigma^2 \neq \sigma_0^2$ | $\chi^2 = \frac{(n-1)s^2}{\sigma_0^2} \sim \chi^2(n-1)$      | $\chi^2_{\alpha/2} \leqslant \chi^2 \leqslant \chi^2_{1-\alpha/2}$ <br> 接受 $H_0$ | 无                                                           |
| **两个总体均值** ($\sigma_1^2, \sigma_2^2$ 已知)  | $H_0: \mu_1 = \mu_2$ <br> $H_1: \mu_1 \neq \mu_2$            | $z = \frac{\bar{x} - \bar{y}}{\sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}} \sim N(0,1)$ | $\|z\| \leqslant u_{1-\alpha/2}$ <br> 接受 $H_0$             | 无                                                           |
| **两个总体均值** ($\sigma_1^2 = \sigma_2^2$ 未知) | $H_0: \mu_1 = \mu_2$ <br> $H_1: \mu_1 \neq \mu_2$            | $t = \frac{\bar{x} - \bar{y}}{\sqrt{\frac{s^2}{n_1} + \frac{s^2}{n_2}}} \sim t(n_1+n_2-2)$ <br> $s^2 = \frac{(n_1-1)s_1^2 + (n_2-1)s_2^2}{n_1+n_2-2}$ | $\|t\| \leqslant t_{1-\alpha/2}$ <br> 接受 $H_0$             | `h = ttest2(x, y)` <br> `[h,sig,ci] = ttest2(x, y, alpha, tail)` |
|                 **两个总体方差**                  | $H_0: \sigma_1^2 = \sigma_2^2$ <br> $H_1: \sigma_1^2 \neq \sigma_2^2$ | $F = \frac{s_1^2}{s_2^2} \sim F(n_1-1, n_2-1)$ <br> $(s_1^2 \geqslant s_2^2)$ | $F \leqslant F_{1-\alpha/2}$ <br> 接受 $H_0$                 | 无                                                           |
|                **0-1分布总体均值**                | $H_0: p = p_0$ <br> $H_1: p \neq p_0$                        | $z = \frac{\bar{x} - p_0}{\sqrt{p_0(1-p_0)/n}}$              | $\|z\| \leqslant u_{1-\alpha/2}$ <br> 接受 $H_0$             | 无                                                           |
|                **总体分布正态性**                 | $H_0$: 总体服从 $N(\mu, \sigma^2)$                           | 略                                                           | 略                                                           | `h = jbtest(x)` <br> `[h,p,jbstat,cv] = jbtest(x, alpha)`    |
|                **总体分布正态性**                 | $H_0$: 总体服从 $N(0, 1)$                                    | 略                                                           | 略                                                           | `h = kstest(x)`                                              |
|                **总体分布正态性**                 | $H_0$: 总体服从 $N(\mu, \sigma^2)$                           | 略                                                           | 略                                                           | `h = lillietest(x)` <br> `[h,p,lstat,cv] = lillietest(x, alpha)` |
