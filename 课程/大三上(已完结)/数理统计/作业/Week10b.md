# 第十七讲

## 郑博引23339147

> #### 1.
>
> 1. (指数分布的似然比检验)设$X_1, X_2, \dots, X_n$是$iid$的，对于$x, \theta > 0$，具有$pdf$ $f(x; \theta) = \theta^{-1}\exp\{-x/\theta\}$。
> 双侧假设$H_0: \theta = \theta_0$ $vs$ $H_1: \theta \neq \theta_0$。对假设给出似然比检验。

###### 解：

首先计算最大似然估计：

做一个对数化，再求解$l'(\theta)=0$来得到。

指数分布 $E(1/\theta)$ 的概率密度函数为：

$$
f(x; \theta) = \frac{1}{\theta} e^{-x/\theta}, \quad x > 0
$$

样本 $X_1, \dots, X_n$ 的似然函数为：

$$
L(\theta) = \prod_{i=1}^{n} f(x_i; \theta) = \prod_{i=1}^{n} \frac{1}{\theta} e^{-x_i/\theta} = \frac{1}{\theta^n} e^{-\frac{1}{\theta}\sum_{i=1}^{n}x_i}
$$

取对数似然函数：

$$
\ln L(\theta) = -n \ln \theta - \frac{1}{\theta}\sum_{i=1}^{n}x_i
$$

对 $\theta$ 求导并令其为 $0$：

$$
\frac{d \ln L(\theta)}{d\theta} = -\frac{n}{\theta} + \frac{1}{\theta^2}\sum_{i=1}^{n}x_i = 0
$$

解得：

$$
\theta = \frac{1}{n}\sum_{i=1}^{n}x_i = \bar{x}
$$

因此，$\theta$ 的极大似然估计量为 $\hat{\theta} = \bar{X}$。

此时我们有似然比检验：

$$
\Lambda = \frac{L(\theta_0)}{L(\hat{\theta_0})}=\frac{\frac{1}{\theta_0^n} e^{-\frac{1}{\theta_0}\sum_{i=1}^{n}x_i}}{\frac{1}{\bar{X}^n} e^{-n}}=
e^n \left(\frac{\overline{X}}{\theta_0}\right)^n \exp\left\{-n\overline{X}/\theta_0\right\}
$$

决策规则是，当$\Lambda \le c$，则拒绝$H_0$。注意到

$$
g(t) = t^n \exp\{-nt\}, \quad t>0
$$

在 $t=1$ 处导数为0，且先增后减。

$g(t) \le c\theta^{-n}$当且仅当$t \le c_1$或$t \ge c_2$（设$c_1,c_2$是$g(t)=c\theta^{-n}$的两个解），即：

$$
\frac{\bar{X}}{\theta_0} \le c_1 \text{或} \frac{\bar{X}}{\theta_0} \ge c_2时取备择假设
$$

**证毕。**

> #### 2.
>
> 2. (正态$pdf$均值的似然比检验)设$X_1, X_2, \ldots, X_n$是来自分布$N(\theta, \sigma^2)$的随机样本，其中$-\infty < \theta < \infty, \sigma^2 > 0$，已知$\sigma^2, \theta_0$是设定的。对下面的双侧假设
>
> $$
> H_0: \theta = \theta_0 \quad \text{vs} \quad H_1: \theta \neq \theta_0
> \label{eq:hypothesis}
> $$
>
> 给出似然比检验。

###### 解：

这里首先计算最大似然估计：

正态分布 $N(\mu, \sigma^2)$ 的概率密度函数为：

$$
f(x; \mu, \sigma^2) = \frac{1}{\sqrt{2\pi}\sigma} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
$$

似然函数为：

$$
L(\mu, \sigma^2) = \prod_{i=1}^{n} \frac{1}{\sqrt{2\pi}\sigma} e^{-\frac{(x_i-\mu)^2}{2\sigma^2}} = (2\pi\sigma^2)^{-n/2} e^{-\frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i-\mu)^2}
$$

对数似然函数为：

$$
\ln L(\mu, \sigma^2) = -\frac{n}{2}\ln(2\pi) - \frac{n}{2}\ln(\sigma^2) - \frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i-\mu)^2
$$

对 $\mu$ 求偏导并令其为 $0$：

