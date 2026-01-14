# 第十一讲

---

## 郑博引 23339147

> #### 1.
>
> 设$\{X_n\}$是$iid$随机变量序列，具有共同均值$\mu$与方差$\sigma^2<\infty$。
>
> 求证：$\overline{X_n} \xrightarrow{P} \mu$

**解：**

> [!NOTE]
>
> 注意我们有切比雪夫不等式：
>
> 设 $X$ 是一个随机变量，其期望值为 $E(X) = \mu$，方差为 $D(X) = \sigma^2$（方差存在且有限）。对于任意正数 $\epsilon > 0$，切比雪夫不等式表示：
>
> $$
> P(|X - \mu| \ge \epsilon) \le \frac{\sigma^2}{\epsilon^2}
> $$

则注意此时$E(\bar{X_n})=\mu$,而对于方差，我们由$D(\sum_{i=1}^nX_i)=n\sigma^2$，则知$D(\bar{X_n})=\frac{\sigma^2}{n}$。

进而我们由切比雪夫不等式得到：
$$
P(|\bar{X_n} - \mu| \ge \epsilon) \le \frac{\sigma^2}{n\epsilon^2}
$$
则知：
$$
0\le\lim_{n\to \infin}P(|\bar{X_n} - \mu| \ge \epsilon)\le\lim_{n\to \infin}\frac{\sigma^2}{n\epsilon^2}=0
$$
则知$\lim_{n\to \infin}P(|\bar{X_n} - \mu| \ge \epsilon)=0$。

**证毕。**

> #### 2.
>
> 假定 $X_n \xrightarrow{P} X$ 与 $Y_n \xrightarrow{P} Y$. 
>
> 求证: $X_n+Y_n \xrightarrow{P} X+Y$.

**解：**

首先我们有
$$
\lim_{n \to \infty} P[|Y_n - Y| \ge \varepsilon/2] = 0
$$

$$
\lim_{n \to \infty} P[|X_n - X| \ge \varepsilon/2] = 0
$$

注意到事件有以下包含关系：
$$
\{|X_n+Y_n -X- Y| \ge \varepsilon\}\subseteq\{|X_n-X| \ge \frac{\varepsilon}{2}\}\cup\{|Y_n-Y| \ge \frac{\varepsilon}{2}\}
$$
从而我们有
$$
P\{|X_n+Y_n -X- Y| \ge \varepsilon\}\le P\{|X_n-X| \ge \frac{\varepsilon}{2}\}+P\{|Y_n-Y| \ge \frac{\varepsilon}{2}\}
$$
此时取$n\to \infin$则知$\lim_{n\to\infin}P\{|X_n+Y_n -X- Y| \ge \varepsilon\}=0$。

**得证。**

> #### 3.
>
> 假定 $X_n \xrightarrow{P} X$ 并且 $a$ 是一个常数。
>
> 求证：$aX_n \xrightarrow{P} aX$。

**解：**

当$a=0$时结果是显然的。

接着讨论$a\neq 0$。

此时注意到我们有
$$
\lim_{n \to \infty} P[|X_n - X| \ge \frac{\varepsilon}{|a|}] = 0
$$
则知
$$
\lim_{n \to \infty} P[|aX_n - aX| \ge \varepsilon] = 0
$$
**证毕。**

> #### 4.
>
> 假定$X_n \xrightarrow{P} a$并且实函数$g$在点$a$是连续的。
>
> 求证：$g(X_n) \xrightarrow{P} g(a)$。

**解：**

由 $g$ 在 $a$ 连续，任意给定 $\varepsilon>0$，存在 $\delta>0$，使得当 $|x-a|<\delta$ 时有 $|g(x)-g(a)|<\varepsilon$。于是对任意 $n$，
$$
\mathbb{P}\!\left(|g(X_n)-g(a)|\ge \varepsilon\right)
\le \mathbb{P}\!\left(|X_n-a|\ge \delta\right)\xrightarrow[]{n\to\infty}0,
$$
即 $g(X_n)\xrightarrow{P} g(a)$。

> #### 5.
>
> 假定 $X_n \xrightarrow{P} X$ 并且 $Y_n \xrightarrow{P} Y$. 
>
> 求证: $X_n Y_n \xrightarrow{P} XY$.

**解：**

已知 $X_n\xrightarrow{P}X,\ Y_n\xrightarrow{P}Y$，由题 $2$ 知 $X_n+Y_n\xrightarrow{P}X+Y$。由题 $4$ 的一般化与 $x\mapsto x^2$ 的连续性知 $X_n^2\xrightarrow{P}X^2,\ Y_n^2\xrightarrow{P}Y^2$。于是
$$
X_nY_n=\frac{(X_n+Y_n)^2-X_n^2-Y_n^2}{2}\xrightarrow{P}\frac{(X+Y)^2-X^2-Y^2}{2}=XY.
$$
注：取负号是显然的，所以对于减法的推广也是适用的。

