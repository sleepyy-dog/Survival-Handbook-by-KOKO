# Week6a

## 解线性方程组

核心是解$Ax=b$,这部分内容和数值代数高度重合。

简单介绍一下一个针对**三对角矩阵**的LU分解：

将$A$的$LU$分解表示为
$$
A = \begin{bmatrix}
b_1 & c_1 & & & \\
a_2 & b_2 & c_2 & & \\
& \ddots & \ddots & \ddots & \\
& & a_{n-1} & b_{n-1} & c_{n-1} \\
& & & a_n & b_n
\end{bmatrix}
=
\begin{bmatrix}
1 & & & & \\
l_2 & 1 & & & \\
& l_3 & 1 & & \\
& & \ddots & \ddots & \\
& & & l_n & 1
\end{bmatrix}
\begin{bmatrix}
u_1 & c_1 & & & \\
& u_2 & c_2 & & \\
& & \ddots & \ddots & \\
& & & u_{n-1} & c_{n-1} \\
& & & & u_n
\end{bmatrix}
\label{eq:30}
$$
$L$和$U$的计算公式为
$$
\begin{cases}
u_1 = b_1, \\
l_i = a_i/u_{i-1}, & i = 2,3,\dots,n, \\
u_i = b_i - l_i c_{i-1}, & i = 2,3,\dots,n.
\end{cases}
\label{eq:31}
$$
线性方程组 $Ax=f$ 可通过等价的两个三角形线性方程组 $Ly=f$ 和 $Ux=y$ 求解如下:
$$
\begin{cases}
y_1 = f_1, \\
y_i = f_i - l_i y_{i-1}, & i = 2,\dots,n;
\end{cases}
\begin{cases}
x_n = y_n/u_n, \\
x_i = (y_i - c_i x_{i+1})/u_i, & i = n-1,\dots,1.
\end{cases}
\label{eq:32}
$$
$\ref{eq:31}$式~$\ref{eq:32}$式称为求解三对角形线性方程组的追赶法。

