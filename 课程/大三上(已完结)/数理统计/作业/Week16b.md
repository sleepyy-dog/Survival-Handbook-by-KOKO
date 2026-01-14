# 第三十讲

## 23339147郑博引

> #### 题目 ($1.$):
>
> 设独立随机变量$X$与$Y$分别服从$N(\theta_1,\theta_3)$与$N(\theta_2,\theta_3)$，其中共同方差$\theta_3$未知，$\theta_1,\theta_2$未知，参数空间
>
> $$
> \Omega=\{(\theta_1,\theta_2,\theta_3):-\infty<\theta_1<\infty,\,-\infty<\theta_2<\infty,\,0<\theta_3<\infty\}.
> $$
>
> $X_1,\dots,X_n$为来自$X$的样本，$Y_1,\dots,Y_m$为来自$Y$的样本。
>
> （$1$）在$H_0:\theta_1=\theta_2$为真时，求$\theta_1$与$\theta_3$的极大似然估计及对应似然函数最大值。
>
> （$2$）在$H_1:\theta_1\ne\theta_2$为真时，求$\theta_1,\theta_2,\theta_3$的极大似然估计及对应似然函数最大值。
>
> （$3$）在$H_0:\theta_1=\theta_2$为真时，证明统计量
>
> $$
> T=\sqrt{\frac{nm}{n+m}}\cdot\frac{\overline{X}-\overline{Y}}{\sqrt{\dfrac{\sum_{i=1}^n(X_i-\overline{X})^2+\sum_{j=1}^m(Y_j-\overline{Y})^2}{n+m-2}}}\sim t(n+m-2).
> $$
>
> （$4$）对假设$H_0:\theta_1=\theta_2$（$\theta_3$未知）对一切备择进行检验。
>
> （$5$）取$n=10,m=6,\alpha=0.05$，求满足$\alpha=P(|T|\ge c\mid H_0)$的$c$。

**解：**

> [!IMPORTANT]
>
> 必考。

记

$$
\overline{X}=\frac{1}{n}\sum_{i=1}^nX_i,\qquad \overline{Y}=\frac{1}{m}\sum_{j=1}^mY_j,
$$

$$
S_X=\sum_{i=1}^n(X_i-\overline{X})^2,\qquad S_Y=\sum_{j=1}^m(Y_j-\overline{Y})^2.
$$

（$1$）在$H_0:\theta_1=\theta_2$下，令$\theta_1=\theta_2=\theta$，似然函数为

$$
L_0(\theta,\theta_3)=(2\pi\theta_3)^{-\frac{n+m}{2}}
\exp\!\left\{-\frac{1}{2\theta_3}\left[\sum_{i=1}^n(X_i-\theta)^2+\sum_{j=1}^m(Y_j-\theta)^2\right]\right\}.
$$

对$\theta$最大化等价于最小化平方和，得

$$
\hat{\theta}=\frac{n\overline{X}+m\overline{Y}}{n+m}.
$$

将$\theta=\hat{\theta}$代回后，对$\theta_3$最大化得

$$
\hat{\theta}_{3,0}=\frac{1}{n+m}\left[\sum_{i=1}^n(X_i-\hat{\theta})^2+\sum_{j=1}^m(Y_j-\hat{\theta})^2\right].
$$

于是最大似然值为

$$
\sup_{H_0}L=(2\pi)^{-\frac{n+m}{2}}\hat{\theta}_{3,0}^{-\frac{n+m}{2}}
\exp\!\left(-\frac{n+m}{2}\right).
$$

（$2$）在$H_1$（不加$\theta_1=\theta_2$约束）下，似然函数为

$$
L_1(\theta_1,\theta_2,\theta_3)=(2\pi\theta_3)^{-\frac{n+m}{2}}
\exp\!\left\{-\frac{1}{2\theta_3}\left[\sum_{i=1}^n(X_i-\theta_1)^2+\sum_{j=1}^m(Y_j-\theta_2)^2\right]\right\}.
$$

分别对$\theta_1,\theta_2$最大化得

$$
\hat{\theta}_1=\overline{X},\qquad \hat{\theta}_2=\overline{Y}.
$$

再对$\theta_3$最大化得