$$
\frac{\partial \ln L}{\partial \mu} = - \frac{1}{2\sigma^2} \sum_{i=1}^{n} 2(x_i-\mu)(-1) = \frac{1}{\sigma^2}\sum_{i=1}^{n}(x_i-\mu) = 0 \implies \sum_{i=1}^{n}x_i - n\mu = 0
$$

解得 $\mu$ 的极大似然估计量为 $\hat{\mu} = \bar{X}$。

则知

$$
\Lambda = \frac{L(\theta_0)}{L(\hat{\theta})} = \exp\{-(2\sigma^2)^{-1}n(\bar{X}-\theta_0)^2\}
$$

$$
-2\log \Lambda = \left(\frac{\overline{X} - \theta_0}{\sigma/\sqrt{n}}\right)^2
$$

它在$H_0$为真的条件下服从$\chi^2(1)$分布。

具有显著水平$\alpha$的似然比检验表明，当

$$
-2\log \Lambda = \left(\frac{\overline{X} - \theta_0}{\sigma/\sqrt{n}}\right)^2 \geq \chi_a^2(1)
$$

选择备择假设。

**证毕。**

> #### 3.
>
> 3. 假定具有与定理6.2.2中一样的正则条件[假定$X_1, X_2, \dots, X_n$是$iid$的，具有$pdf$ $f(x; \theta)$，对于$\theta_0 \in \Omega$，满足正则条件$(R0) \sim (R5)$]，在零假设$H_0: \theta = \theta_0$为真的条件下，
>
> $$
> -2\log \Lambda \to \chi^2(1)
> $$

**解：**

证：把函数$l(\theta)$在点$\theta_0$附近展开成一阶泰勒级数，并在似然估计量$\hat{\theta}$处计算它的值，得到

$$
l(\hat{\theta}) = l(\theta_0) + (\hat{\theta} - \theta_0)l'(\theta_0) + \frac{1}{2}(\hat{\theta} - \theta_0)^2 l''(\theta_0^*)
\label{eq:6.3.8}
$$

其中$\theta_0^*$位于$\hat{\theta}$与$\theta_0$之间。由于$\hat{\theta}$依概率收敛于$\theta_0$，即$\hat{\theta} \to \theta_0$，由此可得$\theta_0^*$依概率收敛于$\theta_0$，即$\theta_0^* \to \theta_0$。由于函数$l''(\theta)$是连续的，可以有

$$
-\frac{1}{n}l''(\theta_0^*) \xrightarrow{P} I(\theta_0)
\label{eq:6.3.9}
$$

得出

$$
\frac{1}{\sqrt{n}}l'(\theta_0) = \sqrt{n}(\hat{\theta} - \theta_0)I(\theta_0) + R_n
\label{eq:6.3.10}
$$

其中$R_n$依概率收敛于$0$，即$R_n \to 0$。如果把式$\ref{eq:6.3.9}$与式$\ref{eq:6.3.10}$代入到表达式$\ref{eq:6.3.8}$，同时进行一些简化，有

$$
-2\log \Lambda = 2(l(\hat{\theta}) - l(\theta_0)) = \{\sqrt{n}I(\theta_0)(\hat{\theta} - \theta_0)\}^2 + R_n^*
\label{eq:6.3.11}
$$

其中$R_n^*$依概率收敛于$0$，即$R_n^* \to 0$。由定理$5.2.4$以及定理$6.2.2$知，上面式子右边第一项依分布收敛于自由度为$1$的$\chi^2$分布。

**证毕。**

> [!NOTE]
>
> 证明没讲应该不考。

> #### 4.
>
> 4. 设假定$X_1, X_2, \dots, X_n$是随机样本，具有共同贝塔$(0,1)$ $pdf$
>
> $$
> f(x; \theta) =
> \begin{cases}
> \theta x^{\theta-1}, & \text{对于} 0 < x < 1, \theta > 0 \\
> 0, & \text{其他}
> \end{cases}
> $$
>
> 对于假设$H_0: \theta=1$ $vs$ $H_1: \theta \neq 1$用三种检验统计量进行假设检验。

###### 解：

似然比检验见第一题。

注意此时我们有

$$
\hat{\theta} = \bar{X}
$$

同时$\theta_0=1$。

