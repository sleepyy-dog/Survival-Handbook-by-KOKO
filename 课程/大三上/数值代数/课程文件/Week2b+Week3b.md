

# Week2b+Week3b

## 向量范数

![image-20250919142433471](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191424565.png)

有此导出结论：

![image-20250919142737113](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191427163.png)

即知范数作为函数是连续的。

一般我们可以定义$p$范数（$Holder$范数）

![image-20250919143036565](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191430633.png)

特别的有

![image-20250919143103948](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191431045.png)

注意一个范数的定义需要良好等价于符合我们以上的正定性，齐次性，三角不等式。

从某种程度上范数可说是等价的。

但是实际计算当中，我们的二范数是使用最多的，因为**不用求绝对值，同时具有非常好的直观性，在后续一些凸性的运算上作用也很明显**。

![image-20250919143436093](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191434149.png)

我们还有定理：

定理 2.1.2 设 $x_k \in \mathbb{R}^n$，则 $\lim_{k \to \infty} \|x_k - x\| = 0$ 的充分必要条件是

$$
\lim_{k \to \infty} |x_i^{(k)} - x_i| = 0, \quad i=1, \dots, n
$$

即向量序列的范数收敛等价于其分量收敛。

这可以由2.1.1，将此范数和我们的$||\cdot||_{\infty}$对比即知。

## 矩阵范数

![image-20250919144212080](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191442144.png)

![image-20250919144225329](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191442388.png)

可以看到，我们对比向量范数只增加了一个相容性。

一个非常有趣的想法是将$n \times n$矩阵直接当作一个一个$n^2$维的向量，这样就将可以将我们的向量范数和矩阵范数完全等价。

以此就可以将结论推广到矩阵范数：

![image-20250919145025815](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191450888.png)

这里我们尝试得到矩阵函数和向量范数的直接关系：定义相容性如下：

![image-20250919145231711](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191452808.png)

形式类似相容性。

以下我们给出具体矩阵范数的例子：

![image-20250919145414623](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191454727.png)

![image-20250919145426657](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191454806.png)

首先这个关于

![image-20250919145644467](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191456525.png)

这个结论其实也是基于范数的连续性。

证明实际首先证明了二者的相容性。接着证明了四条性质。

![image-20250919154507284](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191545483.png)

自此我们就可以把我们的通用的$p$范数扩张到矩阵范数

![image-20250919155428522](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509191554724.png)

前两条是显然的。

二范数需要一点高代知识。

![image-20250926142458969](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261425040.png)

谱范数的性质：

![image-20250926142556955](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261425988.png)

（2）和（3）的左边等号是显然的，进而可以得到（3）的右边等号。

（1）的证明较有难度。思路是证明$\leq \geq$得到。需要借用一个命题（柯西-施瓦茨不等式）：

$$
\|z\|_2 = \max_{\|y\|_2=1} |y^H z|
$$
![image-20250926144914237](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261449307.png)

引入谱半径：

![image-20250926145005698](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261450787.png)

注意这里的$|\cdot|$为模而非绝对值。

![image-20250926145316108](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261453215.png)

![image-20250926150025137](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261500223.png)

以下（2）即纽曼公式。

![image-20250926150634579](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509261506677.png)

