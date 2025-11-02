# Week7a

## 半无界问题

对于波动方程：

在区域$\bar{Q} = \{0 \le x < \infty, 0 \le t < \infty\}$求解定解问题：

$$
\begin{cases}
\Box u
=\frac{\partial^2 u}{\partial t^2} - a^2 \frac{\partial^2 u}{\partial x^2}
=f(x,t), & 0<x<\infty, 0<t<\infty, \\
u|_{t=0}=\varphi(x), & 0\le x<\infty, \\
u_t|_{t=0}=\psi(x), & 0\le x<\infty, \\
u|_{x=0}=g(t), & t>0.
\end{cases}
\label{eq:2.35}
$$
当$g(t)\equiv 0$时，我们有结论：

当$x \ge at$时，

$$
u(x,t) = \frac{1}{2}[\varphi(x-at) + \varphi(x+at)]
$$

$$
+ \frac{1}{2a}\int_{x-at}^{x+at}\psi(\xi)d\xi + \frac{1}{2a}\int_0^t d\tau \int_{x-a(t-\tau)}^{x+a(t-\tau)}f(\xi,\tau)d\xi
\label{eq:2.38}
$$

当$x < at$时，

$$
u(x,t)= \frac{1}{2}[\varphi(x+at) - \varphi(at-x)]
$$

$$
+ \frac{1}{2a}\int_{at-x}^{x+at}\psi(\xi)d\xi
$$

$$
+ \frac{1}{2a}\int_{t-x/a}^t d\tau \int_{x-a(t-\tau)}^{x+a(t-\tau)}f(\xi,\tau)d\xi
$$

注意到我们有使得解表达式成立：

> 定理2.5 若$\varphi(x) \in C^2[0, \infty)$, $\psi(x) \in C^1[0, \infty)$, $f(x,t) \in C^1(\overline{Q})$，且适合相容性条件
> $$
> \begin{cases}
> \varphi(0)=0\\
> \psi(0)=0\\
> a^3\psi''(0)+f(0,0)=0
> \end{cases}
> $$
> ，那么半无界问题$(2.35)$必有解$u(x,t) \in C^2(\overline{Q})$，且由表达式给出。

![image-20251028105219060](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510281052207.png)

注意到我们通过转换，可以得到一个通式：

作函数代换：

$$
u = v + g(t)
\label{2.43}
$$

$v$在区域$\bar{Q}$上适合以下齐次边值的定解问题：

$$
\begin{cases}
\Box v = \Box u - \Box g(t) = f(x,t) - g''(t), \\
v(0,t) = 0, \\
v(x,0) = \varphi(x) - g(0), \\
v_t(x,0) = \psi(x) - g'(0).
\end{cases}
$$

因此$v(x,t)$可以由表达式给出。

> #### 定理$2.6$ 
>
> 若$g(t) \in C^3 [0,\infty)$, $\varphi(x) \in C^2 [0,\infty)$, $\psi(x) \in C^1 [0,\infty)$, $f(x,t) \in C^1(\bar{Q})$以及
> $$
> \varphi(0) = g(0), \psi(0) = g'(0), g''(0) - a^2\varphi''(0) = f(0,0),
> $$
>
> 则波动方程有解属于$C^2(\bar{Q})$。

