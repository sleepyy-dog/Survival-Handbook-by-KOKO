%% 教学安排
%%%%%
% P104 稀疏矩阵 ----
% P99 雅可比迭代 ---- 
% P100 高斯-赛德尔迭代 ----
% 投入产出分析
% 一年生植物的繁殖
%%%%%


%% 稀疏矩阵
clear all
clc
n=1000;b=[1:n]';
a1=sparse(1:n,1:n,4,n,n);
a2=sparse(2:n,1:n-1,1,n,n);
a=a1+a2+a2';
tic;x=a\b;t1=toc
aa=full(a); % 将稀疏矩阵转为常规储存方法
tic;xx=aa\b;t2=toc
y=norm(x-xx)



%% 雅可比迭代
function [x, iter] = jacobi_iteration(A, b, x0, tol, max_iter)

   % A: 系数矩阵
    % b: 常数向量
    % x0: 初始解
    % tol: 收敛容差
    % max_iter: 最大迭代次数
    
    % 初始化
    n = length(b);            % 变量个数
    x = x0;                   % 初始解
    D = diag(A);              % 提取对角线元素
    R = A - diag(D);          % 非对角线部分
    
    iter = 0;
    while iter < max_iter
        iter = iter + 1;
        
        % 向量化更新公式
        x_new = (b - R * x) ./ D;
        
        % 检查收敛
        if norm(x_new - x, inf) < tol || norm(x_new - x, inf)/norm(x, inf) < tol
            break;
        end
        
        % 更新解
        x = x_new;
    end
    
    if iter == max_iter
        disp('达到最大迭代次数，未收敛');
    else
        disp(['迭代次数: ', num2str(iter)]);
    end
end

%% 高斯-赛德尔迭代
function [x, iter] = gauss_seidel_iteration(A, b, x0, tol, max_iter)

    % 初始化
    n = length(b);        % 变量个数
    x = x0;               % 初始解
    iter = 0;             % 迭代次数

    % 分解 A 为下三角部分 L（包含对角线）和上三角部分 U
    L = tril(A);          % 下三角部分，含对角线
    U = A - L;            % 上三角部分

    while iter < max_iter
        iter = iter + 1;
        x_old = x;        % 保存上一轮的解

        % 更新 x：利用矩阵操作
        x = L \ (b - U * x_old);

        % 检查是否收敛
        if norm(x - x_old, inf) < tol || norm(x_old - x, inf)/norm(x, inf) < tol
            break;
        end
    end

    % 检查收敛情况
    if iter == max_iter
        disp('达到最大迭代次数，未收敛');
    else
        disp(['迭代次数: ', num2str(iter)]);
    end
end

%% P100 51式求解
clear all
% 定义系数矩阵 A 和常数项向量 b
A = [9 -1 -1; -1 10 -1; -1 -1 15];
b = [7; 8; 13];

% 初始解
x0 = zeros(3,1);  % 假设初始解为零向量

% 收敛容差和最大迭代次数
tol = 1e-6;
max_iter = 1;

% 调用雅可比迭代法求解
[x1, iter] = jacobi_iteration(A, b, x0, tol, max_iter);
[x2, iter] = gauss_seidel_iteration(A, b, x0, tol, max_iter);
% 输出结果
disp('雅可比解向量:');
disp(x1);
disp('高斯-赛德尔解向量:');
disp(x2);


%% 投入产出分析
clear all
% 定义直接消耗系数矩阵 A
A = [0.159 0.047 0.080 0.008 0.054 0.002;
     0.171 0.512 0.502 0.257 0.238 0.226;
     0.002 0.001 0.001 0.013 0.010 0.023;
     0.021 0.031 0.045 0.104 0.029 0.027;
     0.027 0.045 0.049 0.027 0.056 0.050;
     0.050 0.076 0.095 0.143 0.094 0.100];

% 定义外部需求向量 d
d = [1500; 4200; 3000; 500; 950; 3000];

% 构建单位矩阵 I
I = eye(6);  % 6x6单位矩阵

% 计算矩阵 B = I - A
B = I - A;

% 解方程组 x = B \ d
x = B\d;

% 输出解 x
disp('解向量 x 为:');
disp(round(x));

dd = [1; 0; 0; 0; 0; 0];
B_inv = inv(B);
dx_1 = B_inv(:,1)
dx_2 = B\dd


%% 一年生植物模型
clear all
clc
% 定义初始参数
p = -1;
q = - 0.05;
x0 = 100;
xn = 1000;
n = 49;

% 创建稀疏矩阵A的三个对角线元素
A1 = sparse(1:n, 1:n, p, n, n);      % 主对角线
A2 = sparse(1:n-1, 2:n, 1, n, n);    % 上次对角线
A3 = sparse(2:n, 1:n-1, q, n, n);    % 下次对角线
A = A1 + A2 + A3;

% 创建稀疏矩阵b
i = [1, n]; 
j = [1, 1];
s = [-q * x0, -xn];
b = sparse(i, j, s, n, 1);

% 用稀疏矩阵求解Ax = b
x = A \ b;

% 输出第2年的植株数量 x1
x1 = x(1);
disp(['第2年的植株数量 x1 = ', num2str(x1)]);

% 画出x(k)的图
k = 0:n+1;
xx = [x0, x', xn];
plot(k, xx);
grid on;
title('植株数量随时间的变化');
xlabel('时间 (年)');
ylabel('植株数量');
set(gca,'Fontsize',18)

%% 一年生植物模型---追赶法 (P96)
clear all
clc
% 定义初始参数
p = -1;
q = - 0.05;
x0 = 100;
xn = 1000;
n = 49;


% 初始化向量 f, u, l, y
f = zeros(n,1); 
f(1) = -q * x0;
f(n) = -xn;

% 初值
u(1) = p;
y(1) = f(1);

% 正向递推计算 l(i), u(i), y(i)
for i = 2:n
    l(i) = q / u(i-1);            % 计算下三角元素 l(i)
    u(i) = p - l(i);              % 更新对角线元素 u(i)
    y(i) = f(i) - l(i) * y(i-1);  % 计算中间结果 y(i)
end

% 初始化解向量 x
x = zeros(1,n);
x(n) = y(n) / u(n);  % 先计算最后一个未知量

% 反向递推计算 x(i)
for i = n-1:-1:1
    x(i) = (y(i) - x(i+1)) / u(i);  % 反向计算其他的 x(i)
end

% 输出第2年的植株数量 x1
x1 = x(1);
disp(['第2年的植株数量 x1 = ', num2str(x1)]);

% 画出x(k)的图
k = 0:n+1;
xx = [x0, x, xn];
figure
plot(k, xx);
grid on;
title('植株数量随时间的变化');
xlabel('时间 (年)');
ylabel('植株数量');
set(gca,'Fontsize',18)