> [!NOTE]
>
> * 沃尔德检验：
>
> 令
>
> $$
> \chi_W^2 = \left\{ \sqrt{nI(\hat{\theta})}(\hat{\theta} - \theta_0) \right\}^2
> $$
>
> 有决策规则：当$\chi_w^2 \ge \chi_a^2(1)$，拒绝$H_0$，接受$H_1$。
>
> * 拉奥得分检验：
>
> 令
>
> $$
> \chi_R^2 = \left( \frac{\sum_{i=1}^{n} \frac{\partial \log f(X_i; \theta_0)}{\partial \theta}}{\sqrt{nI(\theta_0)}} \right)^2
> $$
>
> 有决策规则：当$\chi_R^2 \ge \chi_\alpha^2(1)$，拒绝$H_0$，接受$H_1$。

此时我们有$\ln f(x,\theta)=\ln \theta+(\theta-1)\ln{x}$，则知$\frac{\partial \ln f(x,\theta)}{\partial \theta}=\frac{1}{\theta}+\ln x$，$\frac{\partial^2 \ln f(x,\theta)}{\partial \theta^2}=-\frac{1}{\theta^2}$则知

$$
I(\theta)=\frac{1}{\theta^2}
$$

此时我们进行沃尔德检验：

$$
\chi_W^2 = \left\{ \sqrt{\frac{n}{\bar{X}^2}}(\bar{X} - 1) \right\}^2
$$

此时我们有决策规则：当$\chi_w^2 \ge \chi_a^2(1)$，拒绝$H_0$，接受$H_1$。

我们进行拉奥得分检验：

$$
\chi_R^2 = \left( \frac{\sum_{i=1}^{n}\frac{1}{\theta_0}+\ln x_i }{\sqrt{\frac{n}{\theta_0^2}}} \right)^2\\
= \left( \frac{n+\ln\prod_{i=1}^{n} x_i }{\sqrt{n}} \right)^2
$$

我们有决策规则：当$\chi_R^2 \ge \chi_\alpha^2(1)$，拒绝$H_0$，接受$H_1$。

**证毕。**


> #### 5.
>
> 5. (拉普拉斯位置模型的似然检验)考察位置模型
>
> $$
> X_i = \theta + e_i, \quad i=1,2,\dots,n
> $$
>
> 其中$-\infty < x < \infty$，随机误差$e_i$是$iid$的，具有拉普拉斯$pdf(2.2.1)$
>
> $$
> f(z) = \frac{1}{2}e^{-|z|}, \quad -\infty < z < +\infty, \quad -\infty < \theta < +\infty.
> $$
>
> 对于假设$H_0: \theta = \theta_0$ $vs$ $H_1: \theta \neq \theta_0$，用三种检验统计量进行假设检验。其中$\theta_0$是设定的。

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

因此，$\hat{\theta}=Q_2$是拉普拉斯$pdf$中$\theta$的极大似然估计量。

此时我们有

$$
\frac{\partial \ln f(x,\theta)}{\partial \theta}=1
$$

同时

$$
I(\theta) = \int_{-\infty}^{\infty} \left(\frac{f'(x-\theta)}{f(x-\theta)}\right)^2 f(x-\theta)dx = \int_{-\infty}^{\infty} \left(\frac{f'(z)}{f(z)}\right)^2 f(z)dz=1
\label{6.2.8}
$$

此时似然比检验有：

$$
\Lambda=\frac{L(\theta_0)}{Q_2}=\frac{e^{-n\log 2 - \sum_{i=1}^{n} |x_i - \theta_0|}}{e^{-n\log 2 - \sum_{i=1}^{n} |x_i -Q_2|}}
$$

则知

$$
-2\log \Lambda = 2\left[\sum_{i=1}^{n} |x_i - \theta_0| - \sum_{i=1}^{n} |x_i - Q_2|\right]
$$

因而，如果

$$
2\left[\sum_{i=1}^{n} |x_i - \theta_0| - \sum_{i=1}^{n} |x_i - Q_2|\right] \ge \chi^2_{\alpha}(1)
$$

那么$a$水平上的渐近似然比检验拒绝$H_0$，接受$H_1$。

沃尔德检验有：

$$
\chi_W^2 = \left\{ \sqrt{n}(Q_2 - \theta_0) \right\}^2
$$

此时我们有决策规则：当$\chi_w^2 \ge \chi_a^2(1)$，拒绝$H_0$，接受$H_1$。

得分检验有：

$$
\chi_R^2 = \frac{（\sum_{i=1}^{n} \text{sgn}(X_i - \theta_0))^2}{n}
$$

我们有决策规则：当$\chi_R^2 \ge \chi_\alpha^2(1)$，拒绝$H_0$，接受$H_1$。

**证毕。**
