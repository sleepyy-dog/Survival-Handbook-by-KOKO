# Week3a

## 郑博引 23339147

> #### **题目 (2025年9月22日数理统计第4讲作业1):**
>
> 设$X$服从伯努利分布，$\theta$为成功概率。$X \in \Omega = \{0, 1\}$，假如$X_1, X_2, \dots, X_n$是$X$的随机样本。其中$\theta$是未知参数。设$\bar{X}$表示样本均值。
>
> ($1$) 用对分算法求$\theta$的$(1-\alpha)100\%$置信区间。
> ($2$) 假定$n=30$，$\bar{x}=0.60$，$\alpha_1=\alpha_2=0.05, \varepsilon=0.001$
> &nbsp;&nbsp;(i) 求$F_{n\bar{X}}(n\bar{X}-;\theta)=1-\alpha_2$在$(0.425, 0.4375)$内的解$\underline{\theta}$;
> &nbsp;&nbsp;(ii) 求$F_{n\bar{X}}(n\bar{X};\bar{\theta})=\alpha_1$在$(0.7, 0.8)$内的解$\bar{\theta}$;
> &nbsp;&nbsp;(iii) 求 $\theta$ 的置信系数至少是 $90\%$置信区间。

**解：**

($1$)
设$Y = n\bar{X} = \sum_{i=1}^{n} X_i$。由于$X_i$是独立同分布的伯努利随机变量$B(1, \theta)$，因此$Y$服从二项分布$B(n, \theta)$。其累积分布函数(CDF)为：
$$
F_Y(y; \theta) = P(Y \le y) = \sum_{j=0}^{y} \binom{n}{j} \theta^j (1-\theta)^{n-j}
$$
构造$\theta$的置信水平为$1-\alpha_1-\alpha_2$的置信区间$(\underline{\theta}, \bar{\theta})$，其端点由下列方程组解出：
$$
\begin{cases}
P_{\underline{\theta}}(Y \ge y_0) = \alpha_2 \\
P_{\bar{\theta}}(Y \le y_0) = \alpha_1
\end{cases}
$$
其中$y_0=n\bar{x}$是观测值。上述方程组等价于：
$$
\begin{cases}
P_{\underline{\theta}}(Y \le y_0-1) = 1-\alpha_2 \\
P_{\bar{\theta}}(Y \le y_0) = \alpha_1
\end{cases}
$$
即：
$$
\begin{cases}
\sum_{j=0}^{n\bar{x}-1} \binom{n}{j} \underline{\theta}^j (1-\underline{\theta})^{n-j} = 1-\alpha_2 \\
\sum_{j=0}^{n\bar{x}} \binom{n}{j} \bar{\theta}^j (1-\bar{\theta})^{n-j} = \alpha_1
\end{cases}
$$
这两个关于$\underline{\theta}$和$\bar{\theta}$的方程通常没有解析解，需要使用数值方法（如对分算法）求解。

($2$)
根据题目所给数据，$n=30$，$\bar{x}=0.60$，因此$n\bar{x} = 30 \times 0.60 = 18$。$\alpha_1=\alpha_2=0.05$。

(i) 求解$\underline{\theta}$：
我们需要求解方程$F_{n\bar{X}}(18-;\underline{\theta}) = F_{n\bar{X}}(17;\underline{\theta}) = 1 - 0.05 = 0.95$。
$$
\sum_{j=0}^{17} \binom{30}{j} \underline{\theta}^j (1-\underline{\theta})^{30-j} = 0.95
$$
使用$MATLAB$求解：
```matlab
% 定义方程
fun = @(theta) binocdf(17, 30, theta) - 0.95;
% 求解
theta_lower = fzero(fun, [0.425, 0.4375]);
disp(theta_lower); % 结果应约为 0.434
```
因此，解为 $\underline{\theta} \approx 0.434$。

(ii) 求解$\bar{\theta}$：
我们需要求解方程$F_{n\bar{X}}(18;\bar{\theta}) = 0.05$。
$$
\sum_{j=0}^{18} \binom{30}{j} \bar{\theta}^j (1-\bar{\theta})^{30-j} = 0.05
$$
同样，使用数值方法在给定区间$(0.7, 0.8)$内求解。
```matlab
% 定义方程
fun = @(theta) binocdf(18, 30, theta) - 0.05;
% 求解
theta_upper = fzero(fun, [0.7, 0.8]);
disp(theta_upper); % 结果应约为 0.750
```
因此，解为 $\bar{\theta} \approx 0.750$。

