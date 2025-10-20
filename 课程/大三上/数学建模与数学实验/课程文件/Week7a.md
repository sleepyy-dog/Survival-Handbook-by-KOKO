# Week7a

## $LU$分解

注意都当A满足一个相对简单的条件时，我们有以下命题：

> 如果$n$阶矩阵$A$的顺序主子式不为零，则$A$可分解为一个单位下三角矩阵$L$（对角线上都为1的下三角矩阵）和一个上三角矩阵$U$的乘积。
>
> $$
> A = LU
> \label{25}
> $$
>
> $LU$分解是惟一的，这种分解叫做**矩阵$LU$分解**。

还可以得到：

> 如果$A$可逆，则存在单位下三角矩阵$L$、上三角矩阵$U$和交换矩阵（初等交换矩阵的乘积）$P$，使
>
> $$
> PA = LU.
> $$

当然限定的更严格还有以下结论：

> 若$A$对称正定，则存在对角元素为正的下三角矩阵$L$使
> $$
> A = LL^T
> \label{eq:29}
> $$
> 这称为对称正定矩阵的**$Cholesky$分解**。

当A为三对角矩阵时有以下结论：

> 将$A$的$LU$分解表示为
>
> $$
> A = \begin{bmatrix}
> b_1 & c_1 & & & \\
> a_2 & b_2 & c_2 & & \\
> & \ddots & \ddots & \ddots & \\
> & & a_{n-1} & b_{n-1} & c_{n-1} \\
> & & & a_n & b_n
> \end{bmatrix}
> \\=
> \begin{bmatrix}
> 1 & & & & \\
> l_2 & 1 & & & \\
> & l_3 & \ddots & & \\
> & & \ddots & 1 & \\
> & & & l_n & 1
> \end{bmatrix}
> \begin{bmatrix}
> u_1 & c_1 & & & \\
> & u_2 & c_2 & & \\
> & & \ddots & \ddots & \\
> & & & u_{n-1} & c_{n-1} \\
> & & & & u_n
> \end{bmatrix}
> \label{eq:30}
> $$
>
> $L$和$U$的计算公式为
>
> $$
> \begin{cases}
> u_1 = b_1, \\
> l_i = a_i/u_{i-1}, & i = 2,3,\dots,n, \\
> u_i = b_i - l_i c_{i-1}, & i = 2,3,\dots,n.
> \end{cases}
> \label{eq:31}
> $$

## 解的误差分析



一个病态的情况：

线性方程组

$$
\begin{bmatrix} 1 & 1 \\ 1 & 1.001 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} 2 \\ 2 \end{bmatrix}
\label{eq:33}
$$

的解是 $x=(2,0)^T$，若右端项稍有变化

$$
\begin{bmatrix} 1 & 1 \\ 1 & 1.001 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} 2 \\ 2.001 \end{bmatrix}
\label{eq:34}
$$

则解变为 $x=(1,1)^T$，右端项 $b$ 的微小变化引起解 $x$ 的很大变化，真乃“差之毫厘，谬以千里”，可以说 $x$ 对 $b$ 的扰动是敏感的。分析其原因是，系数矩阵 $A$ 的两个行向量近于线性相关，对应于图 $5.1$ 中的两条直线 $M_1N_1$ 和 $M_2N_2$ 近于平行，当 $b$ 的微小变化引起 $M_2N_2$ 的微小平移（图 $5.1$ 中虚线）时，两条直线的交点（即线性方程组的解）改变很大。

![image-20251020145637692](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510201456771.png)

对于病态，我们有以下定义：

若线性方程组系数矩阵或右端项的微小扰动（或称摄动）引起解的很大变化，就称为**病态线性方程组**，系数矩阵称为**病态矩阵**。反之，分别称为良态线性方程组和良态矩阵。

当A不变，b变化的时候，有以下结论：
$$
\frac{\|\delta x\|}{\|x\|} \le \|A^{-1}\| \cdot \|A\| \cdot \frac{\|\delta b\|}{\|b\|}
\label{eq:46}
$$

可见，$x$ 对 $b$ 扰动的敏感程度取决于 $\|A^{-1}\| \cdot \|A\|$。定义
$$
\text{cond}(A) = \|A^{-1}\| \cdot \|A\|
\label{eq:47}
$$
称为 $A$ 的**条件数**，则
$$
\frac{\|\delta x\|}{\|x\|} \le \text{cond}(A) \cdot \frac{\|\delta b\|}{\|b\|}
\label{eq:48}
$$
即条件数可作为误差的上界。

