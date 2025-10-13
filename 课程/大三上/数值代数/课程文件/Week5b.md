# Week5b

## 最小二乘问题

最小二乘问题多产生于数据拟合问题。例如，假定给出 $m$ 个点 $t_1, \dots, t_m$ 和这 $m$ 个点上的实验或观测数据 $y_1, \dots, y_m$，并假定给出在 $t_i$ 上取值的 $n$ 个已知函数 $\psi_1(t), \dots, \psi_n(t)$。考虑 $\psi_i$ 的线性组合
$$
f(x;t) = x_1\psi_1(t) + x_2\psi_2(t) + \dots + x_n\psi_n(t),
$$
我们希望在 $t_1, \dots, t_m$ 点上 $f(x;t)$ 能最佳地逼近 $y_1, \dots, y_m$ 这些数据。为此，若定义残量
$$
r_i(x) = y_i - \sum_{j=1}^{n} x_j\psi_j(t_i), \quad i = 1, \dots, m,
\label{eq:3.1.1}
$$
则问题成为：估计参数 $x_1, \dots, x_n$，使残量 $r_1, \dots, r_m$ 尽可能地小。$\ref{eq:3.1.1}$式可用矩阵-向量形式表示为
$$
r(x) = b - Ax,
\label{eq:3.1.2}
$$
其中
$$
A = \begin{bmatrix}
\psi_1(t_1) & \dots & \psi_n(t_1) \\
\vdots & & \vdots \\
\psi_1(t_m) & \dots & \psi_n(t_m)
\end{bmatrix}, \quad b = \begin{bmatrix}
y_1 \\
\vdots \\
y_m
\end{bmatrix},
$$
$$
x = (x_1, \dots, x_n)^{\text{T}}, \quad r(x) = (r_1(x), \dots, r_m(x))^{\text{T}}.
$$
当 $m=n$ 时，我们可以要求 $r(x) = 0$，则估计 $x$ 的问题就可用第一章中讨论的方法解决。当 $m>n$ 时，一般不可能使所有残量为零，但我们可要求残向量 $r(x)$ 在某种范数意义下最小。最小二乘问题就是**求 $x$ 使残向量 $r(x)$ 在 $2$ 范数意义下最小**。

我们这里讨论$m>n$也就是无最小值的情况。（此时残向量不能为0）

![image-20251010152206927](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510101522059.png)

> 设$A \in \mathbf{R}^{m \times n}$，$A$的**值域**定义为
> $$
> \mathcal{R}(A) = \{y \in \mathbf{R}^m: y = Ax, x \in \mathbf{R}^n\}.
> $$
> 易证$R(A) = \text{span}(a_1, \dots, a_n)$，其中$a_i$ ($i = 1, \dots, n$)为$A$的列向量。
> $A$的**零空间**定义为
> $$
> \mathcal{N}(A) = \{x \in \mathbf{R}^n: Ax = 0\},
> $$
> **它的维数记为$\text{null}(A)$**。
> 一个子空间$S \subset \mathbf{R}^n$的**正交补**定义为
> $$
> \mathcal{S}^\perp = \{y \in \mathbf{R}^n: y^T x = 0, \forall x \in S\}.
> $$

这里我们直接给出最小二乘的定义：

> 定义 3.1.1 给定矩阵 $A \in R^{m \times n}$ 及向量 $b \in R^m$，确定 $x \in R^n$，使得
>
> $$
> \|b-Ax\|_{2}=\|r(x)\|_{2}=\min_{y \in R^{n}}\|r(y)\|_{2}=\min_{y \in R^{n}}\|Ay-b\|_{2}.
> \label{3.1.3}
> $$
>

这就是所谓的**最小二乘问题**，简称为 $LS$ ($Least$ $Squares$) 问题，其中 $r(x)$ 常常被称为残向量。

在所讨论的最小二乘问题中，若 $r$ 线性地依赖于 $x$，则称其为线性最小二乘问题；若 $r$ 非线性地依赖于 $x$，则称其为非线性最小二乘问题。

最小二乘问题的解 $x$ 又可称做线性方程组

$$
Ax=b, \quad A \in R^{m \times n}
\label{3.1.4}
$$

的最小二乘解，即 $x$ 在残向量 $r(x)=b-Ax$ 的 2 范数最小的意义下满足方程组 $\ref{3.1.4}$。当 $m>n$ 时，称 $\ref{3.1.4}$ 式为超定方程组或矛盾方程组，也就是我们想要讨论的情况；而当 $m<n$ 时，称其为欠定方程组。

为了确定线性二乘法解的唯一性，我们有以下定理：

> 定理 $3.1.3$ 线性最小二乘问题的解总是存在的，而且其解唯一的充分必要条件是 $N(A) = \{0\}$。
>
> 这个证明是讲了的。

这里我们已经获得的最小二乘解的全部信息，可以得到以下性质：

记最小二乘问题的解集为 $\mathcal{X}_{LS}$，即

$$
\mathcal{X}_{LS} = \{x \in \mathbf{R}^n: x \text{ 是 } LS \text{ 问题 } (3.1.3) \text{ 的解}\},
$$

则由定理 $3.1.3$ 知，$x_{LS}$ 总是非空的，而且它仅有一个元素的充分必要条件是 $A$ 的列线性无关。此外，不难证明解集中有且仅有一个解其 $2$ 范数最小，我们用 $x_{LS}$ 表示之，并称其为最小 $2$ 范数解。

给一个超级强的命题，直接得到解的一个等价性质：

> 定理 3.1.4 $x \in \mathcal{X}_{LS}$ 当且仅当
>
> $$
> A^T Ax = A^T b.
> \label{3.1.5}
> $$