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

![image-20250925101605828](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509251016959.png)

![image-20250925101834766](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509251018865.png)

区域是开的

![image-20250925102315990](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509251023093.png)

![image-20250925112129595](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509251121708.png)

这里注意一下$\varphi(x,y)$是任取的。

比较难理解的是
$$
\varphi(x, y) = \rho_n(x - x_0, y - y_0) \in C_0^\infty(\Omega)
$$
但是事实上，我们由于$\rho_n(x , y )$在零点附近的以$\frac{1}{n}$为半径的圆积分为1.自然得到$\rho_n(x - x_0, y - y_0)$以$\bar{B}_{\delta}$上积分为1，自然知道在$\Omega$上积分为1，即$\varphi(x,y) \in C_0^{\infin}(\Omega)$，从而得到结论。

### 极小曲面问题

![image-20250925103535672](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509251035788.png)

![image-20250925105222024](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509251052124.png)

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

### 膜的平衡位置