考虑 $A$ 的扰动 $\delta A$ 引起 $x$ 的扰动 $\delta x$ (设 $b$ 不变)，这时有 $(A+\delta A)(x+\delta x)=b$，类似地可推导出，当 $\|\delta A\|$ 足够小，使得 $\|A^{-1}\| \cdot \|\delta A\| < 1$ 时，有
$$
\frac{\|\delta x\|}{\|x\|} \le \frac{\text{cond}(A)}{1 - \text{cond}(A) \cdot \frac{\|\delta A\|}{\|A\|}} \cdot \frac{\|\delta A\|}{\|A\|}=\frac{\text{cond}(A)}{1 - ||A^{-1}||\|\delta A\|} \cdot \frac{\|\delta A\|}{\|A\|}
\label{eq:49}
$$
由 $\ref{eq:48}$ 式、$\ref{eq:49}$ 式可知，解 $x$ 对右端项 $b$ 和系数矩阵 $A$ 扰动的敏感程度取决于 $A$ 的条件数。$A$ 的条件数越大，解的相对误差就可能越大，所以条件数反映了线性方程组的性态。若 $A$ 的条件数相对地大，即 $\text{cond}(A) \gg 1$，则线性方程组 $Ax=b$ 是病态的，$\text{cond}(A)$ 越大，病态越严重，越难获得比较准确的解。反之，若 $A$ 的条件数相对的小，则方程是良态的。

> [!NOTE]
>
> 期末考题型：
>
> * 选择题
> * 解答题
> * 程序题(多写拿分)
> * 综合题（写一个建模思路）

一个非常病态的矩阵：

$n$阶希尔伯特矩阵定义为

$$
\boldsymbol{H} = \begin{bmatrix}
1 & 1/2 & \cdots & 1/n \\
1/2 & 1/3 & \cdots & 1/(n+1) \\
\vdots & \vdots & \ddots & \vdots \\
1/n & 1/(n+1) & \cdots & 1/(2n-1)
\end{bmatrix}
\label{eq:50}
$$

当$n$较大时$H$呈严重病态，常作为研究病态现象的系数矩阵。如5阶希尔伯特矩阵的1-条件数 $cond(H)_1 \approx 9.4 \times 10^5$，2-条件数 $cond(H)_2 \approx 4.8 \times 10^5$，对于线性方程组 $Hx=b, x$的(相对)误差可以达到$b$(或$H$)的(相对)误差的$10^5$倍以上。

## 求解线性代数方程组的迭代法

一个比较简单的想法不是对于主矩阵直接开始迭代，而是先变换一下：

先看如下的数字例子:

$$
\begin{cases}
9x_1 - x_2 - x_3 = 7, \\
-x_1 + 10x_2 - x_3 = 8, \\
x_1 - x_2 + 15x_3 = 13.
\end{cases}
\label{eq:51}
$$

线性方程组$\ref{eq:51}$可等价地写为（直接通过原始，将$x_i$的系数化为1）

$$
\begin{cases}
x_1 = \frac{1}{9}x_2 + \frac{1}{9}x_3 + \frac{7}{9}, \\
x_2 = \frac{1}{10}x_1 + \frac{1}{10}x_3 + \frac{8}{10}, \\
x_3 = \frac{1}{15}x_1 + \frac{1}{15}x_2 + \frac{13}{15}.
\end{cases}
\label{eq:52}
$$

利用线性方程组$\ref{eq:52}$可以进行如下形式的迭代(用上标$(k)$表示迭代步数):

$$
\begin{cases}
x_1^{(k+1)} = \frac{1}{9}x_2^{(k)} + \frac{1}{9}x_3^{(k)} + \frac{7}{9}, \\
x_2^{(k+1)} = \frac{1}{10}x_1^{(k)} + \frac{1}{10}x_3^{(k)} + \frac{8}{10}, \\
x_3^{(k+1)} = \frac{1}{15}x_1^{(k)} + \frac{1}{15}x_2^{(k)} + \frac{13}{15}.
\end{cases}
\label{eq:53}
$$
以上的方法为雅可比方法。

而以下方法为高斯-赛德尔方法：
$$
\begin{cases}
x_1^{(k+1)} = \frac{1}{9}x_2^{(k)} + \frac{1}{9}x_3^{(k)} + \frac{7}{9}, \\
x_2^{(k+1)} = \frac{1}{10}x_1^{(k+1)} + \frac{1}{10}x_3^{(k)} + \frac{8}{10}, \\
x_3^{(k+1)} = \frac{1}{15}x_1^{(k+1)} + \frac{1}{15}x_2^{(k+1)} + \frac{13}{15}.
\end{cases}
$$
注意对于以上我们可以判别收敛性：

