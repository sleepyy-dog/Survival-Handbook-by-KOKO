# Week7b

## 郑博引 23339147

> #### **题目 (题$1$):**
>
> 设 $T_n$ 服从自由度为 $n$ 的 $t$ 分布，$n=1,2,3,\dots$。因而，$T_n$ 的 $pdf$ 是
> $$
> f_n(y)=\frac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n\pi}\,\Gamma\!\left(\frac{n}{2}\right)}\cdot\frac{1}{\left(1+\frac{y^2}{n}\right)^{(n+1)/2}},\quad -\infty<y<+\infty.
> $$
> 证明：通过求 $T_n$ 的 $pdf$ 极限确定其极限分布。
> 提示：$\Gamma(x+1)=x\Gamma(x)$，$\Gamma(1)=1$，$\Gamma\!\left(\frac{1}{2}\right)=\sqrt{\pi}$；对正整数 $n$，有 $\Gamma(n+1)=n!$，以及 $\Gamma(1-x)\Gamma(x)=\dfrac{\pi}{\sin(\pi x)}$。

**解：**

注意到：
$$
F_n(y)=\int_{-\infin}^y\frac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n\pi}\,\Gamma\!\left(\frac{n}{2}\right)}\cdot\frac{1}{\left(1+\frac{t^2}{n}\right)^{(n+1)/2}}dt
$$
此时由
$$
|f_n(y)|\le 10f_1(y)
$$

> [!NOTE]
>
> 让ai给了上式的证明(**考试可以直接用这个结论吗？？**)：
> 下面给出一个简单而完整的推导，说明为什么对所有 n≥1、y∈R，都有一个统一常数 C（例如 10）使得
> $$
> f_n(y)\le C\,f_1(y).
> $$
> 事实上我们还能给出更紧的常数。
>
> 1) 先把比值写出来
> 记 $f_n(y)=\dfrac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{\pi n}\,\Gamma\!\left(\frac n2\right)}\Big(1+\frac{y^2}{n}\Big)^{-\frac{n+1}{2}}$，而
> $f_1(y)=\dfrac{1}{\pi(1+y^2)}$（柯西密度）。于是
> $$
> \frac{f_n(y)}{f_1(y)}
> = \underbrace{\frac{\sqrt{\pi}\,\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n}\,\Gamma\!\left(\frac n2\right)}}_{=:A_n}
> \cdot
> \underbrace{\frac{1+y^2}{\left(1+\frac{y^2}{n}\right)^{\frac{n+1}{2}}}}_{=:B_{n}(y)}.
> $$
>
> 2) 估计 y-相关部分 $B_n(y)$
> 用伯努利不等式 $(1+u)^a\ge 1+au$（$u\ge0,\,a\ge1$），对 $u=\frac{y^2}{n}$、$a=\frac{n+1}{2}$ 得
> $$
> \Big(1+\frac{y^2}{n}\Big)^{\frac{n+1}{2}}
> \ge 1+\frac{n+1}{2}\cdot\frac{y^2}{n}\ge 1+\frac{y^2}{2}.
> $$
> 于是
> $$
> B_n(y)=\frac{1+y^2}{\left(1+\frac{y^2}{n}\right)^{\frac{n+1}{2}}}
> \le \frac{1+y^2}{1+\frac{y^2}{2}}\le 2,
> $$
> 其中最后一步对所有 $y$ 都成立，且上界 2 是统一的（与 n 无关）。
> （如果愿意更紧一些，用微分找极值可得对 n>1，$B_n(y)$ 在 $y=1$ 处最大，且
> $B_n(y)\le \dfrac{2}{(1+1/n)^{(n+1)/2}}\le \dfrac{2}{\sqrt{e}}<1.214$。）
>
> 3) 估计常数部分 $A_n$
> 利用经典的不等式（Gautschi/Wendel 不等式的特例）：对 $x>0$ 有
> $$
> \frac{\Gamma\!\left(x+\tfrac12\right)}{\Gamma(x)}\le \sqrt{x}.
> $$
> 取 $x=\frac n2$，得到
> $$
> A_n=\frac{\sqrt{\pi}\,\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n}\,\Gamma\!\left(\frac n2\right)}
> \le \frac{\sqrt{\pi}\,\sqrt{\frac n2}}{\sqrt{n}}
> =\sqrt{\frac{\pi}{2}}.
> $$
>
> 4) 合并得到统一上界
> 由 2) 和 3) 立刻得
> $$
> \frac{f_n(y)}{f_1(y)} \le \sqrt{\frac{\pi}{2}}\cdot 2=\sqrt{2\pi}\approx 2.5066<10,
> $$
> 即
> $$
> |f_n(y)|=f_n(y)\le \sqrt{2\pi}\,f_1(y)\le 10\,f_1(y),\quad \forall\,n\ge1,\,y\in\mathbb R.
> $$
>
> 说明：
> - 这里取常数 10 只是“宽松且统一”的上界，用于应用勒贝格控制收敛定理；事实上更紧的常数是 $\sqrt{2\pi}$，甚至用第 2) 中更精细的 $B_n(y)\le 2/\sqrt{e}$ 可得统一上界约为 $1.5203$。
> - 由于 $f_1$ 是柯西密度（可积），以上支配即可确保极限与积分交换成立。
> - 若你需要，我可以给出“$\,\Gamma(x+\tfrac12)/\Gamma(x)\le \sqrt{x}\,$”的不等式证明或参考。

