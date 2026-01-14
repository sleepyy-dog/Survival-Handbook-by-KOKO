# Week9a

## 非线性差分方程与分岔混沌现象

我们分析一个非线性差分方程：

$$
x_{k+1} = x_k + r\left(1-\frac{x_k}{N}\right)x_k, \quad k = 0,1,2,\dots
\label{eq:46}
$$

在$\ref{eq:46}$式中令$x_k = x_{k+1} = x$得到代数方程

$$
x = x+rx\left(1-\frac{x}{N}\right)
\label{eq:47}
$$

方程$\ref{eq:47}$的根是非线性差分方程$\ref{eq:46}$的平衡点。容易看出非线性差分方程$\ref{eq:46}$有两个平衡点：$x=N$，$x=0$。若$x_k \to x(k \to \infty)$，平衡点$x$是稳定的，否则，$x$不稳定。

一般地考察非线性差分方程

$$
y_{k+1} = f(y_k), \quad k = 0,1,2,\dots
\label{eq:48}
$$

代数方程$y=f(y)$的根是非线性差分方程$\ref{eq:48}$的平衡点，记作$y^*$。根据$6.2$节的迭代法局部收敛定理知，当

$$
|f'(y^*)| < 1
\label{eq:49}
$$

时，方程$\ref{eq:48}$的平衡点$y^*$是稳定的；当

$$
|f'(y^*)| > 1
\label{eq:50}
$$

时，方程$\ref{eq:48}$的平衡点$y^*$不稳定。

