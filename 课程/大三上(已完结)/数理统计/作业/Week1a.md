# 第一讲

---
> #### **题目一:**
>
> $1.$ 设正态总体 $X \sim N(0, 2^2)$，而 $(X_1, X_2, \dots, X_{15})$ 是来自 $X$ 的样本，令
> $$
> Y = \frac{X_1^2 + X_2^2 + \dots + X_{10}^2}{2(X_{11}^2 + \dots + X_{15}^2)}
> $$
> 试确定随机变量 $Y$ 的分布。

**解：**
已知 $X_i \sim N(0, 2^2)$ 且相互独立。
对 $X_i$ 进行标准化，令 $Z_i = \frac{X_i - 0}{2} = \frac{X_i}{2}$，则 $Z_i \sim N(0, 1)$ 且相互独立。
由此可得 $X_i = 2Z_i$，从而 $X_i^2 = 4Z_i^2$。

我们将统计量 $Y$ 用 $Z_i$ 表示。
令分子为 $U = X_1^2 + X_2^2 + \dots + X_{10}^2 = \sum_{i=1}^{10} (2Z_i)^2 = 4\sum_{i=1}^{10} Z_i^2$。
令分母中的和式为 $V = X_{11}^2 + \dots + X_{15}^2 = \sum_{i=11}^{15} (2Z_i)^2 = 4\sum_{i=11}^{15} Z_i^2$。
则统计量 $Y$ 可以写作：
$$
Y = \frac{U}{2V} = \frac{4\sum_{i=1}^{10} Z_i^2}{2 \left( 4\sum_{i=11}^{15} Z_i^2 \right)} = \frac{1}{2} \frac{\sum_{i=1}^{10} Z_i^2}{\sum_{i=11}^{15} Z_i^2}
$$
令 $U' = \sum_{i=1}^{10} Z_i^2$。由于 $Z_1, \dots, Z_{10}$ 是 $10$ 个独立的标准正态随机变量，根据卡方分布的定义，$U'$ 服从自由度为 $10$ 的卡方分布，即 $U' \sim \chi^2(10)$。
令 $V' = \sum_{i=11}^{15} Z_i^2$。由于 $Z_{11}, \dots, Z_{15}$ 是 $5$ 个独立的标准正态随机变量，同理，$V'$ 服从自由度为 $5$ 的卡方分布，即 $V' \sim \chi^2(5)$。
由于 $X_i$ 相互独立，故 $U'$ 和 $V'$ 相互独立。

根据 $F$ 分布的定义，若 $U' \sim \chi^2(d_1)$，$V' \sim \chi^2(d_2)$，且 $U', V'$ 相互独立，则随机变量 $F = \frac{U'/d_1}{V'/d_2}$ 服从自由度为 $(d_1, d_2)$ 的 $F$ 分布，记为 $F \sim F(d_1, d_2)$。
在本题中，$d_1 = 10$，$d_2 = 5$。我们可以对 $Y$ 进行变形：
$$
Y = \frac{1}{2} \frac{U'}{V'} = \frac{1}{2} \frac{10 \cdot (U'/10)}{5 \cdot (V'/5)} = \frac{1}{2} \cdot \frac{10}{5} \cdot \frac{U'/10}{V'/5} = \frac{U'/10}{V'/5}
$$
该表达式完全符合 $F$ 分布的定义。
因此，随机变量 $Y$ 服从自由度为 $(10, 5)$ 的 $F$ 分布，即 $Y \sim F(10, 5)$。

**证毕。**

---
> #### **题目 ($P162$ 习题$4.1.6$):**
>
> 证明式  
> $$
> \hat{p}(a_j) = \frac{1}{n}\sum_{i=1}^{n}I_j(X_i), j=1,2,\dots,m
> $$
> ，其中 $I_j(X_i) = \begin{cases} 1, & X_i = a_j \\ 0, & X_i \neq a_j \end{cases}$ 中 pmf 的估计是无偏估计，并求此估计量的方差。

**解：**
设离散型总体 $X$ 的概率质量函数 (pmf) 为 $P(X=a_j) = p(a_j)$，其中 $j=1, 2, \dots, m$。
$X_1, \dots, X_n$ 是来自该总体的一个样本。