$$
\hat{\theta}_{3,1}=\frac{1}{n+m}\left[S_X+S_Y\right].
$$

于是最大似然值为

$$
\sup_{H_1}L=(2\pi)^{-\frac{n+m}{2}}\hat{\theta}_{3,1}^{-\frac{n+m}{2}}
\exp\!\left(-\frac{n+m}{2}\right).
$$

（$3$）在$H_0$下，令$\theta_3=\sigma^2$。则

$$
\frac{\overline{X}-\overline{Y}}{\sigma\sqrt{\frac{1}{n}+\frac{1}{m}}}\sim N(0,1).
$$

又由正态样本性质与两样本独立性，

$$
\frac{S_X}{\sigma^2}\sim\chi^2(n-1),\qquad \frac{S_Y}{\sigma^2}\sim\chi^2(m-1),
$$

且二者独立，从而

$$
\frac{S_X+S_Y}{\sigma^2}\sim\chi^2(n+m-2),
$$

并且$\overline{X}-\overline{Y}$与$S_X+S_Y$独立。令

$$
S_p^2=\frac{S_X+S_Y}{n+m-2},
$$

则

> [!NOTE]
>
> $ t $ 分布的本质定义是一个**标准正态分布**除以一个**卡方分布的平方根**：
>
> $$
> t = \frac{Z}{\sqrt{V/k}}
> $$

$$
T=\frac{\overline{X}-\overline{Y}}{S_p\sqrt{\frac{1}{n}+\frac{1}{m}}}
=\sqrt{\frac{nm}{n+m}}\cdot\frac{\overline{X}-\overline{Y}}{S_p}\sim t(n+m-2).
$$

（$4$）似然比统计量

$$
\lambda=\frac{\sup_{H_0}L}{\sup_{H_1}L}
=\left(\frac{\hat{\theta}_{3,1}}{\hat{\theta}_{3,0}}\right)^{\frac{n+m}{2}}.
$$

利用平方和分解

$$
\sum_{i=1}^n(X_i-\hat{\theta})^2+\sum_{j=1}^m(Y_j-\hat{\theta})^2
=S_X+S_Y+\frac{nm}{n+m}(\overline{X}-\overline{Y})^2,
$$

得

$$
\hat{\theta}_{3,0}=\frac{S_X+S_Y+\frac{nm}{n+m}(\overline{X}-\overline{Y})^2}{n+m},\qquad
\hat{\theta}_{3,1}=\frac{S_X+S_Y}{n+m}.
$$

于是

$$
\lambda=\left(1+\frac{nm}{n+m}\cdot\frac{(\overline{X}-\overline{Y})^2}{S_X+S_Y}\right)^{-\frac{n+m}{2}}
=\left(1+\frac{T^2}{n+m-2}\right)^{-\frac{n+m}{2}}.
$$

故$\lambda$随$|T|$增大而减小，似然比检验等价于对$|T|$作双侧检验：给定显著性水平$\alpha$，拒绝域为

$$
|T|\ge c,\qquad c=t_{1-\alpha/2}(n+m-2).
$$

（$5$）当$n=10,m=6$时，自由度为$n+m-2=14$，故

$$
c=t_{1-\alpha/2}(14)=t_{0.975}(14)\approx 2.145.
$$

**证毕。**

---

> #### 题目 ($P343$ 例$8.3.3$):
>
> 已知两个独立随机样本$X_1,\dots,X_n$与$Y_1,\dots,Y_m$分别来自$N(\theta_1,\theta_3)$与$N(\theta_2,\theta_4)$，参数空间
>
> $$
> \Omega=\{(\theta_1,\theta_2,\theta_3,\theta_4):-\infty<\theta_1,\theta_2<\infty,\ 0<\theta_3,\theta_4<\infty\}.
> $$
>
> 考虑检验$H_0:\theta_3=\theta_4$对一切备择。
>
> （$1$）在$H_0$为真时，求$\theta_1,\theta_2,\theta_3$的极大似然估计及最大似然值。
>
> （$2$）在$H_1:\theta_3\ne\theta_4$下，求$\theta_1,\theta_2,\theta_3,\theta_4$的极大似然估计及最大似然值。
>
> （$3$）证明
>
> $$
> F=\frac{\sum_{i=1}^n(X_i-\overline{X})^2/(n-1)}{\sum_{j=1}^m(Y_j-\overline{Y})^2/(m-1)}\sim F(n-1,m-1).
> $$
>
> （$4$）给出$H_0:\theta_3=\theta_4$的似然比检验形式。

