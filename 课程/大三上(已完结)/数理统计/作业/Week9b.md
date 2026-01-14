# 第十六讲

## 郑博引23339147

> #### 1.
>
> 1.（伯努利随机变量信息）设$X$服从伯努利分布 $b(1,p)$。
> 若$X_1,X_2,...,X_n$是来自$X$的随机样本，(1)求 $p$ 的费希尔信息$I(p)$，并讨论$p$对$I(p)$的影响。(2)计算$X_1 X_2 (1-X_3)$的有效性。(3)求随机样本 $X_1,X_2,...,X_n$ 的费希尔信息。
>
> > [!TIP]
> >
> > 这里（1）的叙述被理解为对于单个观测相应的费希尔信息。

**解：**

首先注意到费歇尔信息表示为：

> [!NOTE]
>
> $$
> I(p) = -\int_{-\infty}^{\infty} \frac{\partial^2 \log f(x; p)}{\partial p^2} f(x; p) dx=
> E\left[\left(\frac{\partial \log f(X; p)}{\partial p}\right)^2\right]
>  = -E\left[\frac{\partial^2 \log f(X; p)}{\partial p^2}\right]= Var\left(\frac{\partial\log f(X;p)}{\partial p}\right)
> $$

（1）

首先计算对数化形式

$$
\log f(x;p) = x\log p + (1-x)\log(1-p)
$$

这里一个更加自然的想法可能是使用 $\log f(x;p) = \log [xp + (1-x)(1-p)]$ ，但是可以注意到这样和我们$x\in\{0,1\}$相违背，我们其实是对于这种离散的情况取了一个新的形式，虽然这可能不如以上思路那么直观，但是我们需要记住的是我们的对数化最终是要对定义域上的概率对数化即可。


$$
\frac{\partial\log f(x;p)}{\partial p} = \frac{x}{p} - \frac{1-x}{1-p}
$$

$$
\frac{\partial^2\log f(x;p)}{\partial p^2} = -\frac{x}{p^2} - \frac{1-x}{(1-p)^2}
$$

很明显，

$$
I(p) = -E\left[\frac{-X}{p^2} - \frac{1-X}{(1-p)^2}\right] = \frac{p}{p^2} + \frac{1-p}{(1-p)^2} = \frac{1}{p} + \frac{1}{1-p} = \frac{1}{p(1-p)}
$$

当p趋近于0或1时$I(p)\to\infin$。

（2）

我们有定理：