**$1.$ 证明无偏性**
我们需要证明估计量 $\hat{p}(a_j)$ 是 $p(a_j)$ 的无偏估计，即证明 $E[\hat{p}(a_j)] = p(a_j)$。
$$
E[\hat{p}(a_j)] = E\left[\frac{1}{n}\sum_{i=1}^{n}I_j(X_i)\right] = \frac{1}{n}\sum_{i=1}^{n}E[I_j(X_i)]
$$
随机变量 $I_j(X_i)$ 是一个示性函数，其取值为 $1$ 或 $0$。它服从伯努利分布。
其期望为：
$$
E[I_j(X_i)] = 1 \cdot P(I_j(X_i)=1) + 0 \cdot P(I_j(X_i)=0) = P(X_i=a_j)
$$
由于 $X_i$ 是来自总体的样本，所以 $P(X_i=a_j) = P(X=a_j) = p(a_j)$。
因此，$E[I_j(X_i)] = p(a_j)$。
代入原式：
$$
E[\hat{p}(a_j)] = \frac{1}{n}\sum_{i=1}^{n}p(a_j) = \frac{1}{n} \cdot n \cdot p(a_j) = p(a_j)
$$
故 $\hat{p}(a_j)$ 是 $p(a_j)$ 的无偏估计。

**$2.$ 计算方差**
我们需要计算 $D[\hat{p}(a_j)]$。
$$
D[\hat{p}(a_j)] = D\left[\frac{1}{n}\sum_{i=1}^{n}I_j(X_i)\right]
$$
由于样本 $X_1, \dots, X_n$ 相互独立，示性函数 $I_j(X_1), \dots, I_j(X_n)$ 也相互独立。
$$
D[\hat{p}(a_j)] = \frac{1}{n^2}\sum_{i=1}^{n}D[I_j(X_i)]
$$
$I_j(X_i)$ 服从参数为 $p(a_j)$ 的伯努利分布，其方差为 $p(1-p)$，即：
$$
D[I_j(X_i)] = p(a_j)(1 - p(a_j))
$$
代入原式：
$$
D[\hat{p}(a_j)] = \frac{1}{n^2}\sum_{i=1}^{n}p(a_j)(1 - p(a_j)) = \frac{1}{n^2} \cdot n \cdot p(a_j)(1 - p(a_j)) = \frac{p(a_j)(1 - p(a_j))}{n}
$$
所以，估计量 $\hat{p}(a_j)$ 的方差为 $\frac{p(a_j)(1 - p(a_j))}{n}$。

**证毕。**

> #### **题目3:**
>
> $3.$ 设总体 $X \sim U[0, \theta]$，$\theta$ 未知；$X_1, \dots, X_n$ 是 $X$ 的一个样本，求证：
> $(1)$ $\bar{X}$ 是 $EX$ 的无偏估计；
> $(2)$ $D(\bar{X})$ 不是 $DX$ 的无偏估计；
> $(3)$ $S^2 = \frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2$ 是 $DX$ 的无偏估计；
> $(4)$ $B_2 = \frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2$ 不是 $DX$ 的无偏估计。

**解：**

首先，计算总体 $X \sim U[0, \theta]$ 的期望和方差。
总体的概率密度函数为 $f(x) = \frac{1}{\theta}, 0 \le x \le \theta$。
总体期望为：
$$
EX = \int_{0}^{\theta} x \frac{1}{\theta} dx = \frac{1}{\theta} \left[ \frac{1}{2}x^2 \right]_{0}^{\theta} = \frac{\theta}{2}
$$
总体二阶原点矩为：
$$
E(X^2) = \int_{0}^{\theta} x^2 \frac{1}{\theta} dx = \frac{1}{\theta} \left[ \frac{1}{3}x^3 \right]_{0}^{\theta} = \frac{\theta^2}{3}
$$
总体方差为：
$$
DX = E(X^2) - (EX)^2 = \frac{\theta^2}{3} - \left(\frac{\theta}{2}\right)^2 = \frac{\theta^2}{12}
$$

接下来对各小题进行证明。

$(1)$ 证明 $\bar{X}$ 是 $EX$ 的无偏估计。
我们需要证明 $E(\bar{X}) = EX$。
$$
E(\bar{X}) = E\left(\frac{1}{n}\sum_{i=1}^{n}X_i\right) = \frac{1}{n}\sum_{i=1}^{n}E(X_i)
$$
因为 $X_1, \dots, X_n$ 是来自总体 $X$ 的样本，所以 $E(X_i) = EX = \frac{\theta}{2}$。
$$
E(\bar{X}) = \frac{1}{n} \sum_{i=1}^{n} \frac{\theta}{2} = \frac{1}{n} \cdot n \cdot \frac{\theta}{2} = \frac{\theta}{2} = EX
$$
因此，$\bar{X}$ 是 $EX$ 的无偏估计。

$(2)$ 证明 $D(\bar{X})$ 不是 $DX$ 的无偏估计。