**解：**

> [!IMPORTANT]
>
> 必考。

记

$$
\overline{X}=\frac{1}{n}\sum_{i=1}^nX_i,\qquad \overline{Y}=\frac{1}{m}\sum_{j=1}^mY_j,
$$

$$
S_X=\sum_{i=1}^n(X_i-\overline{X})^2,\qquad S_Y=\sum_{j=1}^m(Y_j-\overline{Y})^2.
$$

（$1$）在$H_0:\theta_3=\theta_4=\theta$下，似然函数为

$$
L_0(\theta_1,\theta_2,\theta)=(2\pi\theta)^{-\frac{n+m}{2}}
\exp\!\left\{-\frac{1}{2\theta}\left[\sum_{i=1}^n(X_i-\theta_1)^2+\sum_{j=1}^m(Y_j-\theta_2)^2\right]\right\}.
$$

对$\theta_1,\theta_2$最大化得

$$
\hat{\theta}_1=\overline{X},\qquad \hat{\theta}_2=\overline{Y}.
$$

代回后对$\theta$最大化得

$$
\hat{\theta}=\frac{S_X+S_Y}{n+m}.
$$

最大似然值为

$$
\sup_{H_0}L=(2\pi)^{-\frac{n+m}{2}}
\left(\frac{S_X+S_Y}{n+m}\right)^{-\frac{n+m}{2}}
\exp\!\left(-\frac{n+m}{2}\right).
$$

（$2$）在$H_1$下（$\theta_3,\theta_4$不受约束），似然函数为

$$
L_1(\theta_1,\theta_2,\theta_3,\theta_4)=(2\pi)^{-\frac{n+m}{2}}\theta_3^{-\frac{n}{2}}\theta_4^{-\frac{m}{2}}
\exp\!\left\{-\frac{1}{2\theta_3}\sum_{i=1}^n(X_i-\theta_1)^2-\frac{1}{2\theta_4}\sum_{j=1}^m(Y_j-\theta_2)^2\right\}.
$$

同理得

$$
\hat{\theta}_1=\overline{X},\qquad \hat{\theta}_2=\overline{Y},\qquad
\hat{\theta}_3=\frac{S_X}{n},\qquad \hat{\theta}_4=\frac{S_Y}{m}.
$$

最大似然值为

$$
\sup_{H_1}L=(2\pi)^{-\frac{n+m}{2}}
\left(\frac{S_X}{n}\right)^{-\frac{n}{2}}
\left(\frac{S_Y}{m}\right)^{-\frac{m}{2}}
\exp\!\left(-\frac{n+m}{2}\right).
$$

（$3$）在$H_0$下设$\theta_3=\theta_4=\sigma^2$。由正态样本性质

$$
\frac{S_X}{\sigma^2}\sim\chi^2(n-1),\qquad \frac{S_Y}{\sigma^2}\sim\chi^2(m-1),
$$

且两者独立。因此

$$
F=\frac{\dfrac{S_X}{n-1}}{\dfrac{S_Y}{m-1}}
=\frac{\chi^2(n-1)/(n-1)}{\chi^2(m-1)/(m-1)}\sim F(n-1,m-1).
$$

（$4$）似然比为

$$
\lambda=\frac{\sup_{H_0}L}{\sup_{H_1}L}
=\left(\frac{S_X}{n}\right)^{\frac{n}{2}}\left(\frac{S_Y}{m}\right)^{\frac{m}{2}}
\left(\frac{n+m}{S_X+S_Y}\right)^{\frac{n+m}{2}}.
$$

令

$$
r=\frac{(S_X/n)}{(S_Y/m)},
$$

则可化为仅依赖$r$的形式

$$
\lambda=r^{\frac{n}{2}}\left(\frac{n+m}{nr+m}\right)^{\frac{n+m}{2}},
$$

而$r$与统计量$F=\dfrac{S_X/(n-1)}{S_Y/(m-1)}$成单调对应关系，

