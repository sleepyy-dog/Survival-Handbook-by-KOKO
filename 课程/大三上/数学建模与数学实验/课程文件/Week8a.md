# Week8a

## 非线性方程

> [!NOTE]
>
> 闭卷考试，选择题，解答题，计算程序题，综合题。

包含$n$个未知数的$m$个方程称为方程组，可以记作
$$
F(\mathbf{x}) = 0,
\label{eq:2}
$$
其中$\mathbf{x}=(x_1,x_2,\dots,x_n)^{\mathrm{T}}$是一个向量，$F(\mathbf{x})=(f_1(\mathbf{x}),f_2(\mathbf{x}),\dots,f_m(\mathbf{x}))^{\mathrm{T}}$是一个向量值函数。当$f_1(\mathbf{x}),f_2(\mathbf{x}),\dots,f_m(\mathbf{x})$中至少有一个非线性函数时，方程组($\ref{eq:2}$)称为非线性方程组。
多数情况下，方程组中包含的方程的个数等于未知数的个数(即$m=n$)。

## 图形法与二分法

注：利用二分法可以求导一个零点，但是区间上可能存在多个多个零点。

## 迭代法

我们在线性方程组的数值解法中学习过迭代法，类似的思路也可以用于解非线性方程：
将原方程$f(x)=0$改写成等价形式$x=\varphi(x)$，选择适当的初值$x_0$，按照迭代公式
$$
x_{k+1} = \varphi(x_k), \quad k = 0,1,\dots
\label{eq:16}
$$

计算，若迭代序列$\{x_n\}$收敛到$x^*$，则$x^*$满足$x^*=\varphi(x^*)$，$x^*$称为迭代函数$\varphi$的不动点，即为原方程$f(x)=0$的根。

直接说结论，是否收敛和$\varphi$在$x^*$的斜率有关。当较为平缓（绝对值小于1），则收敛。

![image-20251027150524475](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510271505554.png)

我们有定理：

> 设$\varphi(x)$在$x^*$的一个邻域内连续、可微，且$|\varphi'(x^*)|<1$，则对于该邻域内的任意初值$x_0$，序列$\{x_k\}$收敛于$x^*$。

下面介绍收敛速度的概念。对$R^n$中的序列$\{x_k\}$，记$e_k=x_k-x^*$，若
$$
\lim_{k \to \infty} \frac{||e_{k+1}||}{||e_k||^p} = c > 0, \quad p \text{为一个正数},
\label{eq:17}
$$

其中$||\cdot||$表示某种范数(对实数可以认为就是绝对值)，则称序列$\{x_k\}$为$p$阶收敛。特别地，$1$阶收敛称为线性收敛，$2$阶收敛称为平方收敛；若$p=1, c=0$时$\text{(\ref{eq:17})}$式成立，通常称$\{x_k\}$为超线性收敛。显然，$p$越大收敛越快。
利用$\varphi(x)$在$x^*$的泰勒展开：
$$
\varphi(x_k) = \varphi(x^*) + \varphi'(x^*)(x_k-x^*) + \dots + \frac{\varphi^{(p)}(x^*)}{p!}(x_k-x^*)^p + \dots
\label{eq:18}
$$

并注意到$x_{k+1}=\varphi(x_k)$, $x^*=\varphi(x^*)$和$e_k=x_k-x^*$，由$\text{(\ref{eq:18})}$式可得

$$
e_{k+1} = \varphi'(x^*)e_k + \dots + \frac{\varphi^{(p)}(x^*)}{p!}e_k^p + \dots
$$

于是根据收敛阶的定义$\text{(\ref{eq:17})}$式，若$\varphi'(x^*)\neq0$，则$\{x_k\}$为$1$阶收敛(线性收敛)；若$\varphi'(x^*)=\dots=\varphi^{(p-1)}(x^*)=0, \varphi^{(p)}(x^*)\neq0$，则$\{x_k\}$为$p$阶收敛。

## 牛顿法

这里我们给一种可以构造迭代式的方法：

