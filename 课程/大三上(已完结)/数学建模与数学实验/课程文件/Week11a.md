# Week11a

## 线性规划

我们已经给出了优化问题的数学规划模型的一般形式(其中 $min$ 也可以是 $max$):

$$
\min z = f(\mathbf{x}), \quad \mathbf{x} = (x_1, x_2, \dots, x_n)^{\text{T}} \in \mathbb{R}^n,
\label{eq:1}
$$

$$
s.t. \quad g_i(\mathbf{x}) \le 0, \quad i = 1, 2, \dots, m.
\label{eq:2}
$$

当函数 $f(x)$ 和 $g_i(x)$ 都是线性函数时，这是一个线性规划问题。

## 线性规划基本解法

### 二维图解法

> #### 例1：
>
> 求解线性规划
>
> $$
> \max z = 3x_1 + x_2
> $$
>
> $$
> s.t.
> \begin{cases}
> x_1 - x_2 \ge -2, \\
> x_1 - 2x_2 \le 2, \\
> 3x_1 + 2x_2 \le 14, \\
> x_1, x_2 \ge 0.
> \end{cases}
> $$
>

**解：**

如果将前3个约束条件的不等号改成等号，是平面上的如下3条直线：

$$
\begin{aligned}
L_1: x_1 - x_2 &= -2, \\
L_2: x_1 - 2x_2 &= 2, \\
L_3: 3x_1 + 2x_2 &= 14.
\end{aligned}
$$

在平面上作图后不难判断（参见图$8.1$），可行域是由3条直线$L_1, L_2, L_3$及坐标轴在第一象限围成的5边形$OQ_1Q_2Q_4Q_3$，其顶点的坐标可以求出，分别为$O(0,0), Q_1(0,2), Q_2(2,4), Q_4(4,1), Q_3(2,0)$。

![image-20251117143643250](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202511171436324.png)

当目标函数$z=3x_1+x_2$取不同值时，表示一组平行直线，如图$8.1$中过$O, Q_1, Q_2, Q_3, Q_4$点的虚线，其函数值$z$分别为$z_1 = 0, z_2 = 2, z_3 = 6, z_4=10, z_5=13$。由于这组直线向右移动时函数值是增加的（想想为什么），所以最优解一定在$Q_4$点得到：$x_1=4, x_2=1$，最优值为$z_{max}=z_5=13$。

以上方法时显然的，我们看下一个进阶的方法。

### 单纯形算法

首先将问题矩阵化：

$$
\min z = \boldsymbol{c}^\top \boldsymbol{x}
$$

$$
\text{s. t. } \boldsymbol{A}\boldsymbol{x} = \boldsymbol{b},
$$

$$
\boldsymbol{x} \ge \boldsymbol{0}.
$$

将此形式称为线性规划的标准形。

* 去掉参数的方法是增加变量，例如以例一为例：

$$
\begin{cases}
-x_1 + x_2 + x_3 = 2, & x_3 &\geq 0. \\
x_1 - 2x_2 + x_4 = 2, & x_4 &\geq 0. \\
3x_1 + 2x_2 + x_5 = 14, & x_5 &\geq 0.
\end{cases}
$$

* 如果某个 $x_j$ 没有非负约束，可令 $x_j = x_j' - x_j''$; $x_j', x_j'' \ge 0$；如果原来约束为 $x_j \ge l_j$，可令 $x_j' = x_j - l_j$, $x_j' \ge 0$。

继续以例一为例：

转化为标准形后，约束矩阵$A$和右端项向量$b$分别是

$$
A = \begin{bmatrix}
-1 & 1 & 1 & 0 & 0 \\
1 & -2 & 0 & 1 & 0 \\
3 & 2 & 0 & 0 & 1
\end{bmatrix} = [p_1 \quad p_2 \quad p_3 \quad p_4 \quad p_5], \quad b = (2,2,14)^T
\label{eq:matrix_A_b}
$$

