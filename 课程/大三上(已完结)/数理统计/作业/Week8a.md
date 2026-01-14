# 第十三讲

---

## 郑博引 23339147

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$1$ 题$1$):**
>
> 设 $\{X_n\}$ 是概率有界的随机变量序列，并设 $\{Y_n\}$ 是依分布收敛于 $0$ 的随机变量序列。求证：$X_nY_n \xrightarrow{P} 0$。

**解：**

这里需要证明$\forall \varepsilon >0$,有
$$
\varlimsup_{n\to \infin}P[|X_nY_n|>\varepsilon]=0
$$
注意到此时由$X_n$概率有界，我们可以取到$B_{\delta}\ $s.t.
$$
\varlimsup_{n\to \infin}P[\{|X_n|>B_{\delta}\}]<\delta
$$

$$
\varlimsup_{n\to \infin}P[|X_nY_n|>\varepsilon]\le
\varlimsup_{n\to \infin}P[\{|X_nY_n|>\varepsilon\}\cap\{|X_n|>B_{\delta}\}]+\varlimsup_{n\to \infin}P[\{|X_nY_n|>\varepsilon\}\cap\{|X_n|\le B_{\delta}\}]\\
\le\varlimsup_{n\to \infin}P[\{|X_n|>B_{\delta}\}]+\varlimsup_{n\to \infin}P[\{|Y_n|>\varepsilon/B_{\delta}\}]\\
<\delta
$$
注意到我们可以有分布收敛到常数推出概率收敛，也就是有以下性质：
$$
\varlimsup_{n\to \infin}P[\{|Y_n|>\varepsilon/B_{\delta}\}]=0
$$
此时我们令$\delta\to 0$,则知
$$
\varlimsup_{n\to \infin}P[|X_nY_n|>\varepsilon]=0
$$
**证毕。**

---

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$1$ 题$2$):**
>
> 如果 $X_n$ 依概率收敛于 $X$，求证：$X_n$ 依分布收敛于 $X$。

**解：**

我们需要证明对X相应的分布函数$F(x)$上的连续点$x_0$,我们有
$$
\lim_{n\to \infin}F_n(x_0)=F(x_0)
$$
思路为证明
$$
\varlimsup_{n\to \infin}F_n(x_0)\le F(x_0)且\varliminf_{n\to \infin}F_n(x_0)\ge F(x_0)
$$
我们首先证明$\varlimsup_{n\to \infin}F_n(x_0)\le F(x_0)$：

注意到此时我们还有
$$
F_n(x_0)=P\{X_n\le x_0\}=P(\{X_n\le x_0\}\cap\{|X_n-X|\le\varepsilon\})+P(\{X_n\le x_0\}\cap\{|X_n-X|>\varepsilon\})\\
\le P(\{X\le x_0+\varepsilon\})+P(\{|X_n-X|>\varepsilon\})
$$


此时知
$$
\varlimsup_{n\to\infin}F(x_0)\le \varlimsup_{n\to\infin}P(\{X\le x_0+\varepsilon\})  +   \varlimsup_{n\to\infin}P(\{|X_n-X|>\varepsilon\})\\
=F(x_0+\varepsilon)
$$
同理，我们证明$\varliminf_{n\to \infin}F_n(x_0)\ge F(x_0)$。

我们使用类似方法来对于$P\{X> x_0\}$做处理，可以得到的结论是
$$
1-F_n(x_0)=P\{X_n > x_0\}=P(\{X_n> x_0\}\cap\{|X_n-X|\le\varepsilon\})+P(\{X_n > x_0\}\cap\{|X_n-X|>\varepsilon\})\\
\le P(\{X > x_0-\varepsilon\})+P(\{|X_n-X|>\varepsilon\})\\
=1-P(\{X\le x_0-\varepsilon\})+P(\{|X_n-X|>\varepsilon\})\\
=1-F(x_0-\varepsilon)+P(\{|X_n-X|>\varepsilon\})
$$
得到
$$
F_n(x_0)\ge F(x_0-\varepsilon)-P(\{|X_n-X|>\varepsilon\})
$$
则知
$$
\varliminf_{n\to\infin}F_n(x_0)\ge \varliminf_{n\to\infin}F(x_0-\varepsilon)+\varliminf_{n\to\infin}(-P(\{|X_n-X|>\varepsilon\}))\\
=\varliminf_{n\to\infin}F(x_0-\varepsilon)-\varlimsup_{n\to\infin}(P(\{|X_n-X|>\varepsilon\}))\\
=F(x_0-\varepsilon)
$$
**证毕。**

