# Week6a

## 初值问题

## 2.1 问题的简化

在上半空间$\mathbb{R} \times [0,\infty)$上考虑波动方程的初值问题：

$$
\begin{cases}
\Box u = \frac{\partial^2 u}{\partial t^2} - a^2 \frac{\partial^2 u}{\partial x^2} = f(x,t), & \mathbb{R} \times (0,\infty), \\
u(x,0) = \varphi(x), & x \in \mathbb{R}, \\
u_t(x,0) = \psi(x), & x \in \mathbb{R}.
\end{cases}
\label{eq:2.1}
$$

由于定解问题($\ref{eq:2.1}$)是线性的，因此可以把它一分为三，使得在每一个定解问题中，方程和两个初始条件中只有一个是非齐次的。

$$
\begin{cases}
\Box u_1 = 0, & \mathbb{R} \times (0,\infty), \\
u_1(x,0) = \varphi(x), & x \in \mathbb{R}, \\
(u_1)_t(x,0) = 0, & x \in \mathbb{R};
\end{cases}
\label{eq:2.2}
$$

$$
\begin{cases}
\Box u_2 = 0, & \mathbb{R} \times (0,\infty), \\
u_2(x,0) = 0, & x \in \mathbb{R}, \\
(u_2)_t(x,0) = \psi(x), & x \in \mathbb{R};
\end{cases}
\label{eq:2.3}
$$

和

$$
\begin{cases}
\Box u_3 = f(x,t), & \mathbb{R} \times (0,\infty), \\
u_3(x,0) = 0, & x \in \mathbb{R}, \\
(u_3)_t(x,0) = 0, & x \in \mathbb{R}.
\end{cases}
\label{eq:2.4}
$$

由线性叠加原理，易见初值问题($\ref{eq:2.1}$)的解$u$可表示为

$$
u = u_1 + u_2 + u_3.
\label{eq:2.5}
$$

为了解出定解问题($\ref{eq:2.2}$)-($\ref{eq:2.4}$)，我们指出定解问题($\ref{eq:2.3}$)是基本的，其他两个定解问题的解可以通过它的解表出。我们将这一事实表达为一个定理：

> **定理 2.1** 设$u_2 = M_\psi(x,t)$是定解问题($\ref{eq:2.3}$)的解(这里$M_\psi$表示以$\psi$为初值的定解问题($\ref{eq:2.3}$)的解)，则定解问题($\ref{eq:2.2}$)，($\ref{eq:2.4}$)的解$u_1, u_3$可分别表为
> $$
> u_1 = \frac{\partial}{\partial t} M_\varphi(x,t),
> \label{eq:2.6}
> $$
>
> $$
> u_3 = \int_0^t M_f(x,t-\tau) d\tau,
> \label{eq:2.7}
> $$
>
> 其中$f_\tau = f(x,\tau)$，并且假定$M_\varphi(x,t)$和$M_f(x,t-\tau)$分别在区域$\{x \in \mathbb{R}, 0 \le t < \infty\}$和$\{x \in \mathbb{R}, 0 \le \tau \le t < \infty\}$上对变量$x,t$和$\tau$充分光滑。

有此定理，我们缩小我们求解问题为：
$$
\begin{cases}
\Box u_2 = 0, & \mathbb{R} \times (0,\infty), \\
u_2(x,0) = 0, & x \in \mathbb{R}, \\
(u_2)_t(x,0) = \psi(x), & x \in \mathbb{R};
\end{cases}
\label{吴迪}
$$
根据上一节的讨论，为了求解波动方程的初值问题$(2.1)$，我们只须去解一个特殊的初值问题$(2.3)$，即
$$
\begin{cases}
\Box u = \frac{\partial^2 u}{\partial t^2} - a^2 \frac{\partial^2 u}{\partial x^2} = 0, & -\infty < x < \infty, t > 0, \\
u(x,0) = 0, & -\infty < x < \infty, \\
u_t(x,0) = \psi(x), & -\infty < x < \infty.
\end{cases}
\label{eq:2.9}
$$
由于微分算子$\Box$可以分解为一阶算子的“乘积”，即：
$$
\Box = \left(\frac{\partial}{\partial t} + a \frac{\partial}{\partial x}\right)\left(\frac{\partial}{\partial t} - a \frac{\partial}{\partial x}\right),
$$
故我们可以把方程$\Box u = 0$分解为两个一阶方程：
$$
\frac{\partial u}{\partial t} - a \frac{\partial u}{\partial x} = v,
\label{eq:2.10}
$$
$$
\frac{\partial v}{\partial t} + a \frac{\partial v}{\partial x} = 0.
\label{eq:2.11}
$$
根据$\ref{eq:2.9}$的初始条件，我们也可以同时给出$u,v$在$t=0$上的初始条件
$$
u(x,0) = 0,
\label{eq:2.12}
$$
$$
v(x,0) = \frac{\partial u}{\partial t}\Big|_{t=0} - a \frac{\partial u}{\partial x}\Big|_{t=0} = \psi(x).
\label{eq:2.13}
$$
这样我们把定解问题$\ref{eq:2.9}$分解为两个一阶方程的初值问题$\ref{eq:2.10}$、$\ref{eq:2.12}$和$\ref{eq:2.11}$、$\ref{eq:2.13}$。

现在我们继续求解$\ref{eq:2.10}$、$\ref{eq:2.12}$，我们只需求特征线。

