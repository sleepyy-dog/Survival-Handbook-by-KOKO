# Week6b

## 能量不等式

> 我们仍旧着重考虑波动方程的解：
>
> 在上半空间$\mathbb{R} \times [0, \infty)$上考虑波动方程的初值问题：
>
> $$
> \begin{cases}
> \Box u = \frac{\partial^2 u}{\partial t^2} - a^2 \frac{\partial^2 u}{\partial x^2} = f(x,t), & \mathbb{R} \times (0,\infty), \\
> u(x,0) = \varphi(x), & x \in \mathbb{R}, \\
> u_t(x,0) = \psi(x), & x \in \mathbb{R}.
> \end{cases}
> $$
> 

设$(x_0, t_0)$为上半平面$Q$内任一点，通过这点向下作两条特征线$x = x_0 \pm a(t_0 - t)$，这两条特征线与$x$轴围成的三角形区域称为以$(x_0, t_0)$点为顶点的**特征锥**，我们记之为$\textbf{K}$。分析可知$u$在$(x_0, t_0)$点的值只依赖于$\varphi$、$\psi$在依赖区间$[x_0 - at_0, x_0 + at_0]$上的值以及$f$在特征锥$K$上的值，也就是说$u$在$(x_0, t_0)$点的值由$\varphi$、$\psi$、$f$在$K$上的值唯一确定。

我们有定理：

> 定理$2.3$ (能量不等式)设$u \in C^1(\bar{Q}) \cap C^2(Q)$是定解问题$(2.1)$的解，则有估计
> $$
> \int_{\Omega_{\tau}} [u_t^2(x,\tau) + a^2 u_x^2(x,\tau)] dx \le M \left[ \int_{\Omega_0} (\psi^2 + a^2 \varphi_x^2) dx + \iint_{K_{\tau}} f^2(x,t) dxdt \right]
> \label{eq:2.21}
> $$
> $$
> \iint_{K_{\tau}} [u_t^2(x,t) + a^2 u_x^2(x,t)] dxdt \le M \left[ \int_{\Omega_0} (\psi^2 + a^2 \varphi_x^2) dx + \iint_{K_{\tau}} f^2(x,t) dxdt \right]
> \label{eq:2.22}
> $$
> 其中
> $$
> 0 \le \tau \le t_0,
> $$
> $$
> K_{\tau} = K \cap \{0 \le t \le \tau\},
> $$
> $$
> \Omega_{\tau} = K \cap \{t = \tau\} = (x_0 - a(t_0 - \tau), x_0 + a(t_0 - \tau)),
> $$
> $$
> M = e^{t_0}.
> $$

此时令

$$
G(\tau) = \iint_{K_\tau} \left[ \left(\frac{\partial u}{\partial t}\right)^2 + a^2 \left(\frac{\partial u}{\partial x}\right)^2 \right] dx dt
$$

$$
= \int_0^\tau \left[ \int_{x_0-a(t_0-t)}^{x_0+a(t_0-t)} \left( \left(\frac{\partial u}{\partial t}\right)^2 + a^2 \left(\frac{\partial u}{\partial x}\right)^2 \right) dx \right] dt
$$

可以得到一个$G(\tau)$满足的微分不等式：

$$
\frac{dG(\tau)}{d\tau} \le G(\tau) + F(\tau),
\label{2.29}
$$

其中$F(\tau) = \int_{x_0} (\psi^2 + a^2 \varphi_x^2) dx + \iint_{K_\tau} f^2 dx dt$，它是$\tau$的单调增加函数。
为了求解微分不等式$\ref{2.29}$，也为以后的需要，下面我们先证明一个常用的不等式：

> 引理 $2.4(Gronwall$不等式$)$ 若非负函数$G(\tau)$在$[0,T]$上连续可微，$G(0)=0$，且对$\tau \in [0,T]$，有
> $$
> \frac{dG(\tau)}{d\tau} \le CG(\tau) + F(\tau),
> $$
> 其中$C>0$为常数，$F(\tau)$为$[0,T]$上不减的非负可积函数，则
> $$
> \frac{dG(\tau)}{d\tau} \le e^{C\tau}F(\tau),
> $$
> $$
> G(\tau) \le C^{-1}(e^{C\tau}-1)F(\tau).
> $$