其中$p_1, p_2, \dots, p_5$为$A$的$n=5$个列向量。线性方程组$Ax=b$的基解可以如下得到：$A$的秩$m=3$，为了保证指定$n-m=2$个分量的取值为0后$Ax=b$有唯一解，任取$m=3$个线性无关的列向量组成基（也称基矩阵）$A_B$，其余列向量组成非基$A_N$，将$A$的列向量重排次序后可写作$A=[A_B \quad A_N]$，相应地重排$x$的分量$x=\begin{bmatrix} x_B \\ x_N \end{bmatrix}$，于是$Ax=A_Bx_B+A_Nx_N=b$。分别称$x_B, x_N$为基变量（$basic \ variables$）和非基变量（$nonbasic \ variables$），令非基变量$x_N=0$，解得基变量$x_B=A_B^{-1}b$（自然，$A_B$是可逆矩阵）。

对于例1如取$A_B=[p_3 \quad p_4 \quad p_5]=I$(单位阵),则$x_B=(x_3, x_4, x_5)^T=b=(2,2,14)^T$，而$x_N=(x_1,x_2)^T=(0,0)^T$，于是$x=(0,0,2,2,14)^T$为$Ax=b$的一个基解，图$8.1$中它对应$O$点。
类似地，若取$A_B=[p_1 \quad p_3 \quad p_5]$，则$x_B=(x_1, x_3, x_5)^T=A_B^{-1}b=(2,4,8)^T$，$x=(2,0,4,0,8)^T$也是一个基解，对应图$8.1$中的$Q_3$点。
若取$A_B=[p_2 \quad p_3 \quad p_5]$，则$x_B=(x_2, x_3, x_5)^T=A_B^{-1}b=(-1,3,16)^T$，$x=(0,-1,3,0,16)^T$也是一个基解，对应图$8.1$中的$R_1$点，我们看到，$R_1$点不在可行域内。

![image-20251117143643250](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202511171436324.png)

容易知道，例1共有10个基解，其中5个分别对应可行域(5边形)的5个顶点，是基可行解。一般地，基解最多有$\binom{n}{m} = \frac{n!}{m!(n-m)!}$个，但基可行解的个数则要视具体问题而定。

接着我们需要研究的是如何在以上基可行解中快速选择，找到最优解。

判别一个基可行解是否为最优解的“判别公式”是：

$$
z_N = c_N^T - c_B^T B^{-1} N
$$

其中 $z_N$ 称为**检验数（或相对费用系数）**；

若是**最小化问题**，且 $z_N = c_N^T - c_B^T B^{-1} N \;\;\ge 0$ 则当前基可行解为**最优解**；

## 对偶问题

对于上面定义的拉格朗日乘子$\lambda^T = c_B^T A_B^{-1}$，在最优基下有$r_k = c_k - c_B^T A_B^{-1} p_k = c_k - \lambda^T p_k \ge 0$。(对于基变量，等号一定成立)。写成矩阵形式，就是$c^T - \lambda^T A \ge 0$，即

$$
A^T \lambda \le c.
\label{eq:32}
$$

对于最优解$x$，有

$$
b^T \lambda = \lambda^T b = c_B^T A_B^{-1} b = c^T x.
\label{eq:33}
$$

但如果$x$只是可行解，且$\lambda$只是满足$\ref{eq:32}$式的一个向量(不考虑定义$\lambda^T = c_B^T A_B^{-1}$)，则

$$
b^T \lambda = \lambda^T b = \lambda^T A x \le c^T x.
\label{eq:34}
$$

因此，可以考虑如下新的相关的线性规划：

$$
\begin{aligned}
& \max b^T \lambda \\
& \text{s. t. } A^T \lambda \le c.
\end{aligned}
\label{eq:35}
$$

这个问题称为原问题

$$
\min z = \boldsymbol{c}^\top \boldsymbol{x}
$$

$$
\text{s. t. } \boldsymbol{A}\boldsymbol{x} = \boldsymbol{b},
$$

$$
\boldsymbol{x} \ge \boldsymbol{0}.
$$

