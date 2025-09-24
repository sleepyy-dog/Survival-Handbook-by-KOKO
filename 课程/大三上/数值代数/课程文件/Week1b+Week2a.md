# Week1b+Week2a

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

> [!TIP]
>
> $NaN$：超出内存。

这意味着我们不光要取到不等于0的数作为分母，同时还需要取绝对值最大的作为分母。

解决方法是用列选主元，但是这种会导致复杂度很高。

我们进化到使用平方根法

## 平方根法

平方根法1.3.1($Cholesky$ 分解定理) 若 $A \in \mathbb{R}^{n \times n}$ **对称正定**，则存在一个对角元均为正数的下三角阵 $L \in \mathbb{R}^{n \times n}$，使得

$$
A = LL^T
$$
上式称为 $Cholesky$ 分解，其中的 $L$ 称做 $A$ 的 $Cholesky$ 因子。

证明 由于 $A$ 对称正定蕴涵着 $A$ 的全部主子阵均正定，因此，由定理 1.1.2 知，存在一个单位下三角阵 $\tilde{L}$ 和一个上三角阵 $U$，使得 $A = \tilde{L}U$。令
$$
D = \text{diag}(u_{11}, \dots, u_{nn}), \quad \tilde{U} = D^{-1}U,
$$
则有
$$
\tilde{U}^T D \tilde{L}^T = A^T = A = \tilde{L} D \tilde{U},
$$
从而
$$
\tilde{L}^T \tilde{U}^{-1} = D^{-1} \tilde{U}^{-T} \tilde{L} D
$$
上式左边是一个单位上三角阵，而右边是一个下三角阵，故两边均为单位矩阵。于是，$\tilde{U} = \tilde{L}^T$，从而 $A = \tilde{L} D \tilde{L}^T$。由此即知，$D$ 的对角元均为正数。令
$$
L = \tilde{L}\text{diag}(\sqrt{u_{11}}, \dots, \sqrt{u_{nn}}),
$$
则 $A = LL^T$，且 $L$ 的对角元 $l_{ii} = \sqrt{u_{ii}} > 0 (i = 1, \dots, n)$。

这里我们的条件：对称正定
1. 对于对称，可以通过遍历来确定。
2. 对于正定，$st \ X^T AX > 0$ 后续简化为判断所谓的微分方程。
因此在此条件下我们只需要一个矩阵就可储存。

比较 $A = LL^T$ 两边对应的元素，得关系式
$$
a_{ij} = \sum_{p=1}^{j} l_{ip} l_{jp}, \quad 1 \le j \le i \le n
$$
首先，由 $a_{11} = l_{11}^2$，得
$$
l_{11} = \sqrt{a_{11}}
$$
再由 $a_{i1} = l_{i1} l_{11}$，得
$$
l_{i1} = a_{i1} / l_{11}, \quad i = 1, \dots, n
$$
这样便得到了矩阵 $L$ 的第一列元素。假定已经算出 $L$ 的前 $k-1$ 列元素，由
$$
a_{kk} = \sum_{p=1}^{k} l_{kp}^2
$$
得
$$
l_{kk} = \left(a_{kk} - \sum_{p=1}^{k-1} l_{kp}^2\right)^{\frac{1}{2}}
$$
再由
$$
a_{ik} = \sum_{p=1}^{k-1} l_{ip} l_{kp} + l_{ik} l_{kk}, \quad i = k+1, \dots, n
$$
得
$$
l_{ik} = \left(a_{ik} - \sum_{p=1}^{k-1} l_{ip} l_{kp}\right) / l_{kk}, \quad i = k+1, \dots, n
$$
这样便又求出了 $L$ 的第 $k$ 列元素。这种方法称为平方根法。

但是这样会出现根号的计算，我们将这一步也简化，提出改进的平方根法。

可以看出，用平方根法解对称正定线性方程组时，计算$L$的对角元$l_{ii}$，需用到开方运算。为了避免开方，我们可求$A$的如下形式的分解：
$$
A = LDL^T
$$
其中$L$是单位下三角阵，$D$是对角元均为正数的对角阵。这一分解称做$LDL^T$分解，是$Cholesky$分解的变形。比较 (1.3.4) 式两边对应的元素，得
$$
a_{ij} = \sum_{k=1}^{j-1} l_{ik}d_k l_{jk} + l_{ij}d_j, \quad 1 \le j \le i \le n
$$
由此可得确定$l_{ij}$和$d_j$的计算公式：
$$
v_k = d_k l_{jk}, \quad k=1, \dots, j-1
$$
$$
d_j = a_{jj} - \sum_{k=1}^{j-1} l_{jk}v_k
$$
$$
l_{ij} = \left(a_{ij} - \sum_{k=1}^{j-1} l_{ik}v_k\right) / d_j, \quad i=j+1, \dots, n
$$
