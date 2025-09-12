%% 实现矩阵求解Ax=y
% 思路：分解为上下角矩阵
A=[1,2;3,4];
%% 生成100*100矩阵，每行都是1到100
A=ones(100);
for i=1:1:100
    for j=1:1:100
        A(i,j)=j;
    end
end
A

%% 法二
B=ones(100,1)*[1:1:100];
B

%% 生成复杂矩阵
v = ones(100, 1)/3;
A_1=diag(v);
v1=ones(99,1)*(1/10);
A_2=diag(v1,1);
A_3=diag(v1,-1);
A=A_1+A_2+A_3;
N=eye(100);
for i=1:1000
    M=eye(100);
    for j=1:i
        M=multiple(M,A);
    end
    N=N+M;
end
N
%% 更加快速的方法
% 注意到我们可以使用迭代A_n=A_n-1*A+E
% 注意到通过使用迭代我们可以有效降低复杂度
v = ones(100, 1)/3;
A_1=diag(v);
v1=ones(99,1)*(1/10);
A_2=diag(v1,1);
A_3=diag(v1,-1);
A=A_1+A_2+A_3;
E=eye(100);
A_1=E;
for i=1:1000
    A_1=A_1*A+E;
end
A_1
%% 绘图
x=[-5:0.01:5];
y=2+x+x.^2;
plot(x,y)
%% 微积分
% 计算定积分e^(-x^2).0到正无穷，负无穷到0

%% syns
syms x