的对偶问题。关于对偶问题，可以证明下面的一些重要结果。

## 编程实现

首先写为

$$
\min z = \boldsymbol{c}^{\mathrm{T}}\boldsymbol{x}
$$

$$
\mathrm{s.t.}\ \boldsymbol{A}_1\boldsymbol{x} \leq \boldsymbol{b}_1,
$$

实现代码：

```matlab
x=linprog(c,A1,b1);
```

如果增加一下条件：

$$
\boldsymbol{A}_2\boldsymbol{x} = \boldsymbol{b}_2,
$$

$$
\boldsymbol{v}_1 \leq \boldsymbol{x} \leq \boldsymbol{v}_2.
$$

```matlab
[x,fv,ef,out,lambda]=linprog(c,A1,b1,A2,b2,v1,v2,x0,opt);
```

以上输入参数参考：

假设当前迭代位于基本可行解$x^{(0)} = \begin{bmatrix} x_B^{(0)} \\ x_N^{(0)} \end{bmatrix} = \begin{bmatrix} A_B^{-1}b \\ 0 \end{bmatrix}$，对应的基矩阵和非基矩阵分别为$A_B, A_N$，费用向量$c = \begin{bmatrix} c_B \\ c_N \end{bmatrix}$，目标函数值为

$$
z^{(0)} = c^T x^{(0)} = c_B^T x_B^{(0)} + c_N^T x_N^{(0)} = c_B^T A_B^{-1}b
\label{eq:21}
$$

输出$x$为最优解，$fv$为最优值；$ef$为程序停止的标志，表示程序停止的原因（含义与无约束优化中介绍的相同）；$out$是一个结构变量，包括程序运行的有关信息，含有3个域:

```matlab
output =

iterations : 5                     % 迭代次数
cgiterations : 0                   % PCG 迭代次数 (只在大规模算法中有用)
algorithm : 'large-scale : interior point' % 所使用的算法为内点法
```

$lambda$也是一个结构变量，包含以下4个域，分别对应于程序停止时相应约束的拉格朗日乘子，即：

```matlab
lambda.ineqlin % 对应于不等式约束 A₁x ≦ b₁ 的拉格朗日乘子
lambda.eqlin   % 对应于等式约束 A₂x = b₂ 的拉格朗日乘子
lambda.upper   % 对应于上界约束 x ≦ v₂ 的拉格朗日乘子
lambda.lower   % 对应于下界约束 v₁ ≦ x 的拉格朗日乘子
```

其维数等于约束条件的个数，其非零分量对应于起作用的约束（$active$ $constraints$，即等号严格成立时的约束，也称为有效约束或积极约束）；而对于不起作用的约束，对应的$Lagrange$乘子一定是$0$。

对于例一的计算示例：

```matlab
c = -[3,1];               % 加负号将求极大化为求极小
A = [-1,1;-2,3;2];
b = [2,2,14];
v1 = [0 0];               % 下界
[x,f,exitflag,output,lag] = linprog(c,A,b,[],[],v1);
```

其中lag输出结果为 $lag.ineqlin=(0,0.3750,0.8750)$，第2，第3分量非零，表示第2，第3个约束是起作用的，即第2，第3个约束对于最优解是等式约束（在图8.1中我们已经看到，最优解$x=(4,1)$是$L_2,L_3$的交点）；第1分量为0表示第1个约束不起作用（查看 $lag.lower$ 可知下界约束$(x_1, x_2 \ge 0)$也不起作用），它们对于最优解仍为严格不等式约束。

我们可以选择不同的算法：

```matlab
% 默认使用大规模算法
[x,f,exitflag,output,lag] = linprog(c,A,b,[],[],v1);
opt1 = optimset('largescale', 'off'); % 有效集方法
[x,f,exitflag,output,lag]=linprog(c,A,b,[],[],[],[],[],opt1);
opt2 = optimset(opt1, 'simplex', 'on'); % 单纯形算法
[x,f,exitflag,output,lag]=linprog(c,A,b,[],[],[],[],[],opt2);
```