这里我们利用特征线，求解得到：
$$
u(x,t) = \int_0^t \psi(c - 2a\tau) d\tau
$$

$$
= -\frac{1}{2a} \int_c^{c-2at} \psi(\xi) d\xi = \frac{1}{2a} \int_{x-at}^{x+at} \psi(\xi) d\xi.
$$

因此我们得到
$$
\begin{cases}
\frac{\partial^2 u}{\partial t^2} - a^2 \frac{\partial^2 u}{\partial x^2} = f(x,t), & -\infty < x < \infty, t > 0, \\
u(x,0) = \varphi(x), & -\infty < x < \infty, \\
\frac{\partial u(x,0)}{\partial t} = \psi(x), & -\infty < x < \infty,
\end{cases}
\label{2.19}
$$

它的解可以表为
$$
\begin{aligned}
u(x,t) &= \frac{\partial}{\partial t} \left[ \frac{1}{2a} \int_{x-at}^{x+at} \varphi(\xi) d\xi \right] + \frac{1}{2a} \int_{x-at}^{x+at} \psi(\xi) d\xi \\
&+ \int_0^t \left[ \frac{1}{2a} \int_{x-a(t-\tau)}^{x+a(t-\tau)} f(\xi,\tau) d\xi \right] d\tau \\
&= \frac{1}{2} [\varphi(x+at) + \varphi(x-at)] + \frac{1}{2a} \int_{x-at}^{x+at} \psi(\xi) d\xi \\
&+ \frac{1}{2a} \int_0^t d\tau \int_{x-a(t-\tau)}^{x+a(t-\tau)} f(\xi,\tau) d\xi.
\end{aligned}
\label{2.20}
$$
当$f=0$，上述表达式称为 $D'Alembert$ 公式。到现在为止，表达式$\ref{2.20}$还只能说是形式解，因为我们还不知道，它是否具有足够的光滑性。为了使它确实是定解问题$\ref{2.19}$的解，我们需要对方程的非齐次项$f$和初值$\varphi, \psi$加上一定的要求。

> 定理$2.2$ 若$\varphi \in C^2(-\infty, \infty)$，$\psi \in C^1(-\infty, \infty)$及$f \in C^1(\bar{Q})$，这里$Q = \{(x,t) \mid -\infty < x < \infty, t > 0\}$，则由表达式$\ref{2.20}$给出的函数$u$属于$C^2(\bar{Q})$，且是定解问题$\ref{2.19}$的解。

自然我们有一个推论：

推论 若$\varphi$、$\psi$、$f$是$x$的偶(奇,周期)函数，则由表达式$\ref{2.19}$给出的解$u$亦必是$x$的偶(奇,周期)函数。

## 依赖区间、决定区域和影响区域

这里我们先假设解都为$D'Alembert$ 公式:
$$
u(x,t) = \frac{1}{2}[\varphi(x+at) + \varphi(x-at)] + \frac{1}{2a}\int_{x-at}^{x+at} \psi(\xi) d\xi.
$$
从上述表达式可以看出，对于上半平面内的任一固定点$(x, t)$，解在该点的值$u(x,t)$仅由$\varphi$在$x-at$和$x+at$两点及$\psi$在$[x-at,x+at]$上的值唯一确定，而与其他点上的初始条件无关。于是我们称$x$轴上的区间$[x-at,x+at]$为点$(x,t)$的**依赖区间**（见图$2.2$）。它是过$(x,t)$点分别作斜率为$\pm \frac{1}{a}$的直线与$x$轴相交所截得的区间。

对于$x$轴上的任一区间$[x_1, x_2]$，如果过点$x_1$作斜率为$\frac{1}{a}$的直线$x = x_1 + at$，过点$x_2$作斜率为$-\frac{1}{a}$的直线$x = x_2 - at$，它们和区间$[x_1, x_2]$一起围成一个三角形区域（见图$2.3$）。此三角形区域中任一点$(x, t)$的依赖区间都落在区间$[x_1, x_2]$中，因此解在此三角形区域中任一点的值都完全由区间$[x_1, x_2]$上的初始条件决定，而与此区间外的初始条件无关，这个区域称为区间$[x_1, x_2]$的**决定区域**。

![](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510141154624.png)

此外，任给$x$轴上的区间$[x_1, x_2]$，区域$E = \{(x,t) | x_1 - at \leq x \leq x_2 + at, t > 0\}$（见图$2.4$）中的任一点的依赖区间都与区间$[x_1, x_2]$的交不空，而不在$E$中的任一点的依赖区间与区间$[x_1, x_2]$的交为空集，由此我们称平面区域$E$为区间$[x_1, x_2]$的**影响区域**。其含义是说，$E$中任一点的函数值$u(x,t)$都要受到区间$[x_1, x_2]$上的初始条件的影响，尽管不一定能由该区间上的初值唯一确定；而在区域$E$外的点上的函数值$u(x,t)$与区间$[x_1, x_2]$上的初值无关。

![image-20251014115507400](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510141155560.png)

从上面的讨论中，我们看到$(x,t)$平面上斜率为$\pm\frac{1}{a}$的直线$x = c \pm at$在波动方程的研究中起着重要的作用（这里$c$为任意常数），它们称为波动方程的**特征线**。从$D'Alembert$公式可以看出，波动实际上是沿着特征线传播的，初始扰动的影响只在过扰动点的两根特征线的范围内（影响区域内）发生，由此可以看出，$a$就是波的**传播速度**。