# Week16a

我们需要回归模型来进行预测。

## 一元线性回归分析

我们需要计算一个一元线性回归模型：

$$
y = \beta_0 + \beta_1 x + \varepsilon
$$

我们使用最小二乘估计：

$$
Q(\beta_0, \beta_1) = \sum_{i=1}^{n} \varepsilon_i^2 = \sum_{i=1}^{n} [y_i - (\beta_0 + \beta_1 x_i)]^2。
$$

记

$$
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i， \quad \bar{y} = \frac{1}{n} \sum_{i=1}^{n} y_i， \quad s_{xx} = \sum_{i=1}^{n} (x_i - \bar{x})^2， \quad s_{xy} = \sum_{i=1}^{n} (x_i - \bar{x})(y_i - \bar{y})。
$$

解出 $\beta_0$，$\beta_1$ 的估计值，记作

$$
\hat{\beta}_1 = \frac{s_{xy}}{s_{xx}}， \quad \hat{\beta}_0 = \bar{y} - \hat{\beta}_1 \bar{x}。
$$

可以看出，直线 $y = \hat{\beta}_0 + \hat{\beta}_1 x$ 通过数据 $x_i$，$y_i$ 的均值点 $(\bar{x}, \bar{y})$。

## MATLAB实现

#### 1. 调用语法

```matlab
b = regress(y, X);
[b, bint, r, rint, s] = regress(y, X, alpha);
```

#### 2. 输入参数

* **`y`**：因变量，为 $n \times 1$ 的列向量。
* **`X`**：自变量矩阵。通常第一列为全 $1$ 向量（用于计算截距项），其余列为自变量数据。
* **`alpha`**：显著性水平 $\alpha$。默认值为 $0.05$，即对应 $95\%$ 的置信度。

#### 3. 输出参数

* **`b`**：回归系数估计值向量 $(\hat{\beta}_0, \hat{\beta}_1, \dots)$。
  * **注意**：`b` 中元素的顺序与 `polyfit` 函数的输出顺序相反。
* **`bint`**：回归系数的置信区间。
* **`r`**：残差（列向量）。
* **`rint`**：残差的置信区间。
* **`s`**：包含 $4$ 个统计量的向量，用于评价回归效果：
  1. **决定系数 $R^2$**：衡量模型拟合优度。
  2. **$F$ 值**：回归检验的 $F$ 统计量。
  3. **$p$ 值**：$F(1, n-2)$ 分布大于 $F$ 值的概率。当 $p < \alpha$ 时，拒绝原假设 $H_0$，说明回归模型有效。
  4. **剩余方差 $s^2$**：误差项的方差估计。