(iii) 求置信区间：
置信系数为 $1 - \alpha_1 - \alpha_2 = 1 - 0.05 - 0.05 = 0.90$，即$90\%$。
结合(i)和(ii)的结果，$\theta$的置信系数至少是$90\%$的置信区间为：
$$
(\underline{\theta}, \bar{\theta}) \approx (0.434, 0.750)
$$

**证毕。**

---

> #### **题目 (2025年9月22日数理统计第4讲作业2):**
>
> 设$X$是服从泊松分布的随机变量，其均值为$\theta$。假如$X_1, X_2, \dots, X_n$是$X$的随机样本。设$\bar{X}$表示样本均值。
>
> ($1$) 用对分算法求$\theta$的$(1-\alpha)100\%$置信区间。
> ($2$) 假定$n=25$，$\bar{x}=5$，$\alpha_1=\alpha_2=0.05, \varepsilon=0.01$
> &nbsp;&nbsp;(i) 求$F_{n\bar{X}}(n\bar{X}-;\theta)=1-\alpha_2$在$(4, 4.4)$内的解$\underline{\theta}$;
> &nbsp;&nbsp;(ii) 采用括号值 $5.5$ 和 $6$, 求$F_{n\bar{X}}(n\bar{X};\bar{\theta})=\alpha_1$的解$\bar{\theta}$;
> &nbsp;&nbsp;(iii) 求 $\theta$ 的置信系数至少是 $90\%$置信区间。

**解：**

($1$)
设$Y = n\bar{X} = \sum_{i=1}^{n} X_i$。由于$X_i$是独立同分布的泊松分布随机变量$Poisson(\theta)$，根据泊松分布的可加性，$Y$服从泊松分布$Poisson(n\theta)$。其累积分布函数(CDF)为：
$$
F_Y(y; \theta) = P(Y \le y) = \sum_{j=0}^{y} \frac{e^{-n\theta}(n\theta)^j}{j!}
$$
构造$\theta$的置信水平为$1-\alpha_1-\alpha_2$的置信区间$(\underline{\theta}, \bar{\theta})$，其端点由下列方程组解出：
$$
\begin{cases}
F_{n\bar{X}}(n\bar{x}-1; \underline{\theta}) = 1-\alpha_2 \\
F_{n\bar{X}}(n\bar{x}; \bar{\theta}) = \alpha_1
\end{cases}
$$
即：
$$
\begin{cases}
\sum_{j=0}^{n\bar{x}-1} \frac{e^{-n\underline{\theta}}(n\underline{\theta})^j}{j!} = 1-\alpha_2 \\
\sum_{j=0}^{n\bar{x}} \frac{e^{-n\bar{\theta}}(n\bar{\theta})^j}{j!} = \alpha_1
\end{cases}
$$
这两个方程同样需要使用数值方法求解。

($2$)
根据题目所给数据，$n=25$，$\bar{x}=5$，因此$n\bar{x} = 25 \times 5 = 125$。$\alpha_1=\alpha_2=0.05$。

(i) 求解$\underline{\theta}$：
我们需要求解方程$F_{n\bar{X}}(125-1;\underline{\theta}) = F_{n\bar{X}}(124;\underline{\theta}) = 1 - 0.05 = 0.95$。
$$
\sum_{j=0}^{124} \frac{e^{-25\underline{\theta}}(25\underline{\theta})^j}{j!} = 0.95
$$
使用数值方法在给定区间$(4, 4.4)$内求解。
```matlab
% 定义方程
fun = @(theta) poisscdf(124, 25*theta) - 0.95;
% 求解
theta_lower = fzero(fun, [4, 4.4]);
disp(theta_lower); % 结果应约为 4.287
```
因此，解为 $\underline{\theta} \approx 4.287$。

(ii) 求解$\bar{\theta}$：
我们需要求解方程$F_{n\bar{X}}(125;\bar{\theta}) = 0.05$。
$$
\sum_{j=0}^{125} \frac{e^{-25\bar{\theta}}(25\bar{\theta})^j}{j!} = 0.05
$$
使用数值方法在给定区间$(5.5, 6)$内求解。
```matlab
% 定义方程
fun = @(theta) poisscdf(125, 25*theta) - 0.05;
% 求解
theta_upper = fzero(fun, [5.5, 6]);
disp(theta_upper); % 结果应约为 5.8
```
因此，解为 $\bar{\theta} \approx 5.8$。

