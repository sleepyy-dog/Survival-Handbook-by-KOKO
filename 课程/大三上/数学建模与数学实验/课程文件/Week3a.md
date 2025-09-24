# Week3a

## 数值积分

![image-20250922142707455](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221427750.png)

从定义出发是直接使用阶梯函数来做积分逼近，我们也可以选取更加简单的简单函数来做逼近（只要一致收敛即可）。

![image-20250922143606423](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221436669.png)

或者采用更高次的想法：

![image-20250922144023884](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221440181.png)

回忆一下我们求解的过程。

> [!NOTE]
>
> 考点：考试是有可能让我写插值多项式的简单导出。

以上直接假设步长恒定。

我们可以对以上两种逼近方法来做一个误差估计：

![image-20250922144825983](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221448200.png)

![image-20250922144836120](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221448404.png)

对于误差估计，我们以上都需要假设我们的函数是多阶连续可微的，对于以上的梯形求积公式，无论我们的函数是什么样子，可以看出我们的积分对真实函数的积分的逼近是必定的。

但是对于辛普森求积，积分也是是一定收敛的，条件只是黎曼收敛。这是一个定理。

![image-20250922150302161](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221503402.png)

![image-20250922150459463](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221504672.png)

看似我们可以通过更高次实现逼近，但是我们从龙格现象可以看出的是，我们会由于导数阶数增加而导致一个更大的常数，从而难以逼近。（需要说的是只要确定阶数，逼近是成立的。）

![image-20250922153041531](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221530673.png)

![image-20250922153122370](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221531506.png)

这个意思是其实我们计算的实质是加权。

![image-20250922153852388](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509221538527.png)

从以上语段来看，其实我们没有很好地揭示Gauss-Lobatto求积公式的优点，在我们就行分裂求解时才可以有效凸显这种方法的用处，而这主要发生在我们使用自适应分裂时发生。