依此，我们可以交换积分求极限，也就是
$$
\lim_{n\to \infin}F_n(y)=\lim_{n\to \infin}\int_{-\infin}^y\frac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n\pi}\,\Gamma\!\left(\frac{n}{2}\right)}\cdot\frac{1}{\left(1+\frac{t^2}{n}\right)^{(n+1)/2}}dt\\
=\int_{-\infin}^y\lim_{n\to \infin}\frac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n\pi}\,\Gamma\!\left(\frac{n}{2}\right)}\cdot\frac{1}{\left(1+\frac{t^2}{n}\right)^{(n+1)/2}}dt\\
=\int_{-\infin}^y\lim_{n\to \infin}\frac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n\pi}\,\Gamma\!\left(\frac{n}{2}\right)}\cdot\frac{1}{\left(1+\frac{t^2}{n}\right)^{1/2}}\frac{1}{\left(1+\frac{t^2}{n}\right)^{n/2}}dt\\
$$
这里我们由
$$
\Gamma(k+1) \approx \sqrt{2\pi}k^{k+1/2}e^{-k}
$$
知
$$
\lim_{n\to \infin}\frac{\Gamma\!\left(\frac{n+1}{2}\right)}{\sqrt{n\pi}\,\Gamma\!\left(\frac{n}{2}\right)}=
= \lim_{n \to \infty} \left\{ \frac{\Gamma[(n+1)/2]}{\sqrt{n/2}\Gamma(n/2)} \right\}\frac{1}{\sqrt{2\pi}}=\frac{1}{\sqrt{2\pi}}
$$
同时注意到第二项极限也为1，则知我们只需要求第三项，注意到
$$
\lim_{n \to \infty} \left\{  \left[ \left( 1 + \frac{y^2}{n} \right) \right]^{-n/2} \right\}=e^{-y^2/2}
$$
知
$$
\lim_{n \to \infty} F_n(t) = \int_{-\infty}^{t} \frac{1}{\sqrt{2\pi}} e^{-y^2/2} dy
$$
**证毕。**

---

> #### **题目 (题$2$):**
>
> 如果 $X_n$ 依概率收敛于 $X$，求证：$X_n$ 依分布收敛于 $X$。

**解：**