> [!TIP]
>
> 直接从题意层面理解，首先这个定义是非常模糊的，众所周知，我们如果需要求$E(D(\bar{X}))$，我们就是要先确定好$\{x1,\cdots,x_n\}$来求此时的$D(\bar{X})$，当时当我们确定好此时的一个$\{x1,\cdots,x_n\}$时，我们的$\bar{X}$又何来方差一说，$D(\bar{X})$不就等于0了吗？

此处的表述应理解为证明 $D(\bar{X})$ 的值不等于 $DX$。
$$
D(\bar{X}) = D\left(\frac{1}{n}\sum_{i=1}^{n}X_i\right)
$$
由于样本 $X_1, \dots, X_n$ 相互独立，有：
$$
D(\bar{X}) = \frac{1}{n^2}\sum_{i=1}^{n}D(X_i) = \frac{1}{n^2} \cdot n \cdot DX = \frac{DX}{n}
$$
当样本量 $n > 1$ 时，$D(\bar{X}) = \frac{DX}{n} \neq DX$。因此原命题成立。

$(3)$ 证明 $S^2$ 是 $DX$ 的无偏估计。
我们需要证明 $E(S^2) = DX$。
$$
E(S^2) = E\left[\frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = \frac{1}{n-1}E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right]
$$
对求和项进行展开：
$$
\sum_{i=1}^{n}(X_i - \bar{X})^2 = \sum_{i=1}^{n}X_i^2 - 2\bar{X}\sum_{i=1}^{n}X_i + n\bar{X}^2 = \sum_{i=1}^{n}X_i^2 - n\bar{X}^2
$$
其期望为：
$$
E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = E\left[\sum_{i=1}^{n}X_i^2 - n\bar{X}^2\right] = \sum_{i=1}^{n}E(X_i^2) - nE(\bar{X}^2)
$$
我们有 $E(X_i^2) = DX_i + (EX_i)^2 = DX + (EX)^2$ 和 $E(\bar{X}^2) = D(\bar{X}) + (E(\bar{X}))^2 = \frac{DX}{n} + (EX)^2$。
代入上式：
$$
E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = n(DX + (EX)^2) - n\left(\frac{DX}{n} + (EX)^2\right) = nDX - DX = (n-1)DX
$$
因此，
$$
E(S^2) = \frac{1}{n-1} (n-1)DX = DX
$$
所以，$S^2$ 是 $DX$ 的无偏估计。

$(4)$ 证明 $B_2$ 不是 $DX$ 的无偏估计。
我们需要证明 $E(B_2) \neq DX$。
$$
E(B_2) = E\left[\frac{1}{n}\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = \frac{1}{n}E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right]
$$
根据 $(3)$ 的推导结果，我们知道 $E\left[\sum_{i=1}^{n}(X_i - \bar{X})^2\right] = (n-1)DX$。
$$
E(B_2) = \frac{1}{n}(n-1)DX = \frac{n-1}{n}DX
$$
当样本量 $n > 1$ 时，$\frac{n-1}{n} \neq 1$，故 $E(B_2) \neq DX$。
所以，$B_2$ 不是 $DX$ 的无偏估计。

**证毕。**

---
> #### **题目四:**
>
> $4.$ 设 $(X_1, X_2)$ 和 $(Y_1, Y_2, Y_3)$ 都是来自于正态总体 $N(0,1)$ 的样本，$(X_1, X_2)$ 和 $(Y_1, Y_2, Y_3)$ 相互独立，求统计量 $\chi^2 = X_1^2 + X_2^2 + Y_1^2 + Y_2^2 + Y_3^2$ 的数学期望和方差。

**解：**
根据题意，$X_1, X_2, Y_1, Y_2, Y_3$ 这 $5$ 个随机变量相互独立，且均服从标准正态分布 $N(0,1)$。
统计量 $\chi^2$ 是这 $5$ 个独立的标准正态分布随机变量的平方和。
根据卡方分布的定义， $k$ 个独立的标准正态随机变量的平方和服从自由度为 $k$ 的卡方分布，记为 $\chi^2(k)$。
因此，统计量 $\chi^2$ 服从自由度为 $5$ 的卡方分布，即：
$$
\chi^2 \sim \chi^2(5)
$$
对于服从 $\chi^2(k)$ 分布的随机变量，其数学期望为 $k$，方差为 $2k$。
在本题中，$k=5$。
所以，统计量 $\chi^2$ 的数学期望为：
$$
E(\chi^2) = 5
$$
其方差为：
$$
D(\chi^2) = 2 \times 5 = 10
$$

**证毕。**