(iii) 求置信区间：
置信系数为 $1 - \alpha_1 - \alpha_2 = 1 - 0.05 - 0.05 = 0.90$，即$90\%$。
结合(i)和(ii)的结果，$\theta$的置信系数至少是$90\%$的置信区间为：
$$
(\underline{\theta}, \bar{\theta}) \approx (4.287, 5.8)
$$

**证毕。**

> #### **题目 ($2025$年$9$月$22$日数理统计第$4$讲作业$3$):**
>
> $7$. 设 $X$ 与 $Y$ 是两个独立的随机变量。它们分别服从伯努利分布 $b(1, p_1)$ 与 $b(1, p_2)$。设 $X_1, X_2, \dots, X_{100}$ 是来自 $X$ 分布的随机样本，而设 $Y_1, Y_2, \dots, Y_{400}$ 是来自 $Y$ 分布的随机样本。假定两个样本是彼此相互独立的，如果取 $\sum X_i = 30, \sum Y_j=80$。求 $p_1-p_2$ 的大约 $95.4\%$ 置信区间。
>
> *(注：题目中 $y_1=30, y_2=80$ 按惯例理解为样本和 $\sum X_i=30, \sum Y_j=80$)*

**解：**

本题旨在求解两个独立的伯努利分布的参数之差 $p_1 - p_2$ 的置信区间。
样本$1$的容量为 $n_1 = 100$，来自总体 $X \sim b(1, p_1)$。
样本$2$的容量为 $n_2 = 400$，来自总体 $Y \sim b(1, p_2)$。

$p_1$ 和 $p_2$ 的点估计量分别为样本均值 $\hat{p}_1$ 和 $\hat{p}_2$：
$$
\hat{p}_1 = \bar{X} = \frac{1}{n_1}\sum_{i=1}^{n_1} X_i = \frac{30}{100} = 0.3
$$
$$
\hat{p}_2 = \bar{Y} = \frac{1}{n_2}\sum_{j=1}^{n_2} Y_j = \frac{80}{400} = 0.2
$$
由于样本容量 $n_1$ 和 $n_2$ 均较大，根据中心极限定理，$\hat{p}_1 - \hat{p}_2$ 近似服从正态分布：
$$
\hat{p}_1 - \hat{p}_2 \approx N\left(p_1 - p_2, \frac{p_1(1-p_1)}{n_1} + \frac{p_2(1-p_2)}{n_2}\right)
$$
因此，$p_1 - p_2$ 的一个近似置信水平为 $1-\alpha$ 的置信区间为：
$$
(\hat{p}_1 - \hat{p}_2) \pm z_{\alpha/2} \sqrt{\frac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \frac{\hat{p}_2(1-\hat{p}_2)}{n_2}}
$$
题目要求置信水平为 $95.4\%$，即 $1-\alpha = 0.954$。根据正态分布的性质，大约 $95.4\%$ 的概率分布在均值左右两个标准差的范围内，因此对应的临界值 $z_{\alpha/2} \approx 2$。

我们计算差值的点估计：
$$
\hat{p}_1 - \hat{p}_2 = 0.3 - 0.2 = 0.1
$$
计算标准差的估计值：
$$
\sqrt{\frac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \frac{\hat{p}_2(1-\hat{p}_2)}{n_2}} = \sqrt{\frac{0.3(1-0.3)}{100} + \frac{0.2(1-0.2)}{400}}
$$
$$
= \sqrt{\frac{0.21}{100} + \frac{0.16}{400}} = \sqrt{0.0021 + 0.0004} = \sqrt{0.0025} = 0.05
$$
因此，置信区间的边界为：
$$
0.1 \pm 2 \times 0.05 = 0.1 \pm 0.1
$$
所以，$p_1 - p_2$ 的大约 $95.4\%$ 置信区间为 $(0, 0.2)$。

**证毕。**

> [!NOTE]
>
> 核心公式：
> $$
> F_T(T - ; \underline{\theta}) = 1 - \alpha_2, \quad F_T(T; \bar{\theta}) = \alpha_1
> $$
> 这里$T-$的意思是取到比我们T刚好小的一个值。相应的我们置信区间是$(\underline \theta,\bar \theta)$，置信系数为$1-\alpha_1-\alpha_2$。
>
> 具体求解建议使用999，试了一下991还是不行，主要是没有分布功能，就导致函数搞不定。