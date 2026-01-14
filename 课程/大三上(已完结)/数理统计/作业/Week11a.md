# 第十八讲

## 郑博引 23339147

#### 1.
>
>1.设随机变量$X \sim N(\mu, \sigma^2)$，$X_1, X_2, \dots, X_n$是来自总体的随机样本，$\theta=(\mu, \sigma^2)'$，而$\Omega$是乘积空间$(-\infty, +\infty) \times (0, +\infty)$。
>
>(1)求证：$\mu$与$\sigma^2$的极大似然估计$\hat{\mu}$与$\hat{\sigma}^2$分别是一致估计值，$\hat{\mu}$是$\mu$的无偏估计，$\hat{\sigma}^2$是$\sigma^2$的有偏估计。
>
>(2)求$X$的信息矩阵$I(\mu, \sigma)$。

**解：**

(1)

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

分别对 $\mu$ 和 $\sigma^2$ 求偏导并令其为 $0$：

$$
\frac{\partial \ln L}{\partial \mu} = - \frac{1}{2\sigma^2} \sum_{i=1}^{n} 2(x_i-\mu)(-1) = \frac{1}{\sigma^2}\sum_{i=1}^{n}(x_i-\mu) = 0 \implies \sum_{i=1}^{n}x_i - n\mu = 0
$$

解得 $\mu$ 的极大似然估计量为 $\hat{\mu} = \bar{X}$。

$$
\frac{\partial \ln L}{\partial (\sigma^2)} = -\frac{n}{2\sigma^2} + \frac{1}{2(\sigma^2)^2}\sum_{i=1}^{n}(x_i-\mu)^2 = 0
$$

将 $\mu = \hat{\mu} = \bar{X}$ 代入上式，解得 $\sigma^2$ 的极大似然估计量为（这里还可以说明一下当$\sigma^2\to \infin或0$或$|\mu|\to \infin$时，我们的对数似然函数是趋于负无穷的，这也就说明我们存在一个最小值，而我们的导数处处存在，则最小值点一定满足以上的这个唯一导数为0点）：

$$
\hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2
$$

判断无偏性：

$1$. 对 $\hat{\mu}$：$E(\hat{\mu}) = E(\bar{X}) = E(X) = \mu$。因此 $\hat{\mu}$ 是**无偏**估计量。

$2$. 对 $\hat{\sigma}^2$：

