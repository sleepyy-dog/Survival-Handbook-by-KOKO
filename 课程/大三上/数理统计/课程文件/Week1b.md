# Week1b

  ## 极大似然估计

  > #### **简析:**
  >
  > 对于一个概率密度函数 $p(x|\theta)$，其输入包含两部分：$x$ 表示某一个具体的数据样本；$\theta$ 表示模型的参数。
  >
  > -   如果参数 $\theta$ 是已知且确定的，而 $x$ 是变量，那么这个函数被称为**概率函数 (Probability Function)**。它描述了对于不同的样本点 $x$，其出现的概率是多少。
  > -   如果样本 $x$ 是已知且确定的，而 $\theta$ 是变量，那么这个函数被称为**似然函数 (Likelihood Function)**。它描述了对于不同的模型参数 $\theta$，出现当前样本点 $x$ 的概率是多少。
  >
  > 极大似然估计的核心思想是：利用已知的样本结果，反推出最有可能（即最大概率）导致这些样本结果出现的模型参数值。换言之，极大似然估计提供了一种在“模型已定，参数未知”的情况下，根据观测数据来评估模型参数的方法。

  ### 定义

  > #### **定义 1 (极大似然估计):**
  >
  > 设 $p(x;\theta)$，$\theta \in \Theta$ 是 $(R^n, \mathcal{B}_{R^n})$ 上的一族联合概率密度函数。对给定的样本观测值 $x$，称
  > $$
  > L(\theta; x) = k \cdot p(x; \theta)
  > $$
  > 为参数 $\theta$ 的**似然函数**，其中 $k>0$ 是一个不依赖于 $\theta$ 的常数，通常取 $k=1$。
  >
  > 若存在一个统计量 $\hat{\theta}(x)$，它将样本空间 $(R^n, \mathcal{B}_{R^n})$ 映射到参数空间 $(\Theta, \mathcal{B}_{\Theta})$，并满足：
  > $$
  > L(\hat{\theta}(x); x) = \sup_{\theta \in \Theta} L(\theta; x)
  > $$
  > 则称 $\hat{\theta}(x)$ 为参数 $\theta$ 的一个**极大似然估计 (Maximum Likelihood Estimate, MLE)**。

  > [!NOTE]
  >
  > “最大似然估计”和“极大似然估计”是完全等同的概念。

  > #### **题目 (P156 例4.1.4):**
  >
  > 设总体 $X$ 服从均匀分布 $U(0, \theta)$，其中 $\theta \in (0, +\infty)$ 是未知参数。设 $X_1, X_2, \dots, X_n$ 是取自总体 $X$ 的一个样本，求参数 $\theta$ 的极大似然估计。

  **解：**
  样本 $X_1, X_2, \dots, X_n$ 的联合概率密度函数为：
$$
  f(x_1, \dots, x_n; \theta) = \prod_{i=1}^{n} f(x_i; \theta) = \prod_{i=1}^{n} \frac{1}{\theta} I(0 \le x_i \le \theta)
$$
  其中 $I(\cdot)$ 为示性函数。因此，似然函数为：
$$
  L(\theta; x_1, \dots, x_n) =
  \begin{cases}
  \frac{1}{\theta^n}, & 0 \le \min(x_i) \text{ and } \max(x_i) \le \theta \\
  0, & \text{其他}
  \end{cases}
$$
  为了使 $L(\theta)$ 最大化，我们需要在满足约束条件 $\theta \ge \max(x_i)$ 的前提下，使分母 $\theta^n$ 尽可能小。显然，当 $\theta$ 取其可能的最小值时，$L(\theta)$ 达到最大值。
  因此，参数 $\theta$ 的极大似然估计为：
$$
  \hat{\theta} = \max(X_1, X_2, \dots, X_n)
$$
  **证毕。**

  由于概率密度函数常包含指数项，直接处理乘积会很复杂。因此，我们通常对似然函数取对数，这并不会改变其极值点的位置。称
$$
  l(\theta; x) = \ln L(\theta; x)
$$
  为 $\theta$ 的**对数似然函数**。
  这样做的好处在于可以将乘积运算转化为加和运算，从而简化求导过程：
$$
  \ln L(\theta) = \ln \left( \prod_{i=1}^{n} f(x_i; \theta) \right) = \sum_{i=1}^{n} \ln f(x_i; \theta)
$$

  > #### **题目 (P156 例4.1.1):**
  >
  > 设总体 $X$ 服从参数为 $1/\theta$ 的指数分布 $E(1/\theta)$，其中 $\theta>0$ 是未知参数。设 $X_1, X_2, \dots, X_n$ 是来自总体 $X$ 的一个样本，求参数 $\theta$ 的极大似然估计，并判别其无偏性。

  **解：**
  首先，单个样本 $x_i$ 的概率密度函数 (PDF) 为：