> [!NOTE]
>
> 为了找到 $\lambda$ 的变化规律，我们对 $\ln \lambda(r)$ 求关于 $r$ 的导数：
>
> $$
> \ln \lambda(r) = \frac{n}{2} \ln r - \frac{n+m}{2} \ln(nr+m) + C
> $$
>
> 对 $r$ 求导：
>
> $$
> \frac{d}{dr} \ln \lambda(r) = \frac{n}{2r} - \frac{n+m}{2} \cdot \frac{n}{nr+m} = \frac{n(nr+m) - n(n+m)r}{2r(nr+m)}
> $$
>
> 分子化简得：
>
> $$
> n^2r + nm - n^2r - nmr = nm(1-r)
> $$
>
> 故导数为：
>
> $$
> \frac{d}{dr} \ln \lambda(r) = \frac{nm(1-r)}{2r(nr+m)}
> $$
>
> 观察导数符号：
>
> * 当 $0 < r < 1$ 时，导数 $> 0$，$\lambda(r)$ **单调递增**；
> * 当 $r > 1$ 时，导数 $< 0$，$\lambda(r)$ **单调递减**；
> * 当 $r = 1$ 时，$\lambda(r)$ 达到**最大值**。
>
> 这说明 $\lambda(r)$ 是一个**“单峰”函数**（类似倒扣的钟形）。
>
> 似然比检验的原则是：当似然比 $\lambda$ **过小**（即观测结果在 $H_0$ 下发生的概率远小于在全空间下发生的概率）时，拒绝 $H_0$。
>
> 由于 $\lambda(r)$ 在 $r=1$ 处取得最大值，向两边对称下降，因此：
>
> $$
> \lambda \le c \iff r \le c_1 \text{ 或 } r \ge c_2
> $$

故似然比检验等价于$F$的双侧检验：给定显著性水平$\alpha$，拒绝域可取

$$
F\le F_{\alpha/2}(n-1,m-1)\quad\text{或}\quad F\ge F_{1-\alpha/2}(n-1,m-1),
$$

其中$F_p(n-1,m-1)$为$F(n-1,m-1)$分布的$p$分位数。

**证毕。**

---

> #### 题目 ($3.$):
>
> （偏斜污染正态分布）考虑随机变量
>
> $$
> X=(1-I_\varepsilon)Z+I_\varepsilon Y,
> $$
>
> 其中$Z\sim N(0,1)$，$Y\sim N(\mu_c,\sigma_c^2)$，$I_\varepsilon\sim\mathrm{Bin}(1,\varepsilon)$，且$Z,Y,I_\varepsilon$相互独立。设$X_1,\dots,X_n$为来自$X$分布的样本，取$n=30,\varepsilon=0.20,\sigma_c=25$。
>
> （$1$）在显著性水平（$\mu_c=0$的正态水平）$\alpha=0.05$下，对单侧假设$H_0:\mu=\mu_X$对$H_1:\mu<\mu_X$进行检验。
>
> （$2$）分别取$\mu_c=0,5,10,15,20$，进行$10000$次模拟，拒绝$H_0$次数依次为$458,961,1238,1294,1301$。令经验水平$\hat{\alpha}=$拒绝次数$/10000$，比较$\mu_c$对$\hat{\alpha}$的影响及偏离$\alpha$的程度。

**解：**

先由模型得总体均值

$$
\mu_X=E[X]=(1-\varepsilon)E[Z]+\varepsilon E[Y]=\varepsilon\mu_c.
$$

（$1$）用单样本$ t $检验统计量

$$
T=\frac{\sqrt{n}\,(\overline{X}-\mu_X)}{S},
\qquad
S^2=\frac{1}{n-1}\sum_{i=1}^n(X_i-\overline{X})^2.
$$

在“正态水平”下取临界值

$$
t_\alpha(n-1)=t_{0.05}(29),
$$

并取拒绝域为

$$
T\le t_{0.05}(29).
$$

（数值可由$t_{0.05}(29)\approx -1.699$给出。）

> [!NOTE]
>
> 下侧分位数应该为0.95.

（$2$）经验水平为

$$
\hat{\alpha}=\frac{\text{拒绝次数}}{10000}.
$$

对应各$\mu_c$：