$$
E(\hat{\sigma}^2) = E\left[\frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = \frac{1}{n} E\left[\sum_{i=1}^{n}((X_i-\mu)-(\bar{X}-\mu))^2\right]
$$

$$
= \frac{1}{n} E\left[\sum(X_i-\mu)^2 - n(\bar{X}-\mu)^2\right] = \frac{1}{n} \left[\sum E(X_i-\mu)^2 - n E(\bar{X}-\mu)^2\right]
$$

因为 $E(X_i-\mu)^2 = D(X) = \sigma^2$ 且 $E(\bar{X}-\mu)^2 = D(\bar{X}) = \sigma^2/n$，所以：

$$
E(\hat{\sigma}^2) = \frac{1}{n}(n\sigma^2 - n\frac{\sigma^2}{n}) = \frac{n-1}{n}\sigma^2
$$

由于 $E(\hat{\sigma}^2) \neq \sigma^2$，因此 $\hat{\sigma}^2$ 是**有偏**估计量。

此时我们再判断是否一致：

注意到我们根据切比雪夫定理，注意此时

$$
P[|u-\bar{u}|\ge \varepsilon]\le\frac{Var(X)}{\varepsilon^2}
$$

此时$\sigma^2 = Var(X)=\frac{\sigma^2}{n}$，当$n\to\infin$时$\frac{Var(X)}{\varepsilon^2}\to 0$。则知$\bar{u}$为一致估计量。

而对于$\hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2$,我们有

$$
\hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2=\frac{1}{n}\sum_{i=1}^{n}X_i^2 - \bar{X}^2
$$

由以上命题和依概率收敛对于连续函数的延扩性，知会依概率收敛到$E(X_1^2)-E(X_1)^2=D(X_1)=\sigma^2$。

**证毕。**

（2）

> [!NOTE]
>
> 首先我们有定义：
>
> $$
> I_{jk} = \text{Cov}\left(\frac{\partial}{\partial\theta_j}\log f(X;\boldsymbol{\theta}), \frac{\partial}{\partial\theta_k}\log f(X;\boldsymbol{\theta})\right); j,k = 1,\dots,p
> $$
>
> 我们还可推导知
>
> $$
> I_{jk} = -E \left[ \frac{\partial^2}{\partial \theta_j \partial \theta_k} \log f(X; \boldsymbol{\theta}) \right]\\
> =\operatorname{E}\Bigg[\,\frac{\partial}{\partial\theta_i}\log L(\theta)\cdot\frac{\partial}{\partial\theta_j}\log L(\theta)\,\Bigg]
> $$
>
> 其中$Cov$定义是
>
> $$
> \operatorname{Cov}(Y,Z) = \mathbb{E}\big[(Y - \mathbb{E}[Y])(Z - \mathbb{E}[Z])\big]
> $$
>
> 也常写成等价形式：
>
> $$
> \operatorname{Cov}(Y,Z) = \mathbb{E}[YZ] - \mathbb{E}[Y]\mathbb{E}[Z]
> $$

此时我们有

$$
\log f(x;\mu,\sigma^2) = -\frac{1}{2}\log 2\pi - \log\sigma - \frac{1}{2\sigma^2}(x-\mu)^2
\label{logf}
$$

它的一阶与二阶偏导数是

$$
\frac{\partial\log f}{\partial\mu} = \frac{1}{\sigma^2}(x-\mu)
$$

$$
\frac{\partial^2\log f}{\partial\mu^2} = -\frac{1}{\sigma^2}
$$

$$
\frac{\partial\log f}{\partial\sigma} = -\frac{1}{\sigma} + \frac{1}{\sigma^3}(x-\mu)^2
$$

$$
\frac{\partial^2\log f}{\partial\sigma^2} = \frac{1}{\sigma^2} - \frac{3}{\sigma^4}(x-\mu)^2
$$

$$
\frac{\partial^2\log f}{\partial\mu\partial\sigma} = -\frac{2}{\sigma^3}(x-\mu)
$$

> [!NOTE]
>
> 这里我们定义了$I(\mu,\sigma)$，所以应该是考虑$\sigma$。

根据对二阶偏导数取期望负值，则正态密度的信息矩阵是

$$
I(\mu,\sigma) = \begin{bmatrix} \frac{1}{\sigma^2} & 0 \\ 0 & \frac{2}{\sigma^2} \end{bmatrix}
\label{I_mu_sigma}
$$

**证毕。**

#### 2.
>
> 2.设随机变量$X_1, X_2, \dots, X_n$是$iid$的，具有共同$pdf$：$f_X(x)=b^{-1}f((x-a)/b)$，满足正则条件，其中$-\infty < x < +\infty$，$(a,b)$位于空间$\Omega=\{(a,b): -\infty < a < +\infty, b > 0\}$之中，
>
> (1)求信息矩阵$I(a,b)$。
>
> (2)求证：当$f$是偶函数时，则信息矩阵$I(a,b)$的非对角元素都为0。

**解：**

（1）

此时有

$$
\ln f_X(x)=-\ln b+\ln f(\frac{x-a}{b})
$$

$$
\frac{\partial\ln f_{X}}{\partial a}=-\frac{f'(\frac{x-a}{b})}{bf(\frac{x-a}{b})}\\
\frac{\partial\ln f_{X}}{\partial b}=-\frac{1}{b}-\frac{(x-a)f'(\frac{x-a}{b})}{b^2f(\frac{x-a}{b})}
$$

我们有

$$
E[(\frac{\partial\ln f_{X}}{\partial a})^2]=\int_{-\infin}^{\infin}\frac{f'^2(\frac{x-a}{b})}{b^2f^2(\frac{x-a}{b})}\frac{1}{b}f(\frac{x-a}{b})dx=\frac{1}{b^2}\int_{-\infin}^{\infin}\frac{f'^2(x)}{f(x)}dx\\
E[(\frac{\partial\ln f_{X}}{\partial b})^2]=\int_{-\infin}^{\infin}(-\frac{1}{b}-\frac{(x-a)f'(\frac{x-a}{b})}{b^2f(\frac{x-a}{b})})^2\frac{1}{b}f(\frac{x-a}{b})dx=\frac{1}{b^2}\int_{-\infin}^{\infin}(1+\frac{xf'(x)}{f(x)})^2f(x)dx\\
E[(\frac{\partial\ln f_{X}}{\partial a})(\frac{\partial\ln f_{X}}{\partial b})]=\int_{-\infin}^{\infin}\frac{f'(\frac{x-a}{b})}{bf(\frac{x-a}{b})}\cdot(\frac{1}{b}+\frac{(x-a)f'(\frac{x-a}{b})}{b^2f(\frac{x-a}{b})})\frac{1}{b}f(\frac{x-a}{b})dx\\
=\frac{1}{b^2}\int_{-\infin}^{\infin}f'(x)+\frac{xf'^2(x)}{f(x)}dx\\
$$

而注意到

即得到下式（注意到$n$个独立同分布的费歇尔信息对应$n$倍）

$$
I_n(a, b) = \frac{n}{b^2} \left( \begin{array}{cc} \int_{-\infty}^{\infty} \frac{f'^2(x)}{f(x)} dx & \int_{-\infty}^{\infty} \left[f'(x) + x \frac{f'^2(x)}{f(x)}\right] dx \\
\int_{-\infty}^{\infty} \left[f'(x) + x \frac{f'^2(x)}{f(x)}\right] dx & \int_{-\infty}^{\infty} \left(1 + x \frac{f'(x)}{f(x)}\right)^2 f(x) dx \end{array} \right)
$$

> [!NOTE]
>
> 以上这个$n$倍在教科书中并没有，关键点在于把这个费歇尔信息理解为的单个观测点还是整个样本。
>
> 以上非对角元素课本上舍弃了$f'(x)$这一项的积分，这需要满足
>
> $$
> \lim_{z \to \pm\infty} f(z) = 0
> $$
>
> 但是这并不是一个对于所有概率密度函数成立的结论。所以还是按照以上解答较为严谨。

（2）

当$f(x)$为偶函数时，$f'(x)$为奇函数，此时知$\frac{f'^2(x)}{f(x)}$为偶函数，则知$f'(x) + x \frac{f'^2(x)}{f(x)}$为奇函数，则知非对角元素为0。

**证毕。**

#### 3.
>
>3.设$X_1, X_2, \dots, X_n$是来自拉普拉斯$pdf$ $f_X(x)=(2b)^{-1}\exp\{-|x-a|/b\}$随机样本，其中$-\infty<x<+\infty$，参数$(a,b)$位于空间$\Omega=\{(a,b): -\infty<a<+\infty, b>0\}$之中。求$a$与$b$的极大似然估计。

**解：**

似然函数的对数是

$$
l(a,b) = -n\log 2 - n\log b - \sum_{i=1}^{n}\left|\frac{x_i - a}{b}\right|
$$

$l(a,b)$关于$a$的偏导数是

$$
\frac{\partial l(a,b)}{\partial a} = \frac{1}{b}\sum_{i=1}^{n}\text{sgn}\left\{\frac{x_i - a}{b}\right\} = \frac{1}{b}\sum_{i=1}^{n}\text{sgn}\{x_i - a\}
$$

其中第二个等式成立是因为$b>0$。令此偏导数等于$0$，得出$a$的极大似然估计量是

$$
Q_2=\text{med}\{X_1, X_2, \dots, X_n\}
$$

因此，$a$的极大似然估计量相对于参数$b$来说是不变量。对$l(a,b)$求关于$b$的偏导数，则得到

$$
\frac{\partial l(a,b)}{\partial b} = -\frac{n}{b} + \frac{1}{b^2}\sum_{i=1}^{n}|x_i - a|
$$

令上式为$0$，联立求解两个偏导数，得出统计量

$$
\hat{b} = \frac{1}{n}\sum_{i=1}^{n}|X_i - Q_2|
$$

作为$b$的极大似然估计量。

**证毕。**

#### 4.
>
> 考察导致 $k$ 个结果或类别之一且仅一个结果的随机试验。设 $X_j$ 是 $1$ 或 $0$，其结果依赖于第 $j$ 个结果发生与否，其中 $j=1,2,\dots,k$。假定第 $j$ 个结果发生的概率是 $p_j$。设 $X=(X_1,X_2,\dots,X_{k-1})'$ 而 $p=(p_1,\dots,p_{k-1})'$，且 $p_1+p_2+\dots+p_k=1$ 。
>
> $({1})$ 求信息矩阵 $I(p)$。
>
> $({2})$ 求证：$p_h$ 的极大似然估计是有效估计，其中 $h=1,2,\dots,k$。
>
> > [!IMPORTANT]
> >
> > 不考。

**解：**

记 $p_k=1-\sum_{j=1}^{k-1}p_j$，且 $X_k=1-\sum_{j=1}^{k-1}X_j$。

（$1$）求 $I(p)$：

单次试验的对数似然为

$$
\ell(p)=\sum_{j=1}^{k-1}X_j\log p_j+X_k\log p_k,\qquad p_k=1-\sum_{j=1}^{k-1}p_j.
$$

对 $r\in\{1,\dots,k-1\}$，得得分函数

$$
\frac{\partial \ell}{\partial p_r}=\frac{X_r}{p_r}-\frac{X_k}{p_k}.
$$

二阶导为

$$
\frac{\partial^2 \ell}{\partial p_r^2}=-\frac{X_r}{p_r^2}-\frac{X_k}{p_k^2},\qquad
\frac{\partial^2 \ell}{\partial p_r\partial p_s}=-\frac{X_k}{p_k^2}\ (r\ne s).
$$

取期望（注意 $E[X_j]=p_j$），单次试验的费舍尔信息矩阵 $I(p)=-E[\nabla^2\ell(p)]$ 的分量为

$$
I_{rr}(p)=\frac{1}{p_r}+\frac{1}{p_k},\qquad
I_{rs}(p)=\frac{1}{p_k}\ (r\ne s),\quad r,s\in\{1,\dots,k-1\}.
$$

即知费舍尔矩阵$I(p)=\operatorname{diag}(p_1,\dots,p_{k-1})-pp^{\top}$:

$$
I(p)=
\begin{pmatrix}
\frac{1}{p_1}+\frac{1}{p_k} & \frac{1}{p_k} & \cdots & \frac{1}{p_k}\\[4pt]
\frac{1}{p_k} & \frac{1}{p_2}+\frac{1}{p_k} & \cdots & \frac{1}{p_k}\\
\vdots & \vdots & \ddots & \vdots\\[4pt]
\frac{1}{p_k} & \frac{1}{p_k} & \cdots & \frac{1}{p_{k-1}}+\frac{1}{p_k}
\end{pmatrix}.
$$

（$2$）

> [!NOTE]
>
> 多参数 Cramér–Rao 不等式是 $\operatorname{Cov}(\hat p)\ \succeq\ I_n(p)^{-1}.$
>
> 这里$\big[\operatorname{Cov}(\hat\theta)\big]_{ij} = \operatorname{Cov}(\hat\theta_i,\hat\theta_j) = E\big[(\hat\theta_i - E\hat\theta_i)(\hat\theta_j - E\hat\theta_j)\big]$。
>
> 如何判定为有效：
>
> 对多维参数$\theta = (\theta_1, \dots, \theta_k)$，如果只关心其中某个分量$\theta_h$，或者某个函数$g(\theta)$，则：
>
> * 先写出$Fisher$信息矩阵$I(\theta)$；
> * 对该函数参数$g(\theta)$的$Cram\acute{e}r$-$Rao$下界为
>
> $$
> Var(\hat{g}) \geq \nabla g(\theta)^T I(\theta)^{-1} \nabla g(\theta),
> $$
>
> 若有$n$个样本，则是$[nI(\theta)]^{-1}$对应地变成$\frac{1}{n}$倍；
>
> * 若某无偏估计量的方差等于这个下界，则称其对$g(\theta)$是“有效的”。
>
> 在你这个题目中，参数是$p = (p_1, \dots, p_k)$，我们关心的是$g(p) = p_h$。
>
> 因此理论上确实需要用矩阵形式的$Cram\acute{e}r$-$Rao$下界：
>
> $$
> Var(\hat{p}_h) \geq \frac{1}{n} e_h^T I(p)^{-1} e_h,
> $$
>
> 其中$e_h$是对应该分量的单位向量（注意实际参数向量只含$p_1, \dots, p_{k-1}$，要按你的具体编号稍微处理一下$h=k$的情况）。
>
> 如果你能算出$\hat{p}_h$的方差恰好等于这个下界，就说明$\hat{p}_h$是有效估计。

证明极大似然估计有效：

将该试验独立重复 $n$ 次，记第 $i$ 次的指标向量为 $X^{(i)}=(X^{(i)}_1,\dots,X^{(i)}_{k-1})'$。则极大似然估计为经验频率

$$
\hat p_h=\frac{1}{n}\sum_{i=1}^{n}X^{(i)}_h,\qquad h=1,2,\dots,k-1,\quad
\hat p_k=1-\sum_{j=1}^{k-1}\hat p_j.
$$

> [!NOTE]
>
> 这里的极大似然估计是通过二项分布的引理得到，也就是将单个$p$的情况推广到$k$个的情况，我们只需要求$k$个变量的偏微分即可。

由第一问我们有：

$$
I(p)=
\begin{pmatrix}
\frac{1}{p_1}+\frac{1}{p_k} & \frac{1}{p_k} & \cdots & \frac{1}{p_k}\\[4pt]
\frac{1}{p_k} & \frac{1}{p_2}+\frac{1}{p_k} & \cdots & \frac{1}{p_k}\\
\vdots & \vdots & \ddots & \vdots\\[4pt]
\frac{1}{p_k} & \frac{1}{p_k} & \cdots & \frac{1}{p_{k-1}}+\frac{1}{p_k}
\end{pmatrix}.
$$

令

$$
D = \text{diag}\left(\frac{1}{p_1}, \ldots, \frac{1}{p_{k-1}}\right),
$$

令$J$为$(k-1) \times (k-1)$的全1矩阵，
则

$$
I(p) = D + \frac{1}{p_k}J.
$$

我们要对

$$
I(p) = D + \frac{1}{p_k}J
$$

求逆。注意这是“对角矩阵 + 秩1矩阵”的形式，因为

$$
J = uu^\top, \quad u = (1, 1, ..., 1)' \in \mathbb{R}^{k-1},
$$

所以

$$
I(p) = D + \frac{1}{p_k}uu^\top.
$$

设

$$
A = D, \quad B = \frac{1}{p_k}uu^\top.
$$

对矩阵 $A+B$ 的逆有著名公式 ($Sherman$-$Morrison$ 公式$)$的矩阵版：

$$
(A+cuu^\top)^{-1} = A^{-1} - A^{-1}u(c^{-1}+u^\top A^{-1}u)^{-1}u^\top A^{-1},
$$

利用矩阵求逆引理可得单次试验的信息逆矩阵

$$
I(p)^{-1}=\operatorname{diag}(p_1,\dots,p_{k-1})-pp^{\top}=\Sigma,
$$

另一方面，$n$ 次独立试验的信息为

$$
I_n(p)=n\,I(p).
$$

对任一 $h\in\{1,2,\dots,k\}$，克拉美–罗下界给出

$$
\operatorname{Var}(\hat p_h)\ \ge\ [I_n(p)^{-1}]_{hh}=\frac{p_h(1-p_h)}{n},
$$

而上式恰与 $\operatorname{Var}(\hat p_h)$ 相等，故极大似然估计 $\hat p_h$ 达到克拉美–罗下界，是有效估计。

> [!NOTE]
>
> 以上的详细计算如下：
>
> **1. 情形 A：$h\in\{1,\dots,k-1\}$**
>
> 此时 $g(p)=p_h$，
> 梯度向量为
>
>$$
> \nabla g(p) = e_h = (0,\dots,0,1,0,\dots,0)' \in \mathbb{R}^{k-1},
> $$
>
>第 $h$ 个位置是 1，其它为 0。
>
>于是 C-R 下界：
>
>$$
> \operatorname{Var}(\hat p_h)
> \ \ge\
> e_h^\top I_n(p)^{-1} e_h
> \ =\
> \frac{1}{n}\,e_h^\top I(p)^{-1}e_h
> \ =\
> \frac{1}{n}\,[I(p)^{-1}]_{hh}.
> $$
>
>而我们已求得
>
>$$
> [I(p)^{-1}]_{hh} = p_h(1-p_h),
> $$
>
>所以
>
>$$
> \operatorname{Var}(\hat p_h)
> \ \ge\
> \frac{p_h(1-p_h)}{n}.
> $$
>
>**另一方面**，对多项样本 $(N_1,\dots,N_k)\sim\mathrm{Multinomial}(n;p_1,\dots,p_k)$，
> $\hat p_h = N_h/n$ 是 $p_h$ 的 MLE，其方差为
>
>$$
> \operatorname{Var}(\hat p_h)
> = \frac{1}{n^2}\operatorname{Var}(N_h)
> = \frac{1}{n^2}\cdot np_h(1-p_h)
> = \frac{p_h(1-p_h)}{n},
> $$
>
>刚好等于 C-R 下界，故在此多参数模型中，$\hat p_h$ 对 $p_h$ 是**有效估计**。
>
>**2. 情形 B：$h=k$，即 $g(p)=p_k$**
>
>此时
>
>$$
> p_k = 1 - \sum_{i=1}^{k-1}p_i,
>$$
>
> 因此
>
>$$
> g(p)=1-\sum_{i=1}^{k-1}p_i,
>$$
>
> 梯度为
>
>$$
> \nabla g(p)
>= \frac{\partial g}{\partial p}
> = (-1,-1,\dots,-1)' = -u,\quad u=(1,\dots,1)'.
> $$
>
> 于是 C-R 下界：
>
>$$
> \operatorname{Var}(\hat p_k)
>\ \ge\
> \nabla g(p)^\top\,I_n(p)^{-1}\,\nabla g(p)
> =
> \frac{1}{n}\,\nabla g(p)^\top\,I(p)^{-1}\,\nabla g(p).
> $$
>
> 代入 $\nabla g(p)=-u$：
>
>$$
> \operatorname{Var}(\hat p_k)
>\ \ge\
> \frac{1}{n}\,u^\top I(p)^{-1}u.
> $$
>
> 利用 $I(p)^{-1} = D^{-1} - D^{-1}u u^\top D^{-1}$ 这一形式（这里千万注意 $D^{-1}=\operatorname{diag}(p_1,\dots,p_{k-1})$）：
>
>1. 先算 $u^\top D^{-1}u$： $u^\top D^{-1}u = 1-p_k.$
>2. 再算 $u^\top D^{-1}u u^\top D^{-1}u$： $u^\top D^{-1}u u^\top D^{-1}u  = (1-p_k)^2.$
>
> 所以
>
>$$
> u^\top I(p)^{-1}u
>= u^\top D^{-1}u - u^\top D^{-1}u u^\top D^{-1}u
> = (1-p_k)-(1-p_k)^2
> = p_k(1-p_k).
> $$
>
> 故
>
>$$
> \operatorname{Var}(\hat p_k)
>\ \ge\ \frac{1}{n}\,p_k(1-p_k).
> $$
>
> 而 MLE $\hat p_k = N_k/n$，仍由多项分布边缘为二项分布可知
>
>$$
> \operatorname{Var}(\hat p_k)
>= \frac{p_k(1-p_k)}{n},
> $$
>
> 恰等于 C-R 下界，因此对 $p_k$ 也是**有效估计**。

**证毕。**

#### 5.
>
> 5. (正态分布方差信息)假定$X_1, X_2, \dots, X_n$是 $iid$ 的、服从$N(\mu, \sigma^2)$。考察变换$g(\mu, \sigma) = \sigma^2$。求证：对于有限样本来说，样本方差$S^2$关于$\sigma^2$是无偏的，不是有效的，然而它却是渐近有效的。

**解：**

我们已经有

$$
I(\mu,\sigma) = \begin{bmatrix} \frac{1}{\sigma^2} & 0 \\ 0 & \frac{2}{\sigma^2} \end{bmatrix}
$$


* 定义样本方差：

  $$
  S^2 \equiv \frac{1}{n-1}\sum_{i=1}^{n}\bigl(X_i-\bar X\bigr)^2,\qquad \bar X=\frac{1}{n}\sum_{i=1}^{n}X_i.
  $$

* 不偏性：对 $N(\mu,\sigma^2)$，有经典结论

  $$
  \frac{(n-1)S^2}{\sigma^2}\sim \chi^2_{\,n-1}.
  $$

  因此

  $$
  \mathbb E\!\left[\frac{(n-1)S^2}{\sigma^2}\right]=n-1
  $$

  从而

  $$
  \mathbb E[S^2]=\sigma^2
  $$

  ，
  即 $S^2$ 是关于 $\sigma^2$ 的无偏估计。

* 有限样本的方差与下界比较：由 $\chi^2$ 分布矩的性质，

  $$
  \operatorname{Var}\!\left(\frac{(n-1)S^2}{\sigma^2}\right)=2(n-1)
  $$
  
  故
  
  $$
  \operatorname{Var}(S^2)=\frac{2\sigma^4}{\,n-1\,}.
  $$
  
  另一方面，对于参数向量 $(\mu,\sigma)$ 与目标函数 $g(\mu,\sigma)=\sigma^2$，其梯度为

  $$
  \nabla g(\mu,\sigma)=\begin{bmatrix}0\\ 2\sigma\end{bmatrix}.
  $$
  
  单个观测的费舍尔信息为题设矩阵 $I(\mu,\sigma)$，则 $n$ 个独立观测的信息矩阵为

  $$
  I_n(\mu,\sigma)=n\,I(\mu,\sigma),
  $$
  
  其逆为

  $$
  I_n^{-1}(\mu,\sigma)=\frac{1}{n}\,I(\mu,\sigma)^{-1}
  $$
  
  而

  $$
  I(\mu,\sigma)^{-1}=\begin{bmatrix}\sigma^2&0\\[4pt]0&\dfrac{\sigma^2}{2}\end{bmatrix}.
  $$
  
  多参数情形下对 $g(\mu,\sigma)$ 的克拉美–罗不等式给出任何无偏估计量 $T$ 的方差下界

  $$
  \operatorname{Var}(T)\;\ge\;\nabla g(\mu,\sigma)^{\!\top}\,I_n(\mu,\sigma)^{-1}\,\nabla g(\mu,\sigma)
  \;=\;\frac{1}{n}\,\nabla g^{\!\top}I^{-1}\nabla g
  \;=\;\frac{1}{n}\,(2\sigma)^2\cdot\frac{\sigma^2}{2}
  \;=\;\frac{2\sigma^4}{n}.
  $$
  
  比较可得

  $$
  \operatorname{Var}(S^2)=\dfrac{2\sigma^4}{n-1}\;>\;\dfrac{2\sigma^4}{n}
  $$
  
  当 $n$ 有限时成立。因此 $S^2$ 不是有效估计（未达到下界）。

* 渐近有效性：当 $n\to\infty$ 时，

  $$
  \frac{\operatorname{Var}(S^2)}{\dfrac{2\sigma^4}{n}}
  \;=\;
  \frac{\dfrac{2\sigma^4}{n-1}}{\dfrac{2\sigma^4}{n}}
  \;=\;\frac{n}{n-1}\;\longrightarrow\;1,
  $$

  故 $S^2$ 是关于 $\sigma^2$ 的渐近有效估计。

综上，$S^2$ 对 $\sigma^2$ 是无偏但在有限样本下不有效，而当 $n\to\infty$ 时是渐近有效的。

**证毕。**
