# Week1b

## 一维波动方程的定解条件

为从波动方程的通解中确定一个具体问题的解，需要引入初始条件和边界条件，这些条件统称为**定解条件**。求解满足定解条件的偏微分方程问题称为**定解问题**。

### 初始条件

初始条件指定了弦在初始时刻 $t=0$ 的状态，即弦上各点的位移和速度。

> #### **定义: 初始条件**
>
> $$
> u(x,0)=\varphi(x), \quad (0\leq x\leq l)
> $$
> $$
> u_t(x,0)=\psi(x), \quad (0\leq x\leq l)
> $$
> 其中，初始位移函数 $ \varphi(x) $ 和初始速度函数 $ \psi(x) $ 为已知函数。

### 边界条件

边界条件描述了弦在两个端点 $x=0$ 和 $x=l$ 处的行为。常见的边界条件有以下三类：

> #### **1. 第一类边界条件 (Dirichlet 条件):**
>
> 已知弦两端随时间的位移变化函数：
> $$
> u(0,t)=g_1(t), \quad u(l,t)=g_2(t), \quad (t\geq 0)
> $$
> 这种边界条件直接规定了端点的位置。
>
> > [!NOTE]
> >
> > 一个重要的特例是**固定端边界条件**，此时端点位移为零，即 $g_1(t) \equiv 0$ 且 $g_2(t) \equiv 0$。

> #### **2. 第二类边界条件 (Neumann 条件):**
>
> 已知弦两端所受的垂直于弦线的外力：
> $$
> -T\frac{\partial u}{\partial x}\bigg|_{x=0}=g_1(t), \quad T\frac{\partial u}{\partial x}\bigg|_{x=l}=g_2(t), \quad (t\geq 0)
> $$
> 这里 $T$ 是弦的张力大小。该条件描述了端点处的受力情况。
>
> > [!NOTE]
> >
> > 一个重要的特例是**自由端边界条件**，此时端点不受外界垂直外力作用，即 $g_1(t) \equiv 0$ 且 $g_2(t) \equiv 0$。这意味着弦在端点的切线斜率为零，即 $\frac{\partial u}{\partial x}=0$。

> #### **3. 第三类边界条件 (Robin 条件):**
>
> 已知端点位移与所受外力的线性组合关系：
> $$
> -T\frac{\partial u}{\partial x}\bigg|_{x=0}+\alpha_1u(0,t)=g_1(t), \quad (t\geq 0)
> $$
> $$
> T\frac{\partial u}{\partial x}\bigg|_{x=l}+\alpha_2u(l,t)=g_2(t), \quad (t\geq 0)
> $$
> 其中 $\alpha_1, \alpha_2 > 0$ 是弹性系数。这种边界条件通常用于描述弦的端点连接在弹性支承（例如弹簧）上的物理情景。在齐次情况（$g_1=g_2=0$）下，端点受到的弹性恢复力与张力的垂直分量相平衡。

---

## 高维波动方程的混合问题

对于高维空间中的波动问题，我们同样可以提出类似的定解问题，通常称为混合问题或初边值问题。

设 $\Omega$ 是 $\mathbb{R}^n$ 空间中的有界开域，其边界为 $\partial\Omega$。我们考虑在时空柱体 $Q=\Omega\times(0,\infty)$ 上求解波动方程，其侧表面为 $\Sigma=\partial\Omega\times(0,\infty)$。

### 初始条件

在柱体的下底面 $\Omega$（即 $t=0$ 时刻），给定初始位移和初始速度：
$$
u\big|_{t=0}=\varphi(x_1,\cdots,x_n), \quad x \in \Omega
$$
$$
u_t\big|_{t=0}=\psi(x_1,\cdots,x_n), \quad x \in \Omega
$$

### 边界条件

在柱体的侧表面 $\Sigma$ 上，必须满足以下三种边界条件之一：

> #### **1. 第一类边界条件 (Dirichlet 条件):**
>
> 直接指定边界上的位移值。
> $$
> u\big|_{\Sigma}=g(x_1,\cdots,x_n,t)
> $$

> #### **2. 第二类边界条件 (Neumann 条件):**
>
> 指定边界上沿外法线方向的方向导数，与通量相关。
> $$
> \frac{\partial u}{\partial n}\bigg|_{\Sigma}=g(x_1,\cdots,x_n,t)
> $$
> 其中 $n$ 是边界 $\partial\Omega$ 的单位外法向量。

> #### **3. 第三类边界条件 (Robin 条件):**
>
> 指定边界上函数值与法向导数的线性组合。
> $$
> \left(\frac{\partial u}{\partial n}+\alpha u\right)\bigg|_{\Sigma}=g(x_1,\cdots,x_n,t)
> $$
> 其中 $\alpha > 0$ 是一个正常数。

---

## 热传导方程的推导

热传导方程可以通过能量守恒定律推导得出。考虑一个任意区域 $D$，其内部热量变化率等于通过边界 $\partial D$ 流入的热量与内部热源产生的热量之和。

在时间间隔 $[t_1, t_2]$ 内，区域 $D$ 内热量的增量为：
$$
\Delta Q = \iiint_D c\rho(u\big|_{t=t_2}-u\big|_{t=t_1})dxdydz = \int_{t_1}^{t_2}dt\iiint_D c\rho\frac{\partial u}{\partial t}dxdydz
$$
根据傅里叶热传导定律，热流密度矢量 $q$ 与温度梯度 $\nabla u$ 的关系为 $q = -k\nabla u$。因此，单位时间流出区域 $D$ 的热量为 $\oint_{\partial D} q \cdot n dS = -\oint_{\partial D} k \frac{\partial u}{\partial n} dS$。

设 $F(x,y,z,t)$ 为单位时间单位体积内热源产生的热量，则能量守恒定律的积分形式为：
$$
\int_{t_1}^{t_2}dt\iiint_D c\rho\frac{\partial u}{\partial t}dxdydz = \int_{t_1}^{t_2}dt\oint_{\partial D}k\frac{\partial u}{\partial n}dS+\int_{t_1}^{t_2}dt\iiint_D F dxdydz
$$
应用奥斯特罗格拉德斯基-高斯公式（散度定理）将面积分转化为体积分：
$$
\oint_{\partial D}k\frac{\partial u}{\partial n}dS = \iiint_D \nabla\cdot(k\nabla u)dxdydz
$$
代入后得到：
$$
\int_{t_1}^{t_2}dt\iiint_D c\rho\frac{\partial u}{\partial t}dxdydz = \int_{t_1}^{t_2}dt\iiint_D[\nabla\cdot(k\nabla u)+F]dxdydz
$$
由于被积函数连续，且时间区间 $[t_1, t_2]$ 和空间区域 $D$ 的任意性，两边的被积函数必须相等：
$$
c\rho\frac{\partial u}{\partial t} = \nabla\cdot(k\nabla u)+F
$$
对于均匀各向同性的介质，$c$（比热容）、$\rho$（密度）、$k$（热导率）均为常数。此时方程简化为：
$$
c\rho\frac{\partial u}{\partial t} = k\Delta u+F
$$
整理后得到标准的热传导方程（或扩散方程）：
$$
\frac{\partial u}{\partial t}-a^2\Delta u=f
$$
其中，$a^2 = \frac{k}{c\rho}$ 称为热扩散率（或导温系数），$f = \frac{F}{c\rho}$ 是归一化的热源项。