用迭代法计算都会遇到是否收敛及收敛速度的问题。上面用两种迭代法求解线性方程组$Ax=b$时，先将它表为等价形式
$$
x = Bx + f,
\label{eq:62}
$$
再得到迭代形式
$$
x^{(k+1)} = Bx^{(k)} + f, \quad k = 0,1,2,\dots
\label{eq:63}
$$
设$x^*$是原线性方程组的解，即
$$
x^* = Bx^* + f.
\label{eq:64}
$$
$\ref{eq:63}$式与$\ref{eq:64}$式相减后再由$k=0$递推可得：
$$
x^{(k)} - x^* = B^k(x^{(0)} - x^*).
\label{eq:65}
$$
由此可知，$k \to \infty$时序列$\{x^{(k)}\}$收敛于$x^*$等价于$B^k$趋于$0$，而$B^k$趋于$0$等价于$B$的所有特征值(取模)小于$1$。这时称迭代公式(或迭代法)收敛。
记$n$阶矩阵$B$的特征值为$\lambda_i$，称
$$
\rho(B) = \max_i |\lambda_i|
\label{eq:66}
$$
为$B$的谱半径。由上述分析可得：
迭代公式$\ref{eq:63}$收敛的充要条件是$B$的谱半径$\rho(B)<1$，这也就是雅可比方法的收敛等价条件。

或者我们也可以直接判断$A$来分析收敛性。

若$A$是严格对角占优的，即$|a_{ii}| > \sum_{j \neq i} |a_{ij}|$ ($i = 1,2,\dots,n$)，则雅可比迭代和高斯-赛德尔迭代均收敛。
若$A$对称正定，则高斯-赛德尔迭代法收敛。

> 这里我们还引入一个收敛更快的方法。
>
> 超松弛（$successive$ $over$ $relaxation$, $SOR$）迭代法是对高斯-$Seidel$迭代的一种改进。
> 首先用高斯-$Seidel$迭代的$(60)$式左端的$x^{(k+1)}$作为中间结果$\tilde{x}^{(k+1)}$，即
>
> $$
> \tilde{x}^{(k+1)} = D^{-1}(Lx^{(k+1)} + Ux^{(k)}) + D^{-1}b
> \label{eq:69}
> $$
>
> 再取$\tilde{x}^{(k+1)}$和$x^{(k)}$的加权平均作为最终结果$x^{(k+1)}$，即
>
> $$
> x^{(k+1)} = \omega\tilde{x}^{(k+1)} + (1-\omega)x^{(k)}
> \label{eq:70}
> $$
>
> 其中$\omega$为加权因子，$\omega>1$时称为超松弛迭代，$\omega<1$时称为低松弛迭代，$\omega=1$时退化为高斯-$Seidel$迭代。
> 为分析其收敛性，需将$\ref{eq:69}$式，$\ref{eq:70}$式写成如下标准迭代公式：
>
> $$
> x^{(k+1)} = B_{\omega}x^{(k)} + f_{\omega},\ B_{\omega} = (D-\omega L)^{-1}[\omega U + (1-\omega)D],\ f_{\omega} = \omega(D-\omega L)^{-1}b
> \label{eq:71}
> $$
>
> 迭代公式$\ref{eq:71}$收敛的充要条件是谱半径$\rho(B_{\omega})<1$。这个结果并不好用，一个特殊情况如下：
> 若$A$对称正定，则迭代公式$\ref{eq:71}$收敛的充要条件是$0<\omega<2$。
> $SOR$迭代法可以看做是带参数的高斯-$Seidel$迭代法，是解大型稀疏矩阵方程组的有效方法之一。

> [!NOTE]
>
> sparse函数一定需要掌握。
>
> ```matlab
> %% 稀疏矩阵
> clear all
> clc
> n=1000;b=[1:n]';
> a1=sparse(1:n,1:n,4,n,n);
> a2=sparse(2:n,1:n-1,1,n,n);
> a=a1+a2+a2';
> tic;x=a\b;t1=toc
> % 将稀疏矩阵转为常规储存方法
> aa=full(a); 
> tic;xx=aa\b;t2=toc
> y=norm(x-xx)
> ```