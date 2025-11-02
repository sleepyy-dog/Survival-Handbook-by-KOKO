# Week3b

> 主要篇幅讨论以下三个基本偏微分方程：
>
> $$
> \frac{\partial^2 u}{\partial t^2} - a^2 \Delta u = f \quad \text{（波动方程）}
> $$
>
> $$
> \frac{\partial u}{\partial t} - a^2 \Delta u = f \quad \text{（热传导方程）}
> $$
>
> $$
> -\Delta u = f \quad \text{（位势方程）}
> $$
>
> 其中，$\Delta$ 为拉普拉斯算符（Laplace Operator），定义为 $\Delta = \sum_{i=1}^{n} \frac{\partial^2}{\partial x_i^2}$；$f$ 是 $(x_1, \dots, x_n)$ 或 $(x_1, \dots, x_n, t)$ 的函数；$a^2$ 是一个正常数。分别描述了波动、扩散和稳态这三种截然不同的物理过程。

## 变分原理

变分原理

我们知道，实函数是从实数域到实数域的映射。如果将函数的定义域扩大为某种集合，值域不变，即从一个集合到实数的映射称为泛函。例如将$[a,b]$区间上的全体连续函数记为$C([a,b])$，则$\forall f(x) \in C([a,b])$，映射

$$
f(x) \rightarrow \int_{a}^{b} f(x) dx
$$

就是定义在$C([a,b])$上的一个泛函。所谓变分问题就是求某一特定泛函在定义域内的极值。

> 定义$2.1$设$\Omega$为$\mathbb{R}^{2}$中的区域，定义在$\Omega$上的无穷次可微且在$\Omega$的边界附近为零的函数的全体，记为$C_{0}^{\infty}(\Omega)$。

注：区域是开的

> 定义$2.1$ 设$\Omega$为$R^2$中的区域，定义在$\Omega$上的无穷次可微且在$\Omega$的边界附近为零的函数的全体，记为$C_0^\infty(\Omega)$。
> 例 函数
> $$
> \rho(x,y) = \begin{cases} ke^{-1/[1-(x^2+y^2)]}, & x^2+y^2 < 1, \\ 0, & x^2+y^2 \ge 1 \end{cases}
> $$
> 属于$C_0^\infty(R^2)$，其中$k$为常数，我们可以选取$k$使得
> $$
> \iint_{R^2} \rho(x,y) dxdy = 1.
> $$
> 又定义
> $$
> \rho_n(x,y) = n^2\rho(nx,ny) \quad (n > 0),
> $$
> 则
> $$
> \rho_n(x,y) \in C_0^\infty(R^2),
> $$
> $$
> \iint_{R^2} \rho_n(x,y) dxdy = 1,
> $$
> 且当$\sqrt{x^2+y^2} \ge \frac{1}{n}$时，$\rho_n(x,y) = 0$。

> 引理$2.1$设$\Omega$为$R^2$中有界区域，$f(x,y)$在$\Omega$上连续，如果
> $\forall \varphi(x,y) \in C_0^\infty(\Omega)$，
>
> $$
> \iint f(x,y)\varphi(x,y) dxdy = 0
> \label{eq:2.1}
> $$
>
> 则$f(x,y)$在$\Omega$上恒为零。
>
> 证明 反证法。若不然，存在$(x_0,y_0) \in \Omega$，使得$f(x_0,y_0) \neq 0$，
> 不妨设$f(x_0,y_0)>0$。由于$f(x,y)$在$\Omega$上连续，于是存在以$(x_0,y_0)$
> 为心的$\delta$邻域$\bar{B}_\delta \subset \Omega$，使得
>
> $$
> f(x,y)>0, \quad \forall (x,y) \in B_\delta.
> $$
>
> 对于上述$\delta$，选取$n$，使得$\frac{1}{n} \le \delta$，则在$\ref{eq:2.1}$中取
>
> $$
> \varphi(x,y) = \rho_n(x-x_0,y-y_0) \in C_0^\infty(\Omega),
> $$
>
> 于是
>
> $$
> 0 = \iint f(x,y)\varphi(x,y)dxdy
> $$
>
> $$
> = \iint_{B_\delta} f(x,y)\rho_n(x-x_0,y-y_0)dxdy > 0,
> $$
>
> 这个矛盾说明引理结论成立。

这里注意一下$\varphi(x,y)$是任取的。

比较难理解的是
$$
\varphi(x, y) = \rho_n(x - x_0, y - y_0) \in C_0^\infty(\Omega)
$$
但是事实上，我们由于$\rho_n(x , y )$在零点附近的以$\frac{1}{n}$为半径的圆积分为1.自然得到$\rho_n(x - x_0, y - y_0)$以$\bar{B}_{\delta}$上积分为1，自然知道在$\Omega$上积分为1，即$\varphi(x,y) \in C_0^{\infin}(\Omega)$，从而得到结论。

### 极小曲面问题



考虑平面上有界区域$\Omega$(在这一节中我们永远假定$\Omega$的边界充分光滑)，在边界$\partial\Omega$上给定一条空间闭曲线
$$
l:
\begin{cases}
x=x(s), \\
y=y(s), & (0 \le s \le s_0) \\
u=\varphi(s)
\end{cases}
$$
(这里$x=x(s)$, $y=y(s)$为平面曲线$\partial\Omega$的方程，$x(0)=x(s_0)$, $y(0)=y(s_0)$, $\varphi(0)=\varphi(s_0)$)。求一张定义在$\overline{\Omega}$上的曲面$S$，使得
a. $S$以$l$为周界；
b. $S$的表面积最小。
换言之，在所有定义在$\overline{\Omega}$上并以$l$为周界的曲面中，要寻求一张曲面，使它的表面积最小，即给定函数集合
$$
M_{\varphi} = \{v|v \in C^1(\overline{\Omega}), v|_{\partial\Omega} = \varphi\},
$$
求$u \in M_{\varphi}$，使得
$$
J(u) = \min_{v \in M_{\varphi}} J(v)
\label{eq:2.2}
$$
其中
$$
J(v) = \iint_{\Omega} \sqrt{1+v_x^2+v_y^2}dxdy
\label{eq:2.3}
$$
这里$J(v)$称为定义在函数集合$M_{\varphi}$上的泛函，$J: M_{\varphi} \longrightarrow \mathbb{R}$ ($J$是一个从$M_{\varphi}$到实数轴的映射)，$u$是泛函$J(v)$在集合$M_{\varphi}$上达到极小值的“点”。这样一个求泛函的极值问题称为变分问题。函数集合称为变分问题($\ref{eq:2.2}$)的允许函数类，或称为泛函$J(v)$的定义域。$u$称为变分问题($\ref{eq:2.2}$)的解。

可以得到我们的一个等价条件
$$
\frac{\partial}{\partial x}\left(\frac{u_x}{\sqrt{1 + u_x^2 + u_y^2}}\right) + \frac{\partial}{\partial y}\left(\frac{u_y}{\sqrt{1 + u_x^2 + u_y^2}}\right) = 0.
$$
被称为变分问题的**Euler方程**。

化简为
$$
(1 + u_y^2) u_{xx} - 2u_x u_y \cdot u_{xy} + (1 + u_x^2) u_{yy} = 0.
$$
如果在$u_{x},u_{y}$极小的时候，我们就可以将方程化为线性方程：
$$
u_{xx}+u_{yy}=0
$$