> [!NOTE]
>
> 重点是牛顿迭代法的思想和代码实现：
>
> 对于方程$f(x)=0$,我们可以有迭代函数
>
> $$
> \varphi(x) = x - \frac{f(x)}{f'(x)}
> $$
>
> 以上方法的改进为割线法：
>
> $$
> x_{k+1} = x_k - \frac{f(x_k)(x_k - x_{k-1})}{f(x_k) - f(x_{k-1})}
> $$
>
> 由于
>
> $$
> \varphi'(x^*) = \frac{f(x^*)f''(x^*)}{f'(x^*)^2}, \quad \varphi''(x^*) = \frac{f''(x^*)}{f'(x^*)}
> \label{eq:23}
> $$
>
> 若$x^*$是$f(x)=0$的单根，即$f(x^*)=0, f'(x^*)\neq 0$。一般地，$f''(x^*)\neq 0$，则$\varphi'(x^*)=0, \varphi''(x^*)\neq 0$，这时牛顿切线法产生的$\{x_n\}$为2阶收敛。
> 进一步的研究发现，当$x^*$是$f(x)=0$的重根时，$\varphi'(x^*)\neq 0$，牛顿切线法只是1阶收敛，并且重数越高收敛越慢。
>
> 我们还可以把这个方法推广到方程组上：
>
> 对于$F(x)=0$，其中$x=(x_1,x_2,\dots,x_n)^T$，$F(x)=(f_1(x),f_2(x),\dots,f_n(x))^T$。设$x^{(k)}=(x_1^{(k)},x_2^{(k)},\dots,x_n^{(k)})^T$是方程组$(2)$的第$k$步近似解，与单变量非线性方程的牛顿法类似，在$x^{(k)}$作泰勒展开，线性化后用$x^{(k+1)}$代替$x$可得
>
> $$
> f_i(x^{(k+1)}) = f_i(x^{(k)}) + \frac{\partial f_i(x^{(k)})}{\partial x_1}(x_1^{(k+1)}-x_1^{(k)}) + \dots + \frac{\partial f_i(x^{(k)})}{\partial x_n}(x_n^{(k+1)}-x_n^{(k)}), \quad i = 1,2,\dots,n.
> \label{eq:25}
> $$
>
> 记$F$的雅可比矩阵为
>
> $$
> F'(x) = \begin{bmatrix}
> \frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & \dots & \frac{\partial f_1}{\partial x_n} \\
> \frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & \dots & \frac{\partial f_2}{\partial x_n} \\
> \vdots & \vdots & \ddots & \vdots \\
> \frac{\partial f_n}{\partial x_1} & \frac{\partial f_n}{\partial x_2} & \dots & \frac{\partial f_n}{\partial x_n}
> \end{bmatrix},
> \label{eq:26}
> $$
>
> 则$\ref{eq:25}$式可写作
>
> $$
> F(x^{(k+1)}) = F(x^{(k)}) + F'(x^{(k)})(x^{(k+1)}-x^{(k)}).
> \label{eq:27}
> $$
>
> 若雅可比矩阵$F'(x^{(k)})$可逆，则由$\ref{eq:27}$式可得求解线性方程组$\ref{eq:25}$的牛顿迭代公式
>
> $$
> x^{(k+1)} = x^{(k)} - [F'(x^{(k)})]^{-1}F(x^{(k)}).
> \label{eq:28}
> $$
>
> 实际计算中，在计算过程的第$k$步，通常是先计算$F(x^{(k)})$和$F'(x^{(k)})$，再解线性方程组
>
> $$
> F'(x^{(k)})\Delta x^{(k)}=-F(x^{(k)}),
> \label{eq:29}
> $$
>
> 得到$\Delta x^{(k)}$后，令
>
> $$
> x^{(k+1)}=x^{(k)} + \Delta x^{(k)}.
> \label{eq:30}
> $$
>
> 即可。

## 无约束优化

数学规划模型一般有三个要素：一是决策变量，通常是该问题要求解的那些未知量，不妨用$n$维向量$x = (x_1, x_2, \dots, x_n)^T$表示；二是目标函数，通常是该问题要优化（最小或最大）的那个目标的数学表达式，它是决策变量$x$的函数，这里抽象地记作$f(x)$；三是约束条件，由该问题对决策变量的限制条件给出，即$x$允许取值的范围$x \in \Omega$，$\Omega$称可行域，常用一组关于$x$的不等式（也可以有等式）$g_i(x) \le 0 (i=1,2,\dots,m)$来界定。一般地，这类模型可表述成如下形式：

$$
\text{opt } z = f(x)
\label{eq:1}
$$

$$
\text{s. t. } g_i(x) \le 0, \quad i = 1,2,\dots,m.
\label{eq:2}
$$

这里$opt$（$optimize$）是最优化的意思，可以是求极小$min$（$minimize$）或求极大$max$（$maximize$）；$s. t.$（$subject \text{ to}$）是“受约束于”的意思。满足$\ref{eq:2}$式的解$x$称为可行解，同时满足$\ref{eq:1}$式、$\ref{eq:2}$式的解$x^*$称为最优解。

将$f(\mathbf{x})$的梯度记作$\nabla f(\mathbf{x})=(f_{x_1}, f_{x_2}, \dots, f_{x_n})^T$ ($n$维向量)，其中$f_{x_i}=\frac{\partial f}{\partial x_i}$ ($i=1,2,\dots,n$)；$f(\mathbf{x})$的黑塞($Hessian$)矩阵记作$\nabla^2 f=(f_{x_i x_j})$ ($n \times n$矩阵，简记为$\mathbf{H}$阵，它实际上就是梯度函数的雅可比矩阵)，其中$f_{x_i x_j}=\frac{\partial^2 f}{\partial x_i \partial x_j}$ ($i,j=1,2,\dots,n$)。回顾多元函数极值问题最优解的条件，我们知道$\mathbf{x}=\mathbf{x}^*$是最优解的必要条件为

$$
\nabla f(\mathbf{x}^*) = \mathbf{0}
\label{eq:18}
$$

充分条件为

$$
\nabla f(\mathbf{x}^*) = \mathbf{0}, \quad \text{且} \quad \nabla^2 f(\mathbf{x}^*) \text{正定}.
$$

### 下降法

最速下降法为：

将$f(x^{k+1})$在$x^k$点作泰勒展开，只保留一阶项，有

$$
f(x^{k+1}) = f(x^k + d^k) = f(x^k) + \nabla f^T(x^k)d^k
\label{20}
$$

显然，只要满足

$$
\nabla f^T(x^k)d^k < 0
\label{21}
$$

$d^k$就是下降方向。满足$\ref{21}$式的下降方向有无穷多个，其中使$|\nabla f^T(x^k)d^k|$达到最大的是

$$
d^k = -\nabla f(x^k)
\label{22}
$$

称为最速下降方向。因为梯度方向是函数增长最快的方向，所以毫不奇怪，负梯度方向就是最速下降方向。对应的方法称最速下降法，或梯度法，其迭代公式为（设$\alpha^k=1$）

$$
x^{k+1} = x^k - \nabla f(x^k)
\label{23}
$$

