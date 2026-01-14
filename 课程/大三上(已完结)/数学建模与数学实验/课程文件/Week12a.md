# Week12a

## 非线性规划

一般的规划模型形式：
$$
\min z = f(\boldsymbol{x}), \quad \boldsymbol{x} = (x_1, x_2, \dots, x_n)^T \in \mathbb{R}^n
$$
$$
\text{s. t.} \quad g_i(\boldsymbol{x}) \leq 0, \quad i = 1, 2, \dots, m
$$

若此时$f(\mathbf{x})$和$g_i(\mathbf{x})$并不都是线性函数，则此时问题称为**非线性规划**。

一个更加广泛的定义是：
$$
\begin{array}{ll}
\min & z = f(\mathbf{x}), \quad \mathbf{x} \in \mathbb{R}^n \\
\text{s. t.} & h_i(\mathbf{x}) = 0, \quad i = 1,2,\dots,m, \\
& g_j(\mathbf{x}) \leq 0, \quad j = 1,2,\dots,l.
\end{array}
$$
其中$f, h_i, g_i$有非线性函数，是带约束的**非线性规划($NLP$)**。

## 最优解的必要条件

当我们只有等式约束时，问题较为简单，只需要构造
$$
L(\mathbf{x}, \boldsymbol{\mu}) = f(\mathbf{x}) + \sum_{i=1}^{m} \mu_i h_i(\mathbf{x})
$$
($\mu_i$为参数)，化为无约束优化问题，然后利用无约束优化最优解的必要条件来求解（相当于解非线性方程组）。

现在我们只考虑只有不等式约束$g_i$的情况：
$$
\min z = f(\mathbf{x}), \quad \mathbf{x} \in \mathbb{R}^n \\
\text{s. t. } g_j(\mathbf{x}) \leq 0, \quad j = 1,2,\dots,l.
$$

## 二次规划

对于二次规划，目标函数是二次函数，约束为线性，模型的一般形式为
$$
\min f(\mathbf{x}) = \frac{1}{2}\mathbf{x}^{\text{T}}\mathbf{H}\mathbf{x} + \mathbf{c}^{\text{T}}\mathbf{x}
\label{eq:quadratic_program}
$$
$$
\text{s. t. } \mathbf{A}\mathbf{x} \le \mathbf{b}.
$$
其中$\mathbf{c}$, $\mathbf{A}$, $\mathbf{b}$与线性规划相同，$\mathbf{H} \in \mathbb{R}^{n \times n}$为对称矩阵。特别地，当$\mathbf{H}$正定时目标函数为凸函数，线性约束下可行域又是凸集，$\ref{eq:quadratic_program}$式称为凸二次规划。

## 编程求解

> [!NOTE]
>
> 对于非线性约束，我们的求解想法是通过$kkt$条件做一个等价。

对于二次规划问题：
$$
\begin{aligned}
& \min z = \frac{1}{2}\mathbf{x}^\mathsf{T}\mathbf{Hx} + \mathbf{c}^\mathsf{T}\mathbf{x} \\
& \text{s. t.} \quad \mathbf{A}_1\mathbf{x} \le \mathbf{b}_1, \\
& \quad \quad \mathbf{A}_2\mathbf{x} = \mathbf{b}_2, \\
& \quad \quad \mathbf{v}_1 \le \mathbf{x} \le \mathbf{v}_2.
\end{aligned}
\label{eq:29}
$$
相应的求解函数为：

```matlab
x=quadprog(H,c,b1);
[x,fv,ef,out,lag]=quadprog(H,c,b1,b2,v1,v2,x0,opt);
```

对于非线性规划问题：
$$
\begin{array}{ll}
\min & z = f(\boldsymbol{x}) \\
\text{s. t.} & \boldsymbol{c}_1(\boldsymbol{x}) \leq \mathbf{0}, \\
& \boldsymbol{c}_2(\boldsymbol{x}) = \mathbf{0}, \\
& \boldsymbol{A}_1 \boldsymbol{x} \leq \boldsymbol{b}_1, \\
& \boldsymbol{A}_2 \boldsymbol{x} = \boldsymbol{b}_2, \\
& \boldsymbol{v}_1 \leq \boldsymbol{x} \leq \boldsymbol{v}_2.
\end{array}
\label{30}
$$
相应的求解函数为：

```matlab
x=fmincon(@f,x0,A1,b1); % x0为初始点
[x,fv,ef,out,lag,grad,hess]=fmincon(@f,x0,A1,b1,A2,b2,v1,v2,@c,opt,P1,P2,...) % @c = [@c1, @c2]
```