---

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$1$ 题$3$):**
>
> 假定 $\{Y_n\}$ 是随机变量序列，依概率是有界的。若 $X_n=o_p(Y_n)$，求证：当 $n\to\infty$ 时，$X_n \xrightarrow{P} 0$。

**解：**

我们需要证明：
$$
\lim_{n\to \infin}P\{|X_n|>\varepsilon\}=0
$$
我们当前有$\frac{X_n}{Y_n}$依分布收敛到0，这也就等价于依概率收敛。

注意到此时由$X_n$概率有界，我们可以取到$B_{\delta}\ $s.t.
$$
\varlimsup_{n\to \infin}P\{|Y_n|\ge\frac{\varepsilon}{B_{\delta}}\}<\delta
$$
我们有：
$$
P\{|X_n|>\varepsilon\}=P(\{|X_n|>\varepsilon\}\cap\{|\frac{X_n}{Y_n}|\ge B_{\delta}\})+P(\{|X_n|>\varepsilon\}\cap\{|\frac{X_n}{Y_n}|< B_{\delta}\})\\ 
\le P\{|\frac{X_n}{Y_n}|\ge B_{\delta}\}+P\{|Y_n|\ge\frac{\varepsilon}{B_{\delta}}\}
$$

此时知
$$
\varlimsup_{n\to \infin}P\{|X_n|>\varepsilon\}\le \varlimsup_{n\to \infin}P\{|\frac{X_n}{Y_n}|\ge B_{\delta}\}+\varlimsup_{n\to \infin}P\{|Y_n|\ge\frac{\varepsilon}{B_{\delta}}\}<\delta
$$
令$\delta \to 0$，得证。

**证毕。**

---

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$1$ 题$4$):**
>
> 设 $\{X_n\}$ 是随机变量序列，使得
> $$\sqrt{n}\,(X_n-\theta)\xrightarrow{D}N(0,\sigma^2)$$
> 假定函数 $g(x)$ 在 $\theta$ 处可微，且 $g'(\theta)\ne 0$。求证：
> $$\sqrt{n}\,[\,g(X_n)-g(\theta)\,]\xrightarrow{D}N\!\big(0,\sigma^2\,(g'(\theta))^2\big)$$

**解：**

注意到我们此时有
$$
g(X_n)-g(\theta)=g'(\theta)(X_n-\theta)+o(X_n-\theta)
$$
则知
$$
\sqrt{n}(g(X_n)-g(\theta))=\sqrt{n}g'(\theta)(X_n-\theta)+o(\sqrt{n}(X_n-\theta))
$$
注意到我们由$\sqrt{n}(X_n-\theta)$依分布收敛知概率有界，则知$o(\sqrt{n}(X_n-\theta))$依分布收敛到0。

> [!NOTE]
>
> 我们有定理：
>
> 定理5.2.3 假定$X_n$依分布收敛于$X$，同时$Y_n$依概率收敛于$0$。于是，$X_n+Y_n$依分布收敛于$X$。

则知得证。

**证毕。**

---

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$2$ 题$5$):**
>
> 设 $Y_n$ 服从 $b(n,p)$ 分布。假定对于每一个 $n$，均值 $\mu=np$ 都相同，其中 $\mu$ 为常数。
> （$1$）求证：当 $n\to\infty,\,p\to 0,\,np\to\mu$ 时，$Y_n$ 的分布收敛到参数为 $\mu$ 的泊松分布。
> （$2$）当 $n=50,\,p=1/25$ 时，求 $P(Y\le 1)$。

**解：**

（1）

> [!NOTE]
>
> 我们有命题：
>
> 定理$5.2.10$ 设$\{X_n\}$是随机变量序列，对于所有$n$，$-h < t < h$，它具有$mgf M_{X_n}(t)$。设$X$是随机变量，对于$|t| \le h_1 \le h$，具有$mgf M(t)$。如果$\lim_{n \to \infty} M_{X_n}(t) = M(t)$，对于$|t| \le h_1$，那么$X_n \xrightarrow{D} X$。
>
> mgf的定义为$M_X(t) = E[e^{tX}]$。

我们有
$$
M_{Y_n}(t) = E(e^{tY_n}) = [(1-p) + pe^t]^n = \left[1+\frac{\mu(e^t-1)}{n}\right]^n
$$
注意到此时
$$
\lim_{n \to \infty} M_{Y_n}(t) = e^{\mu(e^t - 1)}
$$
这也就对应参数为 $\mu$ 的泊松分布。

（2）

此时我们发现n较大，也就是我们可以直接使用依分布收敛到的参数为 $\mu$ 的泊松分布来进行近似。

得到结果：
$$
P=e^{-2} + 2e^{-2} = 0.406
$$
**证毕。**

---

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$2$ 题$6$):**
>
> 设 $Z_n$ 服从 $\chi^2(n)$ 分布。$Z_n$ 的 $mgf$ 为 $M_{Z_n}(t)=(1-2t)^{-n/2}$，$t<1/2$。求随机变量 $Y_n=(Z_n-n)/\sqrt{2n}$ 的极限分布。

