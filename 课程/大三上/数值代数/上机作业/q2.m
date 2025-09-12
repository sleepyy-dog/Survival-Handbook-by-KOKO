%% 生成复杂矩阵
v = ones(100, 1)/3;
A_1=diag(v);
v1=ones(99,1)*(1/10);
A_2=diag(v1,1);
A_3=diag(v1,-1);
A=A_1+A_2+A_3;
N=ones(100);
for i=1:1000
    M=eye(100);
    for j=1:i
        M=multiple(M,A);
    end
    N=N+M;
end
N
%% 绘图
x=[-5:0.01:5]


