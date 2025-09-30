# Week4a

> 首先建立微分方程，然后引入两个数值算法：欧拉方法和龙格-库塔方法。
>
> 重点在于如何使用$Matlab$实现。

这里的一个方法是通过估计先得到斜率。

![image-20250929152137050](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291521187.png)

![image-20250929152149940](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291521011.png)

![image-20250929152312647](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291523734.png)

![image-20250929152328388](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291523453.png)

## 欧拉方法

![image-20250929152849535](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291528701.png)

直接给一个欧拉方法的误差估计的结论：

![image-20250929153518546](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291535628.png)

![image-20250929153613015](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291536113.png)

## 龙格库塔方法

![image-20250929154930218](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291549301.png)

![image-20250929154941942](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291549033.png)

## Matlab实现

![image-20250929155346241](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291553336.png)

![image-20250929155410277](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509291554359.png)

> [!NOTE]
>
> 核心是掌握以上这个函数的用法