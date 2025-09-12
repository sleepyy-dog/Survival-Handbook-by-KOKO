# Week1b

## 直接解法

> #### **目的:**
>
> 直接求解线性方程组 $Ax=b$。

### 三角矩阵求解

当系数矩阵为三角矩阵时，可以高效地求解。

#### **下三角矩阵 (Forward Substitution)**

当线性方程组为 $Lx=b$，其中 $L$ 是一个下三角矩阵时：
$$
L = \begin{bmatrix} l_{11} & & & & \\ l_{21} & l_{22} & & & \\ l_{31} & l_{32} & l_{33} & & \\ \vdots & \vdots & \vdots & \ddots & \\ l_{n1} & l_{n2} & l_{n3} & \cdots & l_{nn} \end{bmatrix}
$$
此时方程组的第 $j$ 个方程为：
$$
\sum_{i=1}^{j}l_{ji}x_i=b_j
$$
我们可以通过向前代入法，依次求解 $x_1, x_2, \dots, x_n$。解的计算公式如下：
$$
x_j=\frac{b_j-\sum_{i=1}^{j-1}l_{ji}x_i}{l_{jj}}, \quad j=1, 2, \dots, n
$$
其 `MATLAB` 实现代码如下，该算法被称为**前代法**或**顺序高斯消去法**。

```matlab
function x = forward_substitution(L, b)
    n = length(b);
    x = zeros(n, 1);
    for j = 1:n
        % 在MATLAB中，当 j=1 时，索引 1:j-1 (即 1:0) 会创建一个空向量，
        % 这使得内积 L(j, 1:j-1) * x(1:j-1) 的结果为0，代码无需特殊处理。
        x(j) = (b(j) - L(j, 1:j-1) * x(1:j-1)) / L(j, j);
    end
end
```

#### **上三角矩阵 (Backward Substitution)**

当线性方程组为 $Ux=b$，其中 $U$ 是一个上三角矩阵时，我们可以通过向后代入法，依次求解 $x_n, x_{n-1}, \dots, x_1$。解的计算公式如下：
$$
x_j=\frac{b_j-\sum_{i=j+1}^{n}u_{ji}x_i}{u_{jj}}, \quad j=n, n-1, \dots, 1
$$
其 `MATLAB` 实现代码如下，该算法被称为**回代法**。

```matlab
function x = backward_substitution(U, b)
    n = length(b);
    x = zeros(n, 1);
    for j = n:-1:1
        % 当 j=n 时，索引 j+1:n (即 n+1:n) 会创建一个空向量，
        % 内积 U(j, j+1:n) * x(j+1:n) 的结果为0，代码无需特殊处理。
        x(j) = (b(j) - U(j, j+1:n) * x(j+1:n)) / U(j, j);
    end
end
```

## Gauss变换

> #### **目的:**
>
> 将一个可逆矩阵 $A$ 分解为一个单位下三角矩阵 $L$ 和一个上三角矩阵 $U$ 的乘积，即 $A=LU$。这个过程也称为 **LU分解**。

### 初等下三角阵

高斯消元法的每一步都可以通过左乘一个**初等下三角矩阵**（或称**高斯变换矩阵**）来实现。第 $k$ 步的初等下三角矩阵定义为：
$$
L_k = I - \boldsymbol{l}_k e_k^T
$$
其中 $e_k$ 是第 $k$ 个坐标向量（即单位矩阵的第 $k$ 列），而向量 $\boldsymbol{l}_k$ 的形式如下：
$$
\boldsymbol{l}_k = (0, \dots, 0, l_{k+1,k}, \dots, l_{n,k})^T
$$
其中的分量（乘数）由下式计算得出：
$$
l_{ik} = \frac{a_{ik}^{(k-1)}}{a_{kk}^{(k-1)}}, \quad i = k+1, \dots, n
$$
这里 $A^{(k-1)}$ 是经过 $k-1$ 步消元后的矩阵，并记 $A^{(0)}=A$。矩阵 $L_k$ 的具体形式为：
$$
L_k = \begin{bmatrix} 1 & & & & & & \\ & \ddots & & & & & \\ & & 1 & & & & \\ & & -l_{k+1,k} & 1 & & & \\ & & \vdots & & \ddots & & \\ & & -l_{n,k} & & & 1 \end{bmatrix}
$$
左乘 $L_k$ 的作用是将矩阵 $A^{(k-1)}$ 的第 $k$ 列对角线以下的元素全部消为零，从而得到 $A^{(k)}$。即 $A^{(k)} = L_k A^{(k-1)}$。

经过 $n-1$ 步消元后，我们得到：
$$
L_{n-1} \cdots L_2 L_1 A = U
$$
其中 $U$ 是一个上三角矩阵。由此可得 $A=LU$ 分解，其中 $L = (L_{n-1} \cdots L_1)^{-1} = L_1^{-1} \cdots L_{n-1}^{-1}$。

> #### **定理 1.1.1**
>
> 高斯消去法进行到第 $k$ 步时，主元 $a_{ii}^{(i-1)} \neq 0$ 对所有 $i = 1, \dots, k$ 成立的充分必要条件是矩阵 $A$ 的前 $k$ 个顺序主子阵 $A_i$ ($i = 1, \dots, k$) 都是非奇异的。

> #### **定理 1.1.2**
>
> 若方阵 $A \in \mathbb{R}^{n \times n}$ 的所有顺序主子阵 $A_k \in \mathbb{R}^{k \times k}$ ($k = 1, \dots, n - 1$) 均非奇异，则存在唯一的单位下三角阵 $L \in \mathbb{R}^{n \times n}$ 和上三角阵 $U \in \mathbb{R}^{n \times n}$，使得 $A = LU$。

上述高斯消去算法能够顺利进行的前提是，在每一步计算乘数时，主元 $a_{kk}^{(k-1)}$ 均不为零。以上两个定理正是确保了这一条件，并指出了 $LU$ 分解存在且唯一的条件。