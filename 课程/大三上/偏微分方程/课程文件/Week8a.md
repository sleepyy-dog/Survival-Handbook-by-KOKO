# Week8a

## 初值问题

我们的问题升级到三维：
$$
\begin{cases}
\frac{\partial^2 u}{\partial t^2} - a^2 \left( \frac{\partial^2 u}{\partial x_1^2} + \frac{\partial^2 u}{\partial x_2^2} + \frac{\partial^2 u}{\partial x_3^2} \right) = f(x,t), \mathbb{R}^3 \times (0,\infty), \\
u|_{t=0} = \varphi(x), \quad x \in \mathbb{R}^3, \\
u_t|_{t=0} = \psi(x), \quad x \in \mathbb{R}^3.
\end{cases}
$$
引入所谓的**球面平均法**：

首先注意到我们结论：

> 定理$2.1$ 设$u_2 = M_\psi(x,t)$是定解问题$(2.3)$的解(这里$M_\psi$表示以$\psi$为初值的定解问题$(2.3)$的解)，则定解问题$(2.2)$，$(2.4)$的解$u_1, u_3$可分别表为
> $$
> u_1 = \frac{\partial}{\partial t}M_\varphi(x,t),
> \label{eq:2.6}
> $$
> $$
> u_3 = \int_0^t M_{f_\tau}(x,t-\tau)d\tau,
> \label{eq:2.7}
> $$
> 其中$f_\tau = f(x,\tau)$，并且假定$M_\varphi(x,t)$和$M_{f_\tau}(x,t-\tau)$分别在区域$\{x \in \mathbb{R}, 0 \le t < \infty\}$和$\{x \in \mathbb{R}, 0 \le \tau \le t < \infty\}$上对变量$x, t$和$\tau$充分光滑。

对三维情况也是成立，因此我们还是可以将问题聚焦到
$$
\begin{cases}
\Box u_2 = 0, & \mathbb{R} \times (0, \infty), \\
u_2(x,0) = 0, & x \in \mathbb{R}, \\
(u_2)_t(x,0) = \psi(x), & x \in \mathbb{R};
\end{cases}
$$
省流：我们的解为：
$$
u(x,t) = \frac{\partial}{\partial t} \left[ \frac{1}{4\pi a^2 t} \iint_{S_{at(x)}} \varphi(y) \, dS \right] 
+ \frac{1}{4\pi a^2 t} \iint_{S_{at(x)}} \psi(y) \, dS 
+ \int_0^t \left[ \frac{1}{4\pi a^2 (t-\tau)} \iint_{S_{a(t-\tau)(x)}} f(y,\tau) \, dS \right] d\tau.
\label{Kirchhoff}
$$
上述公式称为 $Kirchhoff$ 公式。

其中，$S_{at}(0) = \{y \in \mathbb{R}^3 | |y| = at\}$。

> [!NOTE]
>
> 顺便回忆一下我们的$D'Alembert$公式：
>
> 我们原方程为
> $$
> u(x,t)= \frac{1}{2} \left[ \varphi(x + at) + \varphi(x - at) \right] + \frac{1}{2a} \int_{x-at}^{x+at} \psi(\xi) d\xi + \frac{1}{2a} \int_0^t d\tau \int_{x-a(t-\tau)}^{x+a(t-\tau)} f(\xi,\tau) d\xi.
> \label{2.20}
> $$
> 当$f\equiv 0$，有我们的$D'Alembert$公式：
> $$
> u(x,t)= \frac{1}{2} \left[ \varphi(x + at) + \varphi(x - at) \right] + \frac{1}{2a} \int_{x-at}^{x+at} \psi(\xi) d\xi
> $$

如果是一个二维情况：
$$
\begin{cases}
\frac{\partial^2 u}{\partial t^2} - a^2 \left( \frac{\partial^2 u}{\partial x_1^2} + \frac{\partial^2 u}{\partial x_2^2} \right) = f(x,t), \mathbb{R}^2 \times (0,\infty), \\
u \Big|_{t=0} = \varphi(x), \quad x \in \mathbb{R}^2, \\
u_t \Big|_{t=0} = \psi(x), \quad x \in \mathbb{R}^2.
\end{cases}
$$
此时我们有可以降维解决。