$$
  f(x_i; \theta) =
  \begin{cases}
  \frac{1}{\theta} e^{-x_i/\theta}, & x_i > 0 \\
  0, & \text{其他}
  \end{cases}
$$
  样本的似然函数为：
$$
  L(\theta) = \prod_{i=1}^{n} f(x_i; \theta) =
  \begin{cases}
  \frac{1}{\theta^n} \exp\left(-\frac{1}{\theta} \sum_{i=1}^{n} x_i\right), & \text{所有 } x_i > 0 \\
  0, & \text{其他}
  \end{cases}
$$
  其对数似然函数为：
$$
  l(\theta) = \ln L(\theta) = -n\ln\theta - \frac{1}{\theta}\sum_{i=1}^{n}x_i
$$
  对 $\theta$ 求导，得到似然方程：
$$
  \frac{d l(\theta)}{d\theta} = -\frac{n}{\theta} + \frac{1}{\theta^2}\sum_{i=1}^{n}x_i = 0
$$
  解得：
$$
  \theta = \frac{1}{n}\sum_{i=1}^{n}x_i = \bar{x}
$$
  为验证其为极大值点，我们求二阶导数：
$$
  \frac{d^2 l(\theta)}{d\theta^2} = \frac{n}{\theta^2} - \frac{2}{\theta^3}\sum_{i=1}^{n}x_i = \frac{n}{\theta^2}\left(1 - \frac{2\bar{x}}{\theta}\right)
$$
  将 $\theta = \bar{x}$ 代入二阶导数：
$$
  \left. \frac{d^2 l(\theta)}{d\theta^2} \right|_{\theta=\bar{x}} = \frac{n}{\bar{x}^2}(1 - 2) = -\frac{n}{\bar{x}^2} < 0
$$
  二阶导数为负，表明 $\theta = \bar{x}$ 是一个极大值点。因此，$\theta$ 的极大似然估计量是 $\hat{\theta} = \bar{X}$。

  **无偏性判别：**
  指数分布 $E(1/\theta)$ 的期望为 $E(X) = \theta$。
$$
  E(\hat{\theta}) = E(\bar{X}) = E\left(\frac{1}{n}\sum_{i=1}^{n}X_i\right) = \frac{1}{n}\sum_{i=1}^{n}E(X_i) = \frac{1}{n} \cdot n\theta = \theta
$$
  由于 $E(\hat{\theta}) = \theta$，所以 $\hat{\theta} = \bar{X}$ 是 $\theta$ 的无偏估计。

  **证毕。**

  > [!NOTE]
  >
  > 当极大似然估计 (MLE) 存在时，最常用的求解方法是求导。如果 $\hat{\theta}(x)$ 是参数空间 $\Theta$ 的一个**内点**，并且似然函数可微，则 $\hat{\theta}(x)$ 必然是下列**似然方程**的解：
  > $$
  > \frac{\partial l(\theta; x)}{\partial \theta_i} = 0, \quad i = 1, \dots, k
  > $$

  > #### **题目 (P156 例4.1.3):**
  >
  > 设总体 $X \sim N(\mu, \sigma^2)$，其中 $\mu$ 和 $\sigma^2$ 均为未知参数。设 $x_1, \dots, x_n$ 是来自 $X$ 的一个样本值，求 $\mu$ 和 $\sigma^2$ 的极大似然估计量，并判别其无偏性。

  **解：**
  设 $X_1, \dots, X_n$ 是来自 $N(\mu, \sigma^2)$ 的一个样本。其对数似然函数为：
$$
  l(\mu, \sigma^2) = \ln \left[ \prod_{i=1}^{n} \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(-\frac{(x_i - \mu)^2}{2\sigma^2}\right) \right]
$$
$$
  l(\mu, \sigma^2) = -\frac{n}{2}\ln(2\pi) - \frac{n}{2}\ln(\sigma^2) - \frac{1}{2\sigma^2}\sum_{i=1}^{n}(x_i - \mu)^2
$$
  对 $\mu$ 和 $\sigma^2$ 分别求偏导，并令其为零：
$$
  \frac{\partial l}{\partial \mu} = \frac{1}{\sigma^2}\sum_{i=1}^{n}(x_i - \mu) = \frac{1}{\sigma^2}(n\bar{x} - n\mu) = 0 \implies \hat{\mu} = \bar{x}
$$
$$
  \frac{\partial l}{\partial \sigma^2} = -\frac{n}{2\sigma^2} + \frac{1}{2(\sigma^2)^2}\sum_{i=1}^{n}(x_i - \mu)^2 = 0
$$
  将 $\mu = \hat{\mu} = \bar{x}$ 代入上式，解得：
$$
  \hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^{n}(x_i - \bar{x})^2