**解：**

注意到$Y_n$d的mgf为：
$$
M_{Y_n}(t) = E\left\{\exp\left[t\left(\frac{Z_n - n}{\sqrt{2n}}\right)\right]\right\} = e^{-tn/\sqrt{2n}} E\left(e^{tZ_n/\sqrt{2n}}\right)
$$

$$
= \exp\left[-\left(t\sqrt{\frac{2}{n}}\right)\left(\frac{n}{2}\right)\right]\left(1 - 2\frac{t}{\sqrt{2n}}\right)^{-n/2}, \quad t < \frac{\sqrt{2n}}{2}
$$

> [!NOTE]
>
> 卡方分布 $\chi^2(n)$ 的矩母函数（moment generating function, MGF）是一个标准结论：
>
> \[
> M_{Z_n}(t) = E(e^{tZ_n}) = (1 - 2t)^{-n/2}, \quad t < \frac{1}{2}
> \]
>

这可写成
$$
M_{Y_n}(t) = \left(e^{t\sqrt{2/n}} - t\sqrt{\frac{2}{n}}e^{t\sqrt{2/n}}\right)^{-n/2}, \quad t < \sqrt{\frac{n}{2}}
$$

的形式。依据泰勒公式，在$0$与$t\sqrt{2/n}$之间存在一个数$\xi(n)$，使得

$$
e^{t\sqrt{2/n}} = 1 + t\sqrt{\frac{2}{n}} + \frac{1}{2}\left(t\sqrt{\frac{2}{n}}\right)^2 + \frac{e^{\xi(n)}}{6}\left(t\sqrt{\frac{2}{n}}\right)^3
$$

如果用这个和代替上面$M_{Y_n}(t)$表达式中的$e^{t\sqrt{2/n}}$，可以看到
$$
M_{Y_n}(t) = \left(1 - \frac{t^2}{n} + \frac{\psi(n)}{n}\right)^{-n/2}
$$

其中

$$
\psi(n) = \frac{\sqrt{2}t^3 e^{\xi(n)}}{3\sqrt{n}} - \frac{\sqrt{2}t^3}{\sqrt{n}} - \frac{2t^4 e^{\xi(n)}}{3n}
$$

由于当$n \to \infty$时$\xi(n) \to 0$，所以对于每一个固定$t$值，$\lim \psi(n) = 0$。依据本节前面曾引述的极限命题，得出对于所有的实值，

$$
\lim_{n \to \infty} M_{Y_n}(t) = e^{t^2/2}
$$

也就是说，随机变量$Y_n = (Z_n - n)/\sqrt{2n}$服从极限标准正态分布。

**证毕。**

---

> #### **题目 ($2025$年$10$月$24$日数理统计第$13$讲作业$2$ 题$7$):**
>
> 如果 $X_n$ 依分布收敛于常数 $b$，那么 $X_n$ 依概率收敛于常数 $b$。

**解：**

需要证明$\forall \varepsilon>0$:
$$
\lim_{n\to \infin}P\{|X_n-b|\le\varepsilon\}=1
$$
此时我们有
$$
P\{|X_n-b|\le\varepsilon\}=F_n(b+\varepsilon)-F_n(b-\varepsilon)+P\{X_n=b-\varepsilon\}\ge F_n(b+\varepsilon)-F_n(b-\varepsilon/2)
$$
此时我们有
$$
\varliminf_{n\to \infin}P\{|X_n-b|\le\varepsilon\}\ge\varliminf_{n\to \infin}F_n(b+\varepsilon)+\varliminf_{n\to \infin}(-F_n(b-\varepsilon/2))\\
=1-0
$$
**证毕。**