> [!NOTE]
>
> 定理$6.2.1$(拉奥-克拉默下界)设$X_1, X_2, \dots, X_n$是$iid$的，对于$\theta \in \Omega$，具有共同$pdf$ $f(x; \theta)$。假设正则条件$(R0) \sim (R4)$成立。设$Y=u(X_1, X_2, \dots, X_n)$是具有均值$E(Y)=E[u(X_1, X_2, \dots, X_n)]=k(\theta)$的统计量，于是(注意到右式分母为n个数据的费希尔信息)，
>
> $$
> \text{Var}(Y) \ge \frac{[k'(\theta)]^2}{nI(\theta)}
> $$

接着有推论：

> [!NOTE]
>
> 推论$6.2.1$在以上伯努利分布的假设下，如果$Y=u(X_1, \dots, X_n)$是$\theta$的无偏估计量，从而，$k(\theta)=\theta$，那么，拉奥-$Cramer$不等式变成
>
> $$
> Var(Y) \ge \frac{1}{nI(\theta)}
> $$

定义：

> [!NOTE]
>
> 定义6.2.1(有效估计量) 设$Y$是参数$\theta$的无偏的点估计量，统计量$Y$称为$\theta$的有效估计量($efficient\ estimator$)当且仅当$Y$的方差达到拉奥-克拉默下界（$CRLB$）。
> 定义6.2.2(有效性) 在积分或者求和符号下，可对参数进行微分情况下，将拉奥-克拉默下界对任何无偏参数估计的实际方差之比称为那个估计量的有效性($efficiency$)即：
>
>$$
>e(\hat{\theta})=\frac{[k'(\theta)]^2}{nI(\theta)Var(u(X_1,\cdots,X_n))},其中k(\theta)=E[u(X_1,\cdots,X_n)]
> $$
>

此时我们有$k(p)=E[u(X_1,\cdots,X_n)]=E[X_1 X_2 (1-X_3)]=E[X_1]E[X_2](1-E[X_3])=p^2(1-p)$。

则知$k'(p)=2p-3p^2$，又注意到我们现在有 $I(p) = \frac{1}{p(1-p)}$，则知道下界为

$$
\frac{[(2p-3p^2)^2p(1-p)}{n}=\frac{p^3(1-p)(2-3p)^2}{n}
$$

而此时我们又有

$$
Var(u(X_1,\cdots,X_n))=Var(X_1X_2(1-X_3))=E(X^2_1X^2_2(1-X_3)^2)-E^2(X_1X_2(1-X_3))\\
=p^2[1-p](1-p^2(1-p))\\
=p^2(1-p)(1-p^2+p^3)
$$

则我们知道：

$$
e(\hat{\theta})=\frac{\dfrac{p^3(1-p)(2-3p)^2}{n}}{p^2(1-p)(1-p^2+p^3)}=\frac{p(2-3p)^2}{n(1-p^2+p^3)}
$$

> [!NOTE]
>
> 注意到事实上这里的$n$可以不等于3。

(3)

此时，

$$
\frac{\partial \log L(\theta, \mathbf{X})}{\partial \theta} = \sum_{i=1}^{n} \frac{\partial \log f(X_i; \theta)}{\partial \theta}
$$

的方差是样本信息。上式中的被加数都是$iid$的，具有共同方差$I(\theta)$。因此，样本信息是

$$
Var\left(\frac{\partial \log L(\theta, \mathbf{X})}{\partial \theta}\right) = nI(\theta)
$$

则知此时的费希尔信息为

$$
\frac{n}{p(1-p)}
$$

> #### 2.
>
> 2. (位置族信息)考察随机变量$X_1, X_2, \dots, X_n$，使得位置模型($location\ model$) $X_i = \theta + e_i$, $i=1,2,\dots,n$.其中$e_1, e_2, \dots, e_n$是$iid$的，$e_i$具有共同$pdf\ f(x)$以及支集$(-\infty, +\infty)$，假定$f(x)$满足正则条件。(1)求证:$X$的费希尔信息$I(\theta)$不依赖于$\theta$。

**解：**

注意到我们有

$$
I(\theta) = \int_{-\infty}^{\infty} \left(\frac{f'(x-\theta)}{f(x-\theta)}\right)^2 f(x-\theta)dx = \int_{-\infty}^{\infty} \left(\frac{f'(z)}{f(z)}\right)^2 f(z)dz
\label{6.2.8}
$$

此时我们知与$\theta$无关。

**证毕。**

> #### 3.
>
> 3. (拉普拉斯分布)设$X_1, X_2, \dots, X_n$是$iid$的，具有密度
>
> $$
> f(x; \theta)=2^{-1}e^{-|x-\theta|}, -\infty < x < +\infty, -\infty < \theta < +\infty.
> $$
>
> 利用位置模型$X_i=\theta+e_i, i=1,2,\dots,n$.
>
> (1)求$X$费希尔信息$I(\theta)$。
>
> (2)求随机样本$X_1, X_2, \dots, X_n$的费希尔信息。

**解：**

(1)

注意到我们可以由第二题知

此时

$$
f(x; \theta)=f(x-\theta)=2^{-1}e^{-|x-\theta|}
$$

我们首先求$f'(x,\theta)$:

$$
f'(x,\theta)=-sgn(x-\theta)2^{-1}e^{-|x-\theta|}
$$

知：

$$
I(\theta) = \int_{-\infty}^{\infty} \left(\frac{f'(x-\theta)}{f(x-\theta)}\right)^2 f(x-\theta)dx = \int_{-\infty}^{\infty} \left(\frac{f'(z)}{f(z)}\right)^2 f(z)dz
\\
=\int_{-\infty}^{\infty} \left(\frac{f'(z)}{f(z)}\right)^2 f(z)dz\\
=2\int_{0}^{\infty} 2^{-1}e^{-z}dz\\
=1
$$

(2)

此时我们知$n$个数据的费歇尔信息为

$$
I=nI(\theta)=n
$$

**得证。**

> #### 4.
>
> 4. (泊松分布($\theta$))设$X_1, X_2, \dots, X_n$表示来自均值为$\theta > 0$泊松分布的随机样本。已经知道，$\overline{X_n}$是$\theta$的似然估计量，求证：$\overline{X_n}$是 $\theta$ 的有效估计量。

**解：**

似然估计的我们已经证明过了，利用对数求导即可。

接着尝试证明有效，只需要证明$CRLB$等于$Var(\overline{X_n})=\frac{D(x)}{n}=\frac{\theta}{n}$。

$CRLB=\frac{(k'(\theta))^2}{nI(\theta)}$,此时$k(\theta)=E(\overline{X_n})=\theta$，则知$k'(\theta)=1$。此时我们又有$f(x,\theta)=e^{-\theta}\frac{\theta^{x}}{x!}$即$\ln f(x,\theta)=-\theta+x\ln\theta-\ln x!$，求导得

$$
\frac{\partial\ln f(x,\theta)}{\partial \theta}=-1+\frac{x}{\theta}
$$

再导：

$$
\frac{\partial^2\ln f(x,\theta)}{\partial \theta^2}=-\frac{x}{\theta^2}
$$

此时知

$$
I(\theta)=-E(\frac{\partial^2\ln f(x,\theta)}{\partial \theta^2})=\frac{\theta}{\theta^2}=\frac{1}{\theta}
$$

代入知

$$
CRLB=\frac{(k'(\theta))^2}{nI(\theta)}=\frac{\theta}{n}=Var(\overline{X_n})
$$

**得证。**

> #### 5.
>
> 5.($\text{Beta}$分布$(0,1)$)设随机样本$X_1, X_2, \dots, X_n$来自具有$pdf$
>
>$$
>f(x; \theta) =
> \begin{cases}
> \theta x^{\theta-1}, & \text{对于} 0 < x < 1, \theta > 0 \\
> 0, & \text{其他}
> \end{cases}
> $$
>
>(1)求证：$\hat{\theta} = \frac{n}{-\sum_{i=1}^{n} \log X_i}$是$\theta$的极大似然估计且是有偏估计量。
>
>(2)验证：$[(n-1)/n]\hat{\theta}$是$\theta$的非有效估计量，但是渐有效估计量。

**解：**

> [!NOTE]
>
> 定义6.2.3 设$X_1, \dots, X_n$是独立同分布的，具有概率密度函数$f(x; \theta)$。假定
>
> $$
> \hat{\theta}_{1n} = \hat{\theta}_{1n}(X_1, \dots, X_n)
> $$
>
> 是$\theta_0$的估计量，使得$\sqrt{n}(\hat{\theta}_{1n} - \theta_0) \xrightarrow{D} N(0, \sigma_{1n}^2)$。于是
>
> (a) $\hat{\theta}_{1n}$的渐近有效性($asymptotically$ $efficiency$)定义成
>
> $$
> e(\hat{\theta}_{1n}) = \frac{1/I(\theta_0)}{\sigma_{\hat{\theta}_{1n}}^2}
> \label{eq:6.2.26}
> $$
>
> (b) 当(a)中的比值为1，称估计量$\hat{\theta}_{1n}$是渐近有效的($asymptotically$ $efficient$)。
>
> (c) 设$\hat{\theta}_{2n}$是另外一个估计量，使得$\sqrt{n}(\hat{\theta}_{2n} - \theta_0) \xrightarrow{D} N(0, \sigma_{\hat{\theta}_{2n}}^2)$。那么，$\hat{\theta}_{1n}$相对于$\hat{\theta}_{2n}$的渐近相对有效性($Asymptotic$ $Relative$ $Efficiency$, $ARE$)是它们各自渐近方差比值的倒数，也就是
>
> $$
> e(\hat{\theta}_{1n}, \hat{\theta}_{2n}) = \frac{\sigma_{\hat{\theta}_{2n}}^2}{\sigma_{\hat{\theta}_{1n}}^2}
> \label{eq:6.2.27}
> $$
>

（1）

其次，求$\theta$似然估计量，并研究它的有效性。似然函数的对数是

$$
l(\theta) = \theta \sum_{i=1}^{n} \log x_i - \sum_{i=1}^{n} \log x_i + n \log \theta
$$

$l(\theta)$的一阶偏导数是

$$
\frac{\partial l(\theta)}{\partial \theta} = \sum_{i=1}^{n} \log x_i + \frac{n}{\theta}
\label{partial_l_theta}
$$

设上式等于$0$，并解出$\theta$，得到似然估计量$\hat{\theta}=-n \sum_{i=1}^{n} \log X_i$。为了得到$\hat{\theta}$的分布，设$Y_i = -\log X_i$。通过直接变换可以证明其分布是$\Gamma(1, 1/\theta)$。

> [!NOTE]
>
> 这里利用
>
> $$
> f_Y(y) = f_X(x(y)) \cdot \left| \frac{dx}{dy} \right|
> $$
>
> 代入：
>
> $$
> f_Y(y) = \theta (e^{-y})^{\theta-1} \cdot e^{-y} = \theta e^{-\theta y + y} \cdot e^{-y} = \theta e^{-\theta y}, \quad y > 0
> $$

因为各个$X_i$是独立的，由定理$3.3.2$可证明，$W = \sum_{i=1}^{n} Y_i$服从$\Gamma(n, 1/\theta)$。

由定理$3.3.1$可证明，对于$k>-n$，

$$
E[W^k] = \frac{(n+k-1)!}{\theta^k (n-1)!}
\label{E_W_k}
$$

> [!NOTE]
>
> 设随机变量 $W$ 服从参数为 $\alpha$ 和 $\beta$ 的伽马分布，即 $W \sim \Gamma(\alpha, \beta)$，其概率密度函数为：
>
> $$
> f(w) = \frac{1}{\Gamma(\alpha)\beta^\alpha} w^{\alpha-1} e^{-w/\beta}, \quad w > 0
> $$
>
> 则对于任何使得 $\alpha + k > 0$ 的实数 $k$，其 $k$ 阶矩为：
>
> $$
> E[W^k] = \frac{\beta^k \Gamma(\alpha + k)}{\Gamma(\alpha)}
> $$

因此，特别地，对于$k=-1$，得出

$$
E[\hat{\theta}] = nE[W^{-1}] = \theta \frac{n}{n-1}
$$

因而，$\hat{\theta}$是有偏的。

(2)

$f$的对数的导数为

$$
\frac{\partial \log f}{\partial \theta} = \log x + \frac{1}{\theta}
\label{partial_log_f}
$$

由此，得出$\partial^2 \log f / \partial \theta^2 = -\theta^{-2}$。因此，信息是$I(\theta)=\theta^{-2}$。

对于$k=-2$，我们得到

$$
E[\hat{\theta}^2] = n^2 E[W^{-2}] = \theta^2 \frac{n^2}{(n-1)(n-2)}
$$

对$E(\hat{\theta}^2) - [E(\hat{\theta})]^2$进行简化后，可得出

$$
Var(\hat{\theta}) = \theta^2 \frac{n^2}{(n-1)^2(n-2)}
$$

由此，可以获得无偏估计量$[(n-1)/n]\hat{\theta}$的方差，也就是

$$
Var\left(\frac{n-1}{n}\hat{\theta}\right) = \frac{\theta^2}{n-2}
$$

由上述内容，信息是$I(\theta)=\theta^{-2}$，因此，有效无偏估计量的方差是$\theta^2/n$。由于$\frac{\theta^2}{n-2} > \frac{\theta^2}{n}$，所以无偏估计量$[(n-1)/n]\hat{\theta}$是非有效的。

同时我们又有

$$
\lim_{n \to \infty} \frac{\text{CRLB}}{\text{Var}(T_n)} = \lim_{n \to \infty} \frac{\theta^2/n}{\theta^2/(n-2)} = \lim_{n \to \infty} \frac{n-2}{n} = 1
$$

则知为渐进有效的。

> [!NOTE]
>
> 只需判断以上这个量的极限为1则知为渐进有效的。

**证毕。**


> #### 补：
>
> 1. (22') 设 $X_1, \dots, X_n \stackrel{iid}{\sim} B(1,p)$，$g(p) = p^2(1-p)$，$n \ge 4$。
> a. (4') 证明 $X_1X_2(1-X_3)$ 是 $g(p)$ 的无偏估计量。
> b. (8') 计算 $X_1X_2(1-X_3)$ 的有效性 ($efficiency$)。
> c. (10') 给出 $g(p)$ 的一致最小方差无偏估计 ($MVUE$)。

**解：**

（1）

此时我们有$k(p)=E[u(X_1,\cdots,X_n)]=E[X_1 X_2 (1-X_3)]=E[X_1]E[X_2](1-E[X_3])=p^2(1-p)$.

得证。

（2）

注意我们现在有

$$
\ln f(x,p)=x\ln p+(1-x)\ln (1-p)
$$

求导得

$$
\frac{\partial\log f(x;p)}{\partial p} = \frac{x}{p} - \frac{1-x}{1-p}
$$

$$
\frac{\partial^2\log f(x;p)}{\partial p^2} = -\frac{x}{p^2} - \frac{1-x}{(1-p)^2}
$$

很明显，

$$
I(p) = -E\left[\frac{-X}{p^2} - \frac{1-X}{(1-p)^2}\right] = \frac{p}{p^2} + \frac{1-p}{(1-p)^2} = \frac{1}{p} + \frac{1}{1-p} = \frac{1}{p(1-p)}
$$

此时我们有$k(p)=E[u(X_1,\cdots,X_n)]=E[X_1 X_2 (1-X_3)]=E[X_1]E[X_2](1-E[X_3])=p^2(1-p)$。

则知$k'(p)=2p-3p^2$，又注意到我们现在有$I(p) = \frac{1}{p(1-p)}$，则知道下界为

$$
\frac{[(2p-3p^2)^2p(1-p)}{n}=\frac{p^3(1-p)(2-3p)^2}{n}
$$

而此时我们又有

$$
Var(u(X_1,\cdots,X_n))=Var(X_1X_2(1-X_3))=E(X^2_1X^2_2(1-X_3)^2)-E^2(X_1X_2(1-X_3))=p^2[1-p](1-p^2(1-p))\\
=p^2(1-p)(1-p^2+p^3)
$$

则我们知道：

$$
e(\hat{\theta})=\frac{\dfrac{p^3(1-p)(2-3p)^2}{n}}{p^2(1-p)(1-p^2+p^3)}=\frac{p(2-3p)^2}{3(1-p^2+p^3)}
$$

（3）

利用充分完备统计量 $T = \sum X_i$，及 Lehmann-Scheffe 定理：

$$
\hat{g} = E[X_1 X_2 (1-X_3) | T] = \frac{\binom{n-3}{T-2}}{\binom{n}{T}} \quad (2 \le T \le n-1)
$$

> [!NOTE]
>
> 设 $X_1, X_2, \dots, X_n$ 是来自分布族 $\{P_\theta : \theta \in \Theta\}$ 的样本，若：
>
> 1. $T$ 是参数 $\theta$ 的**充分完备统计量**（Sufficient and Complete Statistic）；
> 2. $\hat{g}(X)$ 是待估参数 $g(\theta)$ 的任意一个**无偏估计量**（即 $E[\hat{g}(X)] = g(\theta)$）；
>
> 则：
>
> $$
> \hat{g}^* = E[\hat{g}(X) | T]
> $$
>
> 是 $g(\theta)$ 的**唯一**一致最小方差无偏估计（UMVUE）。

代入化简得：

$$
\hat{g}_{MVUE} = \frac{T(T-1)(n-T)}{n(n-1)(n-2)}
$$

**证毕。**

> #### 期中错题：
>
> 2、设$\{X_n\}$是随机变量序列，使得$\sqrt{n}(X_n-\theta)\overset{D}{\rightarrow}N(0,\sigma^2)$。假定函数$g(x)$在$\theta$处是可微的，且$g'(\theta)\neq 0$。则$\sqrt{n}[g(X_n)-g(\theta)]\overset{D}{\rightarrow}$ $\underline{\hspace{4cm}}$
> 设$n=25, X_n-\theta\overset{D}{\rightarrow}N(0,\frac{3}{5})$，$g(x)=x^2$，则$5(X_n^2-\theta^2)\overset{D}{\rightarrow}$ $\underline{\hspace{4cm}}$

**解：**

$N(0, \sigma^2 (g'(\theta))^2)$和$N(0, 60\theta^2)$

因为$X_n - \theta \xrightarrow{D} N(0, \frac{3}{5})$，所以

$E(X_n - \theta) = 0$，所以$E[\sqrt{n}(X_n - \theta)] = \sqrt{n}E(X_n - \theta) = 0$。

$\therefore Var(X_n - \theta) = \frac{3}{5}$，$\therefore Var[\sqrt{n}(X_n - \theta)] = nVar(X_n - \theta) = 25 \times \frac{3}{5} = 15$。

$Var[5(X_n^2 - \theta^2)] = 15[g'(\theta)]^2 = 15(2\theta)^2 = 60\theta^2$

**证毕。**

> [!NOTE]
>
> 第二小问忘乘$\sqrt{n}$，属于是背题背傻了。