$$
  因此，$\mu$ 和 $\sigma^2$ 的极大似然估计量分别为 $\hat{\mu} = \bar{X}$ 和 $\hat{\sigma}^2 = \frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2$。

  **无偏性判别：**
  1.  对于 $\hat{\mu}$：
      $$
      E(\hat{\mu}) = E(\bar{X}) = \mu
      $$
      所以 $\hat{\mu}$ 是 $\mu$ 的无偏估计。
  2.  对于 $\hat{\sigma}^2$：
      我们知道样本方差 $S^2 = \frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2$ 是 $\sigma^2$ 的无偏估计，即 $E(S^2) = \sigma^2$。
      $$
      E(\hat{\sigma}^2) = E\left(\frac{n-1}{n} S^2\right) = \frac{n-1}{n} E(S^2) = \frac{n-1}{n}\sigma^2 \neq \sigma^2
      $$
      所以 $\hat{\sigma}^2$ 是 $\sigma^2$ 的有偏估计。

  **证毕。**

---

  ### 极大似然估计的不变性

  如果 $\hat{\theta}$ 是参数 $\theta$ 的极大似然估计，而 $g(\cdot)$ 是一个函数，则 $g(\hat{\theta})$ 是 $g(\theta)$ 的极大似然估计。

  > [!NOTE]
  >
  > 该性质非常有用。例如，在正态分布的例子中，我们得到了 $\sigma^2$ 的极大似然估计 $\hat{\sigma}^2$。根据不变性，标准差 $\sigma$ 的极大似然估计就是 $\hat{\sigma} = \sqrt{\hat{\sigma}^2} = \sqrt{\frac{1}{n}\sum(X_i - \bar{X})^2}$。

  ## PMF和PDF的直方图估计

  设 $X_1, \dots, X_n$ 是来自随机变量 $X$ 的一个随机样本，$X$ 的累积分布函数 (CDF) 为 $F(x)$。本节我们讨论样本的直方图，它可以作为 $X$ 的概率质量函数 (PMF) $p(x)$ 或概率密度函数 (PDF) $f(x)$ 的估计，具体取决于 $X$ 是离散型还是连续型。

  与参数估计不同，我们在这里不对 $X$ 的分布形式做任何参数化的假定（如假定其为正态分布或指数分布）。因此，直方图是一种**非参数估计 (Nonparametric Estimator)**。

  ### 离散型随机变量的PMF估计

  假定 $X$ 是一个离散随机变量，其 PMF 为 $p(x)$。

  #### **有限空间情形**

  如果 $X$ 的样本空间是有限的，例如 $D=\{a_1, \dots, a_m\}$，那么 $p(a_i)$ 的一个直观估计量就是样本中观测值等于 $a_i$ 的相对频率。我们可以定义统计量：
$$
  I_i(X_j) =
  \begin{cases}
  1, & X_j = a_i \\
  0, & X_j \neq a_i
  \end{cases}
$$
  于是，$p(a_i)$ 的估计量可以表示为：
$$
  \hat{p}(a_i) = \frac{1}{n}\sum_{j=1}^{n}I_i(X_j) = \frac{\text{样本中 } a_i \text{ 出现的次数}}{n}
$$
  估计向量 $(\hat{p}(a_1), \dots, \hat{p}(a_m))$ 构成了对 PMF $p(x)$ 的非参数估计。由于 $I_i(X_j)$ 服从伯努利分布，易证该估计量是无偏的。

  #### **无限空间情形**

  如果 $X$ 的样本空间是无限的，例如 $D=\{a_1, a_2, \dots\}$。在实际应用中，我们通常会选取一个截断点 $a_m$，然后将后续的值分到同一个组中：
$$
  \{a_1\}, \{a_2\}, \dots, \{a_{m-1}\}, \bar{a}_m = \{a_m, a_{m+1}, \dots\}
$$
  此时，我们估计 $p(a_1), \dots, p(a_{m-1})$ 以及合并组的概率 $p(\bar{a}_m)$。$\hat{p}(\bar{a}_m)$ 表示样本中观测值大于或等于 $a_m$ 的比例。这样，估计向量 $(\hat{p}(a_1), \dots, \hat{p}(a_{m-1}), \hat{p}(\bar{a}_m))$ 构成了对 $p(x)$ 的估计。

  #### **关于直方图**

  直方图是 $\hat{p}(a_i)$ 关于 $a_i$ 的柱状图。
  -   如果 $a_i$ 的值表示**类别 (Category)**（如头发颜色），它们之间没有顺序关系，那么通常绘制**条形图 (Bar Chart)**。条柱之间不相邻，并且常按照高度（即相对频率）的递减顺序排列。
  -   如果 $a_i$ 的值是**数值型**的，有明确的顺序，则绘制标准的直方图，条柱通常是相邻的。