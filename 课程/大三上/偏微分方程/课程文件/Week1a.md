![image-20250911102602470](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509111026568.png)

初始条件　即必须给出弦上各点在初始时刻$t=0$的位移和速度：

$$u(x,0)=\varphi(x)\quad(0\leq x\leq l),$$

$$u_t(x,0)=\psi(x)\quad(0\leq x\leq l),\quad(1.6)$$

这里$\varphi(x)$，$\psi(x)$为已知函数。

边界条件　一般说来有三种。

1. 已知端点的位移变化，即

$$u(0,t)=g_1(t),\quad u(l,t)=g_2(t)\quad(t\geq 0),\quad(1.7)$$

特别当$g_1(t)=g_2(t)=0$时，称弦线具有固定端。

2. 已知在端点所受的垂直于弦线的外力的作用，即

$$-T\frac{\partial u}{\partial x}\bigg|_{x=0}=g_1(t),$$

$$T\frac{\partial u}{\partial x}\bigg|_{x=l}=g_2(t)\quad(t\geq 0),\quad(1.8)$$

特别当$g_1(t)=g_2(t)=0$时，称弦线具有自由端。

3. 已知端点的位移与所受外力的作用的一个线性组合

$$-T\frac{\partial u}{\partial x}\bigg|_{x=0}+\alpha_1u(0,t)=g_1(t),$$

$$T\frac{\partial u}{\partial x}\bigg|_{x=l}+\alpha_2u(l,t)=g_2(t)\quad(t\geq 0),\quad(1.9)$$

$\alpha_i>0,i=1,2$，特别当$g_1(t)=g_2(t)=0$时，表示弦的两端固定在

注意二中有所等价

而对于**自由端**，没有力的作用，应当为无外力情况，但是绳上还有力。

![image-20250911103053870](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509111030954.png)

弹性支承上，$\alpha_i(i=1,2)$分别表示支承的弹性系数。事实上（以左端点为例），根据作用力与反作用力的关系，弦对弹性支承的力为

$T\frac{\partial u}{\partial x}\bigg|_{x=0}$，而弹性支承的伸长为$u(0,t)$，由胡克（$Hooke$）定律知

$T\frac{\partial u}{\partial x}\bigg|_{x=0}=\alpha_1u(0,t)$，此即(1.9)中的第一表达式。

这种情况可以理解为两端被固定在弹簧上（弹性支持）

我们将初始条件和边界条件统称为**定解条件**。此前提下的求解叫做**定解问题**。

![image-20250911105002037](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509111050139.png)

附注3　对于方程(1.10)我们同样可以提混合问题和初值问题。

设$\Omega$是$\mathbb{R}^n$空间中的有界开域，

$Q$是$\mathbb{R}^n\times[0,\infty)$中的一个柱体，

$Q=\Omega\times(0,\infty)$，$\Sigma$是柱体的侧表面，

$\Sigma=\partial\Omega\times(0,\infty)$（$\partial\Omega$表示$\Omega$的边界）。所谓混合问题就是在$Q$上定义一个函数$u$，使它在柱体$Q$内适合方程(1.10)，在柱体的下底适合初始条件

$$u\big|_{t=0}=\varphi(x_1,\cdots,x_n),$$

$$u_t\big|_{t=0}=\psi(x_1,\cdots,x_n),\quad(x_1,\cdots,x_n)\in\Omega.\quad(1.11)$$

在柱体的侧表面$\Sigma$上适合下面三个边界条件中的任意一个：

$$u\big|_{\Sigma}=g(x_1,\cdots,x_n,t),\quad(1.12)$$

或

$\cdot 7\cdot$

$$\frac{\partial u}{\partial n}\bigg|_{\Sigma}=g(x_1,\cdots,x_n,t),\quad(1.13)$$

或

$$\left(\frac{\partial u}{\partial n}+\alpha u\right)\bigg|_{\Sigma}=g(x_1,\cdots,x_n,t),\quad(1.14)$$

这里$n$是$\Omega$的单位外法向量，$\alpha>0$。

### 初始条件（$t=0$ 时）

在柱体的下底面：
$$u|_{t=0} = \varphi(x_1, \cdots, x_n)$$
$$u_t|_{t=0} = \psi(x_1, \cdots, x_n), \quad (x_1, \cdots, x_n) \in \Omega$$

这给出了：
- 初始位移：$\varphi$
- 初始速度：$\psi$

### 边界条件（在侧面 $\Sigma$ 上）

有三种可能的边界条件：

#### (1.12) **第一类边界条件（Dirichlet）**
$$u|_\Sigma = g(x_1, \cdots, x_n, t)$$
- 直接指定边界上的**位移值**

#### (1.13) **第二类边界条件（Neumann）**
$$\frac{\partial u}{\partial n}\bigg|_\Sigma = g(x_1, \cdots, x_n, t)$$
- 指定边界上的**法向导数**（通量）
- $n$ 是 $\Omega$ 的单位外法向量

#### (1.14) **第三类边界条件（Robin/混合）**
$$\left(\frac{\partial u}{\partial n} + \alpha u\right)\bigg|_\Sigma = g(x_1, \cdots, x_n, t)$$
- 位移和法向导数的**线性组合**
- $\alpha > 0$ 是一个常数

## 能量守恒与热传导方程

$$q\cdot n=-k\frac{\partial u}{\partial n},$$

从而(1.16)式可改写为

$$\iiint_D c\rho(u\big|_{t=t_2}-u\big|_{t=t_1})dxdydz$$

$$=\int_{t_1}^{t_2}dt\oint_{\partial D}k\frac{\partial u}{\partial n}dS+\int_{t_1}^{t_2}dt\iiint_D\rho f_0dxdydz.\quad(1.18)$$

假设$u$在柱体$\Omega\times(0,\infty)$内具有连续微商$\frac{\partial u}{\partial t}$，$\frac{\partial^2u}{\partial x^2}$，$\frac{\partial^2u}{\partial y^2}$，$\frac{\partial^2u}{\partial z^2}$，

则应用$Ostrogradskii-Gauss$公式即得

$$\int_{t_1}^{t_2}dt\iiint_D c\rho\frac{\partial u}{\partial t}dxdydz$$

$$=\int_{t_1}^{t_2}dt\iiint_D[\nabla\cdot(k\nabla u)+\rho f_0]dxdydz.$$

由于被积函数在$\Omega\times(0,\infty)$内连续，以及$[t_1,t_2]$和$D$的任意性，又由于物体均匀，各向同性，$c$，$\rho$，$k$都是常数，立即得到

$$\frac{\partial u}{\partial t}-a^2\Delta u=f,\quad(1.19)$$

![image-20250911112042772](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509111120879.png)

![image-20250911113355377](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509111133496.png)