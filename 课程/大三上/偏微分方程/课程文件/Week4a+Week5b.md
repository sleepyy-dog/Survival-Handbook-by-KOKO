# Week4a+Week5b

## 波动方程

### 特征线解法

这里首先考虑一下，最简单的情况

在上一章我们用质量守恒定律推导了运动流体的连续方程
$$
\frac{\partial \rho}{\partial t}+\nabla \cdot(\rho \boldsymbol{v})=0 .
$$
如果$\boldsymbol{v}(x, t)$为已知函数，则化为关于$\rho$的一个一阶线性偏微分方程
$$
\frac{\partial \rho}{\partial t}+\boldsymbol{v} \cdot \nabla \rho+(\nabla \cdot \boldsymbol{v}) \rho=0 .
$$
先考察最简单的情况：空间变量只有一个且速度$\boldsymbol{v}$为常数$a$，并在区域$\{-\infty<x<+\infty, t>0\}$上求解$Cauchy$问题
$$
\frac{\partial \rho}{\partial t}+a \frac{\partial \rho}{\partial x}=0,
\label{1.1}
$$


注：这里是假定速度方向沿x轴

接下来引入特征线的概念：

对于
$$
\rho(x, 0) = \rho_0(x),
$$
其中 $\rho_0(x)$ 为光滑函数。
我们称下列常微分方程初值问题
$$
\begin{cases}
\frac{dx}{dt} = a, \\
x(0) = c
\end{cases}
$$
的解 $x(t,c) = at + c$ 为方程 $\ref{1.1}$ 的特征线, 其中 $c$ 为常数. 沿着特征线 $x = x(t,c), \rho = \rho(x(t,c), t)$ 满足如下常微分方程
$$
\frac{d\rho}{dt} = \frac{\partial \rho}{\partial t} + \frac{\partial \rho}{\partial x}\frac{dx}{dt} = 0,
$$
即 $\rho(x, t)$ 沿着特征线 $x = x(t,c)$ 为常数.

由初值条件知在初始点 $x = c, t = 0$,
$$
\rho = \rho(x(0,c), 0) = \rho(c, 0) = \rho_0(c)
$$
从而
$$
\rho(x(t,c), t) = \rho_0(c).
$$
从特征线方程中解出 $c = x - at$, 代入上式消去 $c$ 得
$$
\rho(x,t) = \rho_0(x - at)
$$
从上述解的结构可以看出, 当 $t \ge 0$ 变化时, 初值仅仅简单不变地向右 (如果 $a > 0$) 或向左 (如果 $a < 0$) 以速度 $a$ 传播, 解 $\rho(x, t)$ 在特征线 $x - at = c$ 上为常数 $\rho_0(c)$.

更一般地，我们考察变系数方程
$$
\frac{\partial \rho}{\partial t} + \frac{\partial}{\partial x}(v(x)\rho) = 0
\label{eq:1.3}
$$
这里速度$v(x)$连续可微，且与时间$t$无关。将上述方程变形为
$$
\frac{\partial \rho}{\partial t} + v(x)\frac{\partial \rho}{\partial x} + v'(x)\rho = 0
$$
设曲线$x = x(t,c)$满足
$$
\begin{cases}
\frac{dx}{dt} = v(x(t)) \\
x(0) = c
\end{cases}
\label{eq:1.4}
$$
其中$c$为常数，这条积分曲线称为方程$\ref{eq:1.3}$的特征线。沿着特征线$x = x(t,c)$，$p = p(x(t,c),t)$满足
$$
\frac{d\rho}{dt} = -v'(x(t,c))\rho
\label{eq:1.5}
$$
$$
\rho|_{x=c,t=0} = \rho(x(0,c),0) = \rho(c,0) = \rho_0(c)
\label{eq:1.6}
$$
求解初值问题$\ref{eq:1.5}$、$\ref{eq:1.6}$，我们可以用线性常微分方程解法，得
$$
\begin{aligned}
\ln \rho(x(t,c),t) &= \ln \rho_0(c) + \int_0^t -v'(x(\tau,c))d\tau \\
&= \ln \rho_0(c) + \int_0^t \frac{-v'(x(\tau,c))}{v(x(\tau,c))} \frac{dx}{d\tau}d\tau \\
&= \ln \rho_0(c) + \int_c^{x(t,c)} \frac{-v'(x)}{v(x)}dx \\
&= \ln \rho_0(c) - \ln v(x(t,c)) + \ln v(c)
\end{aligned}
$$
上述第二个等式推演中，我们用到了特征线方程$\ref{eq:1.4}$，并假设$v(x) \neq 0$，从而有
$$
\rho(x(t,c),t) = \rho_0(c)\frac{v(c)}{v(x(t,c))}
\label{eq:1.7}
$$
如果从特征线方程$x=x(t,c)$解出$c=\varphi(x,t)$，代入$\ref{eq:1.7}$，便得到解的表达式
$$
\rho(x,t) = \rho_0(\varphi(x,t))\frac{v(\varphi(x,t))}{v(x)}
\label{eq:1.8}
$$

> [!NOTE]
>
> 首先对于一个问题，我们只有明确知道他是柯西方程，我们才可以使用这个公式来求解。

> #### 例：
>
> 求下列 $Cauchy$ 问题的解
> $$
> \frac{\partial u}{\partial t} + (x+t)\frac{\partial u}{\partial x} + u = x, x \in R^1, t>0,
> \label{eq:1.9}
> $$
> $$
> u(x,0) = x.
> \label{eq:1.10}
> $$

**解：**

第一步：求特征线，特征方程

$$
\begin{cases}
\frac{dx}{dt} = x+t, \\
x(0) = c
\end{cases}
$$
的解为
$$
x(t) = e^t(1+c) - (1+t).
\label{eq:1.11}
$$
第二步：令 $U(t) = u(x(t),t)$，则由$\ref{eq:1.9}$、$\ref{eq:1.10}$，
$$
\begin{cases}
\frac{dU(t)}{dt} + U(t) = e^t(1+c) - (1+t), \\
U(0) = u(x(0),0) = u(c,0) = c.
\end{cases}
$$
其解为
$$
U(t) = \frac{1}{2}(c+1)e^t + \frac{1}{2}(c-1)e^{-t}.
\label{eq:1.12}
$$
第三步：从$\ref{eq:1.11}$中解出
$$
c = (x+t+1)e^{-t}-1,
$$
然后代入$\ref{eq:1.12}$得所求的解为
$$
u(x,t) = \frac{1}{2}e^{-2t}(x+t+1) - e^{-t} + \frac{1}{2}(x-t+1).
$$
**证毕。**