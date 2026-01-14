# Week10a

现在我们的最终目的是求解一个函数的最小值，现在介绍下降法

## 下降法

1. 选初始解$x^0$；
2. 对于第$k$次迭代解$x^k$，确定搜索方向$d^k \in R^n$，并在此方向确定搜索步长$\alpha^k \in R$，令
$x^{k+1}=x^k+\alpha^k d^k$，使$f(x^{k+1})<f(x^k)$；
3. 若$x^{k+1}$符合给定的迭代终止原则，停止迭代，最优解$x^* = x^{k+1}$；否则，转步骤2。

### 搜索方向

1. 最速下降法

首先注意到
$$
f(\boldsymbol{x}^{k+1}) = f(\boldsymbol{x}^k + \boldsymbol{d}^k) = f(\boldsymbol{x}^k) + \nabla f^T(\boldsymbol{x}^k)\boldsymbol{d}^k.
\label{eq:20}
$$

显然，只要满足

$$
\nabla f^T(\boldsymbol{x}^k)\boldsymbol{d}^k < 0,
\label{eq:21}
$$

$\boldsymbol{d}^k$就是下降方向。满足$\ref{eq:21}$式的下降方向有无穷多个，其中使$|\nabla f^T(\boldsymbol{x}^k)\boldsymbol{d}^k|$达到最大的是

$$
\boldsymbol{d}^k = -\nabla f(\boldsymbol{x}^k),
\label{eq:22}
$$

称为最速下降方向，因为梯度方向是函数增长最快的方向，所以毫不奇怪，负梯度方向就是最速下降方向。对应的方法称最速下降法，或梯度法，其迭代公式为(设$\alpha^k=1$)

$$
\boldsymbol{x}^{k+1} = \boldsymbol{x}^k - \nabla f(\boldsymbol{x}^k).
\label{eq:23}
$$

2. 牛顿法

利用二阶分解式得到：
$$
\mathbf{x}^{(k+1)} = \mathbf{x}^{(k)} - [\nabla^2 f(\mathbf{x}^{(k)})]^{-1} \nabla f(\mathbf{x}^{(k)})
\label{eq:24}
$$

该方法仍然称为牛顿法。此时搜索步长$\alpha^k=1$，搜索方向为
$$
\mathbf{d}^k = -(\nabla^2 f(\mathbf{x}^k))^{-1} \nabla f(\mathbf{x}^k)
\label{eq:25}
$$
称为牛顿方向。当黑塞矩阵$\nabla^2 f(\mathbf{x}^k)$正定时，其逆矩阵仍正定，所以$\ref{eq:25}$式的$\mathbf{d}^k$满足$(21)$式，即牛顿方向是下降方向。
牛顿方向$\mathbf{d}^k$满足
$$
\nabla^2 f(\mathbf{x}^k)\mathbf{d}^k = -\nabla f(\mathbf{x}^k)
\label{eq:26}
$$
该方程组称为牛顿方程。

注意此时我们的收敛性较好，但是依赖$\nabla^2 f(\mathbf{x}^k)$的性质。

3. 拟牛顿方法

较为复杂，目的是为了规避牛顿方法的病态问题。

> [!NOTE]
>
> 考试考察编程规则，算法语言。
>
> 核心考察是怎么使用编程语言实现一些简单的数学逻辑。

### 搜索步长

搜索方向$d^k$确定后，求步长$\alpha^k$实际上是一个一维优化问题：

$$
\min_{\alpha} f(\boldsymbol{x}^k + \alpha \boldsymbol{d}^k),
\label{eq:30}
$$

称一维搜索（或线搜索），显然其精确解应满足

$$
(\boldsymbol{d}^k)^{\mathrm{T}} \nabla f(\boldsymbol{x}^k + \alpha \boldsymbol{d}^k) = 0.
\label{eq:31}
$$
实际方法中较为有效的是插值方法：

中更为有效的是插值方法，对$f(\mathbf{x}^k + \alpha \mathbf{d}^k)$采用二次插值函数
$$
q(\alpha) = a\alpha^2 + b\alpha + c
\label{eq:32}
$$
其中$a, b, c$可由$\alpha=0$的函数值和导数值$q(0) = f(\mathbf{x}^k)$，$q'(0) = \nabla f(\mathbf{x}^k)^\mathrm{T}\mathbf{d}^k$，以及另一点的函数值$q(\alpha) = f(\mathbf{x}^k + \alpha \mathbf{d}^k)$确定，而$\alpha$的最优值取使$q(\alpha)$达到最小的$\alpha_{\min} = -b/2a$。

## 最小二乘法

### 线性最小二乘法

这个有直接的公式可以求解，是简单的。

### 非线性最小二乘法

转为
$$
\min_{\mathbf{x}} R, \quad R = \frac{1}{2} \mathbf{r}^{\text{T}}(\mathbf{x}) \mathbf{r}(\mathbf{x}) = \frac{1}{2} \sum_{i=1}^{n} [f(\mathbf{x}, t_i) - y_i]^2.
$$
然后使用下降法求解。

## MATLAB求解

### 有界单变量优化问题

可以使用$fminbnd$、$fminunc$ 和 $fminsearch$三种函数。

```matlab
% 1. 定义目标函数
% 我们可以使用匿名函数来定义 f(x) = x^2 - 4x + 5
% 这个函数在 x=2 处有最小值 f(2) = 4 - 8 + 5 = 1
target_function = @(x) x.^2 - 4.*x + 5;

% 2. 定义搜索区间
lower_bound = 0;
upper_bound = 5;

% 3. 调用 fminbnd 寻找最小值
[x_at_min, min_value] = fminbnd(target_function, lower_bound, upper_bound);

% 4. 显示结果
fprintf('函数 f(x) = x^2 - 4x + 5 在区间 [%d, %d] 上的最小值：\n', lower_bound, upper_bound);
fprintf('最小值点 x = %.4f\n', x_at_min);
fprintf('函数最小值 f(x) = %.4f\n', min_value);
```

### 非线性最小二乘问题

使用$lsqnonlin$和$lsqcurvefit$来求解：

```matlab
% 1. 定义数据
xdata = [0.9 1.5 1.3 2.1 2.6 3.0 3.5 3.9 4.4 4.8];
ydata = [0.7 1.1 0.9 1.5 1.8 2.0 2.3 2.5 2.8 3.0];

% 2. 定义非线性函数（残差函数）
% lsqnonlin 最小化的是这个函数的平方和
fun = @(x, xdata, ydata) x(1) * exp(x(2) * xdata) - ydata;

% 3. 定义初始猜测值
x0 = [1; 0.1]; % x(1) 和 x(2) 的初始猜测

% 4. 调用 lsqnonlin
[x, resnorm] = lsqnonlin(@(x) fun(x, xdata, ydata), x0);

% 5. 显示结果
disp('拟合参数 x:');
disp(x);
disp('残差平方和 resnorm:');
disp(resnorm);

% 6. 绘制结果（可选）
figure;
plot(xdata, ydata, 'o', 'DisplayName', '原始数据');
hold on;
plot(xdata, x(1) * exp(x(2) * xdata), '-', 'DisplayName', '拟合曲线');
legend('show');
xlabel('xdata');
ylabel('ydata');
title('lsqnonlin 拟合示例');
grid on; 
```