**证毕。**

> #### 6.
>
> 设$X_1, X_2, \dots, X_n$是来自具有有限均值$\mu$与方差$\sigma^2$分布的随机样本。
>
> 求证：样本标准方差$S_n$是$\sigma$的无偏估计和一致估计量。
>
> 这里标准方差就是方差$S^2_n$，不要和标准差$S_n$混淆。

**解：**

先证明为无偏估计。

我们需要证明 $\mathbf{E(S^2) = DX}$。
$$
E(S^2) = E\left[\frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = \frac{1}{n-1}E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right]
$$
对求和项进行展开：
$$
\sum_{i=1}^{n}(X_i - \bar{X})^2 = \sum_{i=1}^{n}X_i^2 - 2\bar{X}\sum_{i=1}^{n}X_i + n\bar{X}^2 = \sum_{i=1}^{n}X_i^2 - n\bar{X}^2
$$
其期望为：
$$
E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = E\left[\sum_{i=1}^{n}X_i^2 - n\bar{X}^2\right] = \sum_{i=1}^{n}E(X_i^2) - nE(\bar{X}^2)
$$
我们有 $E(X_i^2) = DX_i + (EX_i)^2 = DX + (EX)^2$ 和 $E(\bar{X}^2) = D(\bar{X}) + (E(\bar{X}))^2 = \frac{DX}{n} + (EX)^2$。
代入上式：
$$
E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = n(DX + (EX)^2) - n\left(\frac{DX}{n} + (EX)^2\right) = nDX - DX = (n-1)DX
$$
因此，
$$
E(S^2) = \frac{1}{n-1} (n-1)DX = DX
$$
所以，$S^2$ 是 $DX$ 的无偏估计。

接着我们证明一致估计量：

本讲第一题已经证明，$\bar{X}_n \xrightarrow{P} \mu$。利用前面的结果，可以证明
$$
S_n^2 = \frac{1}{n-1}\sum_{i=1}^n (X_i - \bar{X}_n)^2 = \frac{n}{n-1}\left(\frac{1}{n}\sum_{i=1}^n X_i^2 - \bar{X}_n^2\right) \xrightarrow{P} 1 \cdot [E(X_1^2) - \mu^2] = \sigma^2
$$
注：这里用到了$E[X_i^2]=D(x)+E^2(x)<\infty$，则我们立即可以得到$\frac{1}{n}\sum X_i^2\xrightarrow{P}E(X_1^2)$。

> [!NOTE]
>
> 注意到这里我们还有用到命题：这里我们还需要$slutsky$定理：
>
> **定理 (Slutsky 定理):** 设 $\{X_n\}$ 和 $\{Y_n\}$ 是随机变量序列。
>
> 如果 $X_n \xrightarrow{D} X$ (依分布收敛到随机变量 $X$) 且 $Y_n \xrightarrow{P} c$ (依概率收敛到常数 $c$)，那么：
>
> * $X_n + Y_n \xrightarrow{D} X + c$
> * $X_n Y_n \xrightarrow{D} cX$
> * $X_n / Y_n \xrightarrow{D} X / c$ (如果 $c \neq 0$)

因此，样本方差是$\sigma^2$的一致估计量。我们从前面讨论立刻得出，$S_n \xrightarrow{P} \sigma$，也就是样本标准差是总体标准差的一致估计量。

> #### 7.
>
> 以$X_1, X_2, \dots, X_n$是源自均匀分布$(0, \theta)$的随机样本。假定$\theta$为未知的。
>
> 求证：样本的极大值$Y_n=\max\{X_1, X_2, \dots, X_n\}$是$\theta$的有偏估计和一致估计量。

**解：**

注意我们需要证明$E(Y_n)\ne \theta$。

可以看到$Y_n$的$cdf$是

$$
F_{Y_n}(t) =
\begin{cases}
1, & t > 0 \\
\left(\frac{t}{\theta}\right)^n, & 0 < t \le \theta \\
0, & t \le \theta
\end{cases}
\label{eq:5.1.1}
$$

因此，$Y_n$的$pdf$是

$$
f_{Y_n}(t) =
\begin{cases}
\frac{n}{\theta^n}t^{n-1}, & 0 < t \le \theta \\
0, & 其他
\end{cases}
$$

利用$Y_n$的$pdf$，很容易证明，$E(Y_n)=(n/(n+1))\theta\ne \theta$

我们接着证明为一致估计量。

注意到:
$$
P[|Y_n-\theta|\ge\varepsilon]=P[|Y_n\le \theta-\varepsilon]=\left(\frac{\theta-\varepsilon}{\theta}\right)^n
$$
则知$\lim_{n\to \infin}P(|Y_n - \theta| \ge \epsilon)=0$。

**得证。**
