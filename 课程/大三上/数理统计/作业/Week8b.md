# Week8b

## 郑博引 23339147

> #### 1.
>
> 1. 设$X_1, X_2, \dots, X_n$是源自$b(1,p)$分布的随机样本。$Y=X_1+\dots+X_n$，求函数$g(Y/n)$，使它的方差本质上不包含$p$。



**解：**

注意到
$$
g(Y/n)=g(p)+g'(p)(Y/n-p)
$$
此时我们可以发现线性关系，同时我们有$D(Y/n)=p(1-p)/n$,则知
$$
g(Y/n)\sim N(g(p),g'^2(p)p(1-p)/n)
$$
此时方差$g'^2(p)p(1-p)/n$不含p等价于
$$
g'(p)=\frac{c}{\sqrt{p(1-p)}}
$$

积分得到
$$
g(x)=\int g'(x)=2c\arcsin{\sqrt{x}}+b
$$
此时取到$c=1/2,b=0$，即$g(x)=\arcsin{\sqrt{x}}$，则知此时我们有
$$
g(Y/n)\sim N(g(x)=(\arcsin{\sqrt{p}},1/4n)
$$
注意此时我们也只是利用泰勒公式近似，并非真的令方差不与p有关，只是在一阶近似意义下方差与 $p$ 无关。

**证毕。**

> #### 2.
>
> 2. (比例的大样本推断)
> 设$X_1, X_2, \dots, X_n$是源自伯努利分布的随机样本。其中$\hat{p}$表示成功的概率。设$p$是样本的成功比例。求证：
>
> $$
> \frac{\sqrt{n}(\hat{p}-p)}{\sqrt{\hat{p}(1-\hat{p})}} \stackrel{D}{\longrightarrow} N(0,1)
> $$

**解：**

> [!NOTE]
>
> 注意到我们有定理：
>
> 5. 设 $X_1, X_2, \dots, X_n$ 表示来自均值 $\mu$ 与方差 $\sigma^2$ 的分布的随机样本观测值，随机变量
>
> $$
> Y_n = \left(\sum_{i=1}^{n} X_i - n\mu\right) / \sigma\sqrt{n} = \sqrt{n}(\bar{X}_n - \mu)/\sigma
> $$
>
> 依分布收敛于服从均值0与方差1的正态分布的随机变量。



此时对于伯努利分布，$E(\bar{X}_n)=\hat{p},D(\bar{X}_n)=\hat{p}(1-\hat{p}),\hat{p}=\frac{\sum_{i=1}^nX_i}{n}=\bar{X}_n$,代入得
$$
\frac{\sqrt{n}(\hat{p}-p)}{\sqrt{p(1-p)}} \stackrel{D}{\longrightarrow} N(0,1)
$$
注意到我们有$\frac{\sqrt{p(1-p)}}{\sqrt{\hat{p}(1-\hat{p})}}$依概率收敛到1，则知我们此时$\frac{\sqrt{p(1-p)}}{\sqrt{\hat{p}(1-\hat{p})}}$依分布收敛到常数1。

> [!NOTE]
>
> 这里我们还需要slutsky定理：
>
> **定理 (Slutsky 定理):** 设 $\{X_n\}$ 和 $\{Y_n\}$ 是随机变量序列。
>
> 如果 $X_n \xrightarrow{D} X$ (依分布收敛到随机变量 $X$) 且 $Y_n \xrightarrow{P} c$ (依概率收敛到常数 $c$)，那么：
>
> * $X_n + Y_n \xrightarrow{D} X + c$
> * $X_n Y_n \xrightarrow{D} cX$
> * $X_n / Y_n \xrightarrow{D} X / c$ (如果 $c \neq 0$)

进而我们有结论：
$$
\frac{\sqrt{n}(\hat{p}-p)}{\sqrt{\hat{p}(1-\hat{p})}}=\frac{\sqrt{p(1-p)}}{\sqrt{\hat{p}(1-\hat{p})}}\cdot \frac{\sqrt{n}(\hat{p}-p)}{\sqrt{p(1-p)}}  \stackrel{D}{\longrightarrow} N(0,1)
$$
**证毕。**

> #### 3.
>
> 3.($\chi^2$检验的大样本推断)设$X_1, X_2, \dots, X_n$是源自$b(1,p)$分布的随机样本。$Y_n=X_1+X_2+\dots+X_n$, 求证：
> $$
> \left[\frac{Y_n-np}{\sqrt{np(1-p)}}\right]^2 \xrightarrow{D} \chi^2(1)
> $$

**解：**

参照上题第一步结论，此时我们有
$$
\frac{Y_n-np}{\sqrt{np(1-p)}}=\frac{\sqrt{n}(\hat{p}-p)}{\sqrt{p(1-p)}} \stackrel{D}{\longrightarrow} N(0,1)
$$

> [!NOTE]
>
> 我们有定理：
>
> 定理$5.2.4$ 假定$X_n$依分布收敛于$X$，同时$g$在$X$的支集上是一个连续函数。于是，$g(X_n)$依分布收敛于$g(X)$。
>

我们取到$g(x)=x^2$，又注意到正态分布变量的平方的分布是卡方分布，则知结论成立。

**得证。**

> #### 4.
>
> 4.设$X_1, X_2, \dots, X_n$是源自$b(1,p)$分布的随机样本。对$t$的所有实值来说，$M(t)$存在，$n=100, p=0.5, Y_n=X_1+X_2+\dots+X_n$，计算$P(Y = 48,49,50,51,52)$。

**解：**

显然的思路就是把这个转为正态分布下的情况，我们转换变量为
$$
\frac{Y_n-np}{\sqrt{np(1-p)}}=\frac{Y_n-50}{\sqrt{25}} \stackrel{D}{\longrightarrow} N(0,1)
$$
此时我们将问题等价于求$P(47.5\le Y_n\le 52.5)$，即
$$
-0.5\le\frac{Y_n-np}{\sqrt{np(1-p)}}\le 0.5
$$
从而知
$$
P(Y = 48,49,50,51,52)\approx 0.383
$$
**证毕。**

> #### 5.
>
> 5. 设 $X_1, X_2, \dots, X_n$ 表示来自均值 $\mu$ 与方差 $\sigma^2$ 的分布的随机样本观测值，求证：随机变量
> $$
> Y_n = \left(\sum_{i=1}^{n} X_i - n\mu\right) / \sigma\sqrt{n} = \sqrt{n}(\bar{X}_n - \mu)/\sigma
> $$
> 依分布收敛于服从均值0与方差1的正态分布的随机变量。

**解：**

证：就这个证明而言，还要假定对于$-h<t<h$， $mgf$ $M(t)=E(e^{tx})$存在。假如用特征函数$\varphi(t)=E(e^{tx})$代替$mgf$，其中特征函数总是存在的，这里的证明本质上和更高等课程中所使用的特征函数的证法是一样。
函数
$$
m(t) = E[e^{t(X-\mu)}] = e^{-\mu t}M(t)
$$
对于$-h<t<h$也是存在的。由于$m(t)$是$X-\mu$的$mgf$，由此必有$m(0)=1$， $m'(0) = E(X-\mu)=0$，以及$m''(0)=E[(X-\mu)^2] = \sigma^2$。由泰勒公式知，在$0$与$t$之间存在一个$\xi$，使得
$$
m(t) = m(0) + m'(0)t + \frac{m''(\xi)t^2}{2} = 1 + \frac{m''(\xi)t^2}{2}
$$
如果上式加上$\sigma^2 t^2/2$且减去它，那么
$$
m(t) = 1 + \frac{\sigma^2 t^2}{2} + \frac{[m''(\xi) - \sigma^2]t^2}{2}
\label{5.3.1}
$$
其次，考察$M(t;n)$，其中
$$
\begin{aligned}
M(t;n) &= E\left[\exp\left(t\frac{\sum X_i - n\mu}{\sigma\sqrt{n}}\right)\right] \\
&= E\left[\exp\left(t\frac{X_1 - \mu}{\sigma\sqrt{n}}\right)\exp\left(t\frac{X_2 - \mu}{\sigma\sqrt{n}}\right)\cdots\exp\left(t\frac{X_n - \mu}{\sigma\sqrt{n}}\right)\right] \\
&= E\left[\exp\left(t\frac{X_1 - \mu}{\sigma\sqrt{n}}\right)\right]\cdots E\left[\exp\left(t\frac{X_n - \mu}{\sigma\sqrt{n}}\right)\right] \\
&= \left\{E\left[\exp\left(t\frac{X - \mu}{\sigma\sqrt{n}}\right)\right]\right\}^n = \left[m\left(\frac{t}{\sigma\sqrt{n}}\right)\right]^n, \quad -h < \frac{t}{\sigma\sqrt{n}} < h
\end{aligned}
$$
在式$\ref{5.3.1}$中用$t/\sigma\sqrt{n}$代替$t$，得出
$$
m\left(\frac{t}{\sigma\sqrt{n}}\right) = 1 + \frac{t^2}{2n} + \frac{[m''(\xi) - \sigma^2]t^2}{2n\sigma^2}
$$
其中现在$\xi$位于$0$与$t/\sigma\sqrt{n}$之间，满足$-h\sigma\sqrt{n}<t<h\sigma\sqrt{n}$，因此
$$
M(t;n) = \left\{1 + \frac{t^2}{2n} + \frac{[m''(\xi) - \sigma^2]t^2}{2n\sigma^2}\right\}^n
$$
由于$m''(t)$在$t=0$处是连续的，并且当$n\to\infty$时$\xi\to 0$，所以有
$$
\lim_{n\to\infty}[m''(\xi) - \sigma^2] = 0
$$
由$5.2.3$节引述的极限命题$(5.2.16)$，可以证明对于所有的$t$的实值，

一致性与极限分布
$$
\lim_{n\to\infty}M(t;n) = e^{t^2/2}
$$
这就证明了随机变量$Y_n=\sqrt{n}(\bar{X}_n-\mu)/\sigma$服从极限标准正态分布。

**证毕。**

> #### 补：
>
> 补例，对某型号飞机的飞行速度进行了15次试验，测得最大飞行速度($m/s$)值为422.2, 417.2, 425.6, 420.3, 425.8, 423.1, 418.7, 428.2, 438.3, 434.0, 412.3, 431.5, 413.5, 441.3, 423.0。根据以往经验，可以认为飞机最大飞行速度服从正态分布$N(\mu, \sigma^2)$。其中$\sigma^2$未知的情形，求$\mu$的95%置信区间的估计。

**解：**

解：步骤1.构造含未知参数$\mu$的
中枢随机变量
$$
T=\frac{\bar{X}-\mu}{S/\sqrt{n}}\sim t(n-1)
$$
步骤2.根据置信区间定义，$1-\alpha=P(-t_{\alpha/2, n-1} < T < t_{\alpha/2, n-1})$
$n=15$，取置信度为$1-\alpha=95\%$，$\alpha=5\%$，
$\therefore P(T\leq t_{\alpha/2, n-1})=1-P(T>t_{\alpha/2, n-1})=1-\alpha/2=0.975$
查书500页$t$分布表$t_{1-\alpha/2, n-1}=t_{0.975,14}=2.145$，从而我们有
$$
-2.145\le \frac{\bar{X}-\mu}{S/\sqrt{n}} \le 2.145
$$
从而进一步得出置信区间为$(417.932, 428.068)$。

**证毕。**

> #### 补：
>
> 四、（本题满分10分）独立地掷$n=120$次骰子，得到下述结果：
>
> |  向上点 $A_i$   |  1   |  2   |  3   |  4   |  5   |   6    |
> | :-------------: | :--: | :--: | :--: | :--: | :--: | :----: |
> | $A_i$频数 $X_i$ | $b$  |  20  |  20  |  20  |  20  | $40-b$ |
>
> 如果使用卡方检验，$b$等于多少时，骰子是无偏的假设会在$2.5\%$显著性水平上遭受拒绝？其中自由度是6，概率为$0.025$的分位点$c \approx 1.237$。自由度是5，概率为$0.975$的分位点$c \approx 12.833$。

**解：**

> [!NOTE]
>
> 费雪定理：
>
> 对于来自正态总体的随机样本，统计量 $\frac{(n-1)S^2}{\sigma^2}$ 服从自由度为 $n-1$ 的卡方分布(这里$n$为样本个数)
>
> $t$分布的定义：
>
> 若随机变量 $Z \sim N(0,1)$，$V \sim \chi^2(\nu)$，且 $Z$ 与 $V$ 相互独立，则 $T = \frac{Z}{\sqrt{V/\nu}} \sim t(\nu)$。

- 原假设为 $H_0:\; p_1=\cdots=p_6=1/6$，期望频数均为 $E_i=n/6=20$。
- 观测频数为 $x_1=b,\; x_2=\cdots=x_5=20,\; x_6=40-b$。
- 皮尔逊卡方统计量
  $$
  \chi^2=\sum_{i=1}^{6}\frac{(x_i-E_i)^2}{E_i}
  =\frac{(b-20)^2}{20}+0+0+0+0+\frac{(40-b-20)^2}{20}
  =\frac{(b-20)^2}{10}.
  $$

> [!NOTE]
>
> 皮尔逊卡方检验统计量的计算公式如下：
>
> $$
> \chi^2 = \sum_{i=1}^{r} \sum_{j=1}^{c} \frac{(O_{ij} - E_{ij})^2}{E_{ij}}
> $$

在 $H_0$ 下，$\chi^2$ 近似服从自由度为 $5$ 的卡方分布。采用上尾拒绝域（卡方拟合优度检验通常只在上尾拒绝），显著性水平为 $2.5\%$ 时的临界值为
$$
\chi^2_{0.975}(5)\approx 12.833.
$$
因此拒绝域为
$$
\frac{(b-20)^2}{10}\ge 12.833
\;\Longleftrightarrow\;
|b-20|\ge \sqrt{10\times 12.833}\approx 11.33.
$$
结合整数性与约束 $0\le b\le 40$，可得
$$
b\in\{0,1,\dots,8\}\;\cup\;\{32,33,\dots,40\}.
$$

注：题干给出的自由度为 $6$、概率为 $0.025$ 的分位点 $c\approx 1.237$ 属于下尾分位点，通常不用于本拟合优度检验的判定。

最终结论：当且仅当 $b\in\{0,1,\dots,8\}\cup\{32,33,\dots,40\}$ 时，在显著性水平 $2.5\%$ 下拒绝“骰子无偏”的原假设。

**证毕。**