对于方程$f(x)=0$，将$f(x)$在$x_k$作泰勒展开，去掉2阶及2阶以上项（即线性化）后得
$$
f(x) = f(x_k) + f'(x_k)(x-x_k)
\label{eq:20}
$$
设$f'(x_k) \neq 0$，令上面的$f(x)=0$，用$x_{k+1}$代替右端的$x$，就得到迭代公式
$$
x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}
\label{eq:21}
$$
即迭代函数为
$$
\varphi(x) = x - \frac{f(x)}{f'(x)}
\label{eq:22}
$$
$\ref{eq:22}$式的几何意义如图$6.5$所示，图中$MN$是曲线$y=f(x)$过$(x_k, f(x_k))$点的切线，它与$x$轴的交点即为$x_{k+1}$。这种方法称为牛顿切线法（简称牛顿法或切线法），它是线性化与迭代法的结合。
由于
$$
\varphi'(x^*) = \frac{f(x^*)f''(x^*)}{f'(x^*)^2}, \quad \varphi''(x^*) = \frac{f''(x^*)}{f'(x^*)}
\label{eq:23}
$$
若$x^*$是$f(x)=0$的单根，即$f(x^*)=0, f'(x^*) \neq 0$。一般地，$f''(x^*) \neq 0$，则$\varphi'(x^*)=0, \varphi''(x^*) \neq 0$，这时牛顿切线法产生的$\{x_n\}$为2阶收敛。
进一步的研究发现，当$x^*$是$f(x)=0$的重根时，$\varphi'(x^*) \neq 0$，牛顿切线法只是1阶收敛，并且重数越高收敛越慢。

这里注意到我们需要求导，但是其实很多时候这是比较难的，所以我们有以下方法：

为了避免切线法计算导数的麻烦，可以考虑用差商$\frac{f(x_k)-f(x_{k-1})}{x_k-x_{k-1}}$代替$f'(x_k)$，迭代公式变为

$$
x_{k+1} = x_k - \frac{f(x_k)(x_k-x_{k-1})}{f(x_k)-f(x_{k-1})}
$$

其几何意义如图$6.6$所示，用割线$PQ$代替了原来的切线，称为割线法（或弦截法）。它的收敛速度比切线法稍慢（可以证明，对于单根其收敛阶数是$1.618$），并且需要两个初值$x_0$，$x_1$开始迭代。

![image-20251027154119479](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202510271541570.png)

## 非线性方程组的牛顿法

求解单变量非线性方程的牛顿法可以推广到多变量方程组的情形。方程组如$(2)$式即$F(x)=0$，其中$x=(x_1,x_2,\dots,x_n)^T$，$F(x)=(f_1(x),f_2(x),\dots,f_n(x))^T$。设$x^{(k)}=(x_1^{(k)},x_2^{(k)},\dots,x_n^{(k)})$是方程组$(2)$的第$k$步近似解，与单变量非线性方程的牛顿法类似，在$x^{(k)}$作泰勒展开，线性化后用$x^{(k+1)}$代替$x$可得

$$
f_i(x^{(k+1)}) = f_i(x^{(k)}) + \frac{\partial f_i(x^{(k)})}{\partial x_1}(x_1^{(k+1)} - x_1^{(k)}) + \dots + \frac{\partial f_i(x^{(k)})}{\partial x_n}(x_n^{(k+1)} - x_n^{(k)}), \quad i = 1,2,\dots,n.
\label{25}
$$

记$F$的雅可比矩阵为

$$
F'(x) = \begin{bmatrix}
\frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & \dots & \frac{\partial f_1}{\partial x_n} \\
\frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & \dots & \frac{\partial f_2}{\partial x_n} \\
\vdots & \vdots & & \vdots \\
\frac{\partial f_n}{\partial x_1} & \frac{\partial f_n}{\partial x_2} & \dots & \frac{\partial f_n}{\partial x_n}
\end{bmatrix},
\label{26}
$$

则$\ref{25}$式可写作

$$
F(x^{(k+1)}) = F(x^{(k)}) + F'(x^{(k)})(x^{(k+1)} - x^{(k)}).
\label{27}
$$

若雅可比矩阵$F'(x^{(k)})$可逆，则由$\ref{27}$式可得求解线性方程组$\ref{25}$的牛顿迭代公式

$$
x^{(k+1)} = x^{(k)} - [F'(x^{(k)})]^{-1}F(x^{(k)}).
\label{28}
$$

实际计算中，在计算过程的第$k$步，通常是先计算$F(x^{(k)})$和$F'(x^{(k)})$，再解线性方程组

$$
F'(x^{(k)})\Delta x^{(k)} = -F(x^{(k)}),
\label{29}
$$

得到$\Delta x^{(k)}$后，令

$$
x^{(k+1)} = x^{(k)} + \Delta x^{(k)}.
\label{30}
$$

即可。