$$
\mu_c=0:\ \hat{\alpha}=0.0458;\quad
\mu_c=5:\ \hat{\alpha}=0.0961;\quad
\mu_c=10:\ \hat{\alpha}=0.1238;
$$

$$
\mu_c=15:\ \hat{\alpha}=0.1294;\quad
\mu_c=20:\ \hat{\alpha}=0.1301.
$$

可见随着$\mu_c$增大，$\hat{\alpha}$显著大于名义水平$\alpha=0.05$，偏离程度增大，说明在该偏斜污染情形下上述检验的实际水平被明显放大。

**证毕。**

---

> #### 题目 ($4.$):
>
> 设独立随机变量$X\sim N(\theta_1,\theta_3)$与$Y\sim N(\theta_2,\theta_4)$，两个独立样本$X_1,\dots,X_n$与$Y_1,\dots,Y_m$分别来自总体$X$与$Y$。
>
> （$1$）证明：若$H_0:\theta_3=\theta_4$成立，则关于方差相等的似然比检验统计量$F$与关于均值相等$H_0:\theta_1=\theta_2$的似然比检验统计量$T$相互独立。
>
> （$2$）若分别基于$F$与$T$构造的检验显著性水平为$\alpha_1,\alpha_2$，求联合检验$H_0:\theta_3=\theta_4$与$H_0:\theta_1=\theta_2$的显著性水平。
>
> （$3$）求“接受$H_0:\theta_3=\theta_4$且拒绝$H_0:\theta_1=\theta_2$”的概率。

**解：**

记

$$
S_X^2=\frac{\sum_{i=1}^n(X_i-\overline{X})^2}{n-1},\qquad
S_Y^2=\frac{\sum_{j=1}^m(Y_j-\overline{Y})^2}{m-1},
$$

并取

$$
F=\frac{S_X^2}{S_Y^2},\qquad
S_p^2=\frac{(n-1)S_X^2+(m-1)S_Y^2}{n+m-2},
$$

$$
T=\frac{\overline{X}-\overline{Y}}{S_p\sqrt{\frac{1}{n}+\frac{1}{m}}}.
$$

> [!NOTE]
>
> $F$的推导见8.3.3
>
> $T$的推导如下：
>
> 1. 建立似然函数
>
> 在 $H_0: \theta_3 = \theta_4 = \sigma^2$ 已成立的前提下，考虑检验 $H_0: \theta_1 = \theta_2$。此时似然函数为：
>
> $$
> L(\mu_1, \mu_2, \sigma^2) = \left( \frac{1}{2\pi\sigma^2} \right)^{\frac{n+m}{2}} \exp \left[ -\frac{1}{2\sigma^2} \left( \sum_{i=1}^n (X_i-\mu_1)^2 + \sum_{j=1}^m (Y_j-\mu_2)^2 \right) \right]
> $$
>
> 2. 求全空间 $\Omega$ 下的最大似然值
>
> 在 $\Omega$ 中，$\mu_1, \mu_2, \sigma^2$ 均未知。其 MLE 为：
>
> * $\hat{\mu}_1 = \overline{X}, \quad \hat{\mu}_2 = \overline{Y}$
> * $\hat{\sigma}_{\Omega}^2 = \frac{1}{n+m} \left[ \sum(X_i-\overline{X})^2 + \sum(Y_j-\overline{Y})^2 \right] = \frac{(n+m-2)S_p^2}{n+m}$
>
> 代入似然函数：
>
> $$
> L(\hat{\Omega}) = (2\pi\hat{\sigma}_{\Omega}^2)^{-\frac{n+m}{2}} e^{-\frac{n+m}{2}}
> $$
>
> 3. 求约束空间 $\omega$ 下的最大似然值
>
> 在 $H_0: \mu_1 = \mu_2 = \mu$ 的约束下，MLE 为：
>
> * $\hat{\mu} = \frac{\sum X_i + \sum Y_j}{n+m} = \frac{n\overline{X} + m\overline{Y}}{n+m}$
> * $\hat{\sigma}_{\omega}^2 = \frac{1}{n+m} \left[ \sum(X_i-\hat{\mu})^2 + \sum(Y_j-\hat{\mu})^2 \right]$
>
> 利用平方和分解公式，可以证明：
>
> $$
> (n+m)\hat{\sigma}_{\omega}^2 = (n+m)\hat{\sigma}_{\Omega}^2 + \frac{nm}{n+m}(\overline{X}-\overline{Y})^2
> $$
>
> 代入似然函数：
>
> $$
> L(\hat{\omega}) = (2\pi\hat{\sigma}_{\omega}^2)^{-\frac{n+m}{2}} e^{-\frac{n+m}{2}}
> $$
>
> 4. 计算似然比 $\lambda$
>
> $$
> \lambda = \frac{L(\hat{\omega})}{L(\hat{\Omega})} = \left( \frac{\hat{\sigma}_{\Omega}^2}{\hat{\sigma}_{\omega}^2} \right)^{\frac{n+m}{2}} = \left( \frac{(n+m)\hat{\sigma}_{\Omega}^2}{(n+m)\hat{\sigma}_{\Omega}^2 + \frac{nm}{n+m}(\overline{X}-\overline{Y})^2} \right)^{\frac{n+m}{2}}
> $$
>
> 将分子分母同时除以 $(n+m)\hat{\sigma}_{\Omega}^2$：
>
> $$
> \lambda = \left( 1 + \frac{\frac{nm}{n+m}(\overline{X}-\overline{Y})^2}{(n+m-2)S_p^2} \right)^{-\frac{n+m}{2}}
> $$
>
> 5. 引入 $T$ 统计量
>
> 回顾题目中定义的 $T$ 统计量：
>
> $$
> T = \frac{\overline{X}-\overline{Y}}{S_p\sqrt{\frac{1}{n}+\frac{1}{m}}} \implies T^2 = \frac{(\overline{X}-\overline{Y})^2}{S_p^2 (\frac{n+m}{nm})} = \frac{\frac{nm}{n+m}(\overline{X}-\overline{Y})^2}{S_p^2}
> $$
>
> 代入 $\lambda$ 的表达式中：
>
> $$
> \lambda = \left( 1 + \frac{T^2}{n+m-2} \right)^{-\frac{n+m}{2}}
> $$

（$1$）在$H_0:\theta_3=\theta_4=\sigma^2$下，令

$$
U=\frac{(n-1)S_X^2}{\sigma^2}\sim\chi^2(n-1),\qquad
V=\frac{(m-1)S_Y^2}{\sigma^2}\sim\chi^2(m-1),
$$

且$U,V$相互独立。于是

$$
F=\frac{U/(n-1)}{V/(m-1)}
$$

仅由$U,V$决定，而

$$
S_p^2=\sigma^2\cdot\frac{U+V}{n+m-2}
$$

仅由$U+V$决定。又由正态样本性质

$$
Z=\frac{\overline{X}-\overline{Y}}{\sigma\sqrt{\frac{1}{n}+\frac{1}{m}}}\sim N(0,1),
$$

并且$Z$与$(U,V)$独立，从而$Z$与$(U+V)$也独立，并有

$$
T=\frac{Z}{\sqrt{(U+V)/(n+m-2)}}.
$$

利用独立$\chi^2$变量的性质：$U/(U+V)$与$U+V$相互独立（等价于$U/(U+V)\sim\mathrm{Beta}(\frac{n-1}{2},\frac{m-1}{2})$且与$U+V$独立），而$F$是$U/(U+V)$的单调函数，故$F$与$U+V$独立。又$Z$与$F$独立，因此$T$（仅由$Z$与$U+V$构成）与$F$独立。

（$2$）在联合原假设$H_0:\theta_3=\theta_4,\ \theta_1=\theta_2$成立时，由（$1$）知$F$与$T$独立。若联合检验的拒绝规则为“只要任一分检验拒绝即拒绝联合原假设”，则联合检验显著性水平为

$$
\alpha=P(\text{拒绝})=1-P(\text{两者都不拒绝})
=1-(1-\alpha_1)(1-\alpha_2).
$$

（$3$）同理，在联合原假设成立时

$$
P(\text{接受 }H_0:\theta_3=\theta_4\ \text{且拒绝 }H_0:\theta_1=\theta_2)
=(1-\alpha_1)\alpha_2.
$$

**证毕。**