证：设$x$是$F_X(x)$的连续点，设$\varepsilon \ge 0$，得出
$$
F_{X_n}(x) = P[X_n \le x]
$$
$$
= P[\{X_n \le x\} \cap \{|X_n - X| < \varepsilon\}] + P[\{X_n \le x\} \cap \{|X_n - X| \ge \varepsilon\}]
$$
$$
\le P[X \le x + \varepsilon] + P[|X_n - X| \ge \varepsilon]
$$
依据这个不等式与$X_n \xrightarrow{P} X$的事实，可以看到（这里还需要用一下$\varlimsup_{n \to \infty}(a_n + b_n) \le \varlimsup_{n \to \infty}a_n + \varlimsup_{n \to \infty}b_n$）
$$
\varlimsup_{n \to \infty} F_{X_n}(x) \le F_X(x + \varepsilon)
\label{eq:5.2.5}
$$
为了达到下界，对其余内容可进行类似处理，从而证明
$$
P[X_n > x] \le P[X > x - \varepsilon] + P[|X_n - X| \ge \varepsilon]
$$
即
$$
1-P[X_n \le x] \le 1-P[X \le x - \varepsilon] + P[|X_n - X| \ge \varepsilon]
$$
知：
$$
F_n(x)=P[X_n \le x] \ge P[X \le x - \varepsilon] - P[|X_n - X| \ge \varepsilon]
$$
注意我们有
$$
\varliminf_{n \to \infty}(a_n + b_n) \ge \varliminf_{n \to \infty}a_n + \varliminf_{n \to \infty}b_n.
$$
因此，
$$
\varliminf_{n \to \infty} F_{X_n}(x) \ge F_X(x - \varepsilon)
\label{eq:5.2.6}
$$
利用$\varliminf$与$\varlimsup$之间关系，由式$\ref{eq:5.2.5}$与式$\ref{eq:5.2.6}$可得
$$
F_X(x - \varepsilon) \le \varliminf_{n \to \infty} F_{X_n}(x) \le \varlimsup_{n \to \infty} F_{X_n}(x) \le F_X(x + \varepsilon)
$$
**证毕。**

---

> #### **题目 (题$3$):**
>
> （源自均匀分布样本的极大值，续）设 $X_1,X_2,\dots,X_n$ 是源自均匀分布 $U(0,\theta)$ 的随机样本。假定 $\theta$ 为未知的，样本的极大值为
> $$
> Y_n=\max\{X_1,X_2,\dots,X_n\}.
> $$
> 求证：$Z_n=n(\theta-Y_n)$ 依分布收敛于 $Z$，其中 $Z\sim\mathrm{Exp}(1/\theta)$。

**解：**
设$t \in (0, n\theta)$。于是，利用$Y_n$的$cdf$，则$Z_n$的$cdf$是
$$
P[Z_n \le t] = P[Y_n \ge \theta - (t/n)] = 1 - \left(\frac{\theta - (t/n)}{\theta}\right)^n = 1 - \left(1 - \frac{t}{n\theta}\right)^n \to 1 - e^{-t/\theta}
$$
得到$Z_n \xrightarrow{D} Z$，其中$Z$服从分布$\exp(1/\theta)$。

**证毕。**

---

> #### **题目 (题$4$):**
>
> 设 $X_n$ 具有 $cdf$
> $$
> F_n(x)=\int_{-\infty}^{x}\sqrt{\frac{n}{2\pi}}\,e^{-\,\frac{n w^{2}}{2}}\,dw,
> $$
> 而 $X$ 具有 $cdf$
> $$
> F(x)=
> \begin{cases}
> 0, & x<0,\\[4pt]
> 1, & x\ge 0.
> \end{cases}
> $$
> 求证：序列 $X_1,X_2,X_3,\dots$ 依分布收敛到在 $x=0$ 处具有退化分布的随机变量 $X$。

**解：**

注意到我们有
$$
F_n(x)=\int_{-\infty}^{\sqrt{n}x}\sqrt{\frac{1}{2\pi}}\,e^{-\,t^2/2}\,dt,
$$
此时注意到
$$
\lim_{n\to \infin}F_n(x)=
\begin{cases}
1,x>0\\
\frac{1}{2},x=0\\
0,x<0
\end{cases}
$$
注意知$\{x|\ |x|\ne 0\}$为连续点，在这个点集上与
$$
F(x)=
\begin{cases}
1,x\ge0\\
0,x<0
\end{cases}
$$
相等，则知得证。

**证毕。**