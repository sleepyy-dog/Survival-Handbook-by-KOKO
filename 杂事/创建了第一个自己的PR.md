# 创建了第一个自己的PR

2025/8/21创建了第一个自己的[PR](https://github.com/opendatalab/MinerU/pull/3354)。

基于[参考指南](https://zhuanlan.zhihu.com/p/584834288)

总的流程概括而言就是

1. fork

2. 将原创仓库克隆到本地（派生文件）（注意网络问题）

   ```
   # 基于 Git Bash
   # 定位想要克隆的位置（注意/）
   $ cd D:/PythonProject
   
   # 开始克隆
   $ git clone https://github.com/sleepyy-dog/MinerU.git
   ```

3. 创建branch

   ```
   # 定位到派生文件
   $ cd MinerU
   
   # 转到分支
   $ git checkout -b add-choice-for-imageOCR
   ```

4. 基于branch做修改

5. 传到网页端

   ```
   # 一步保存先
   $ git add .
   
   # 保存修改
   $ git commit -am 'add a choice for imageOCR'
   
   # 将本地文件传到远程仓库
   $ git push --set-upstream origin add-choice-for-imageOCR
   ```

6. PR





