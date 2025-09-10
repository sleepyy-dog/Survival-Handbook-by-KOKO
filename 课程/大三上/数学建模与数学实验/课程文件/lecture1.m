
%% 了解Matlab窗口
% 命令窗口：输入和执行 MATLAB 命令的地方。
% 工作区：显示当前工作空间中的变量。
% 当前文件夹：显示当前工作目录的文件。
% 编辑器：编写和编辑 MATLAB 脚本和函数的地方。
% help 功能
% clear all
% clc
% close all

%% 基本命令和操作：变量
x = 10; % 创建标量
v = [1, 2, 3, 4, 5]; % 创建行向量
v_col = [1; 2; 3; 4; 5]; % 创建列向量
v_col(1) % 调取向量里的元素
M = [1, 2, 3; 4, 5, 6; 7, 8, 9]; % 创建 3x3 矩阵
M(1,2)   % 调取矩阵里的元素 
M(7)     % 调取矩阵里的元素 
M(1,2)=10; % 修改矩阵的元素


%% 基本命令和操作：基本数学运算
a = 5;
b = 3;
sum = a + b;   % 加法
diff = a - b;  % 减法
prod = a * b;  % 乘法
quot = a / b;  % 除法
power = a^2;    % 指数
sqrt_val = sqrt(a); % 开方

%% 基本命令和操作：矩阵的函数生成
m=2;n=4;
Z = zeros(m, n); % 创建一个 m x n 的全零矩阵
A = ones(m, n); % 创建一个 m x n 的全一矩阵
I = eye(n); % 创建一个 n x n 的单位矩阵
D = rand(m,n); % 创建一个以 m x n 的随机矩阵

%% 基本命令和操作：矩阵的裁剪
M = [1, 2, 3; 4, 5, 6; 7, 8, 9];
element = M(2, 3); % 提取第二行第三列的元素，结果为 6
row = M(2, :); % 提取第二行，结果为 [4, 5, 6]
col = M(:, 3); % 提取第三列，结果为 [3; 6; 9]
submatrix = M(1:2, 2:3); % 提取第1到第2行，第2到第3列的子矩阵，结果为 [2, 3; 5, 6]
start_row = 2; end_row = 3;
start_col = 1; end_col = 2;
submatrix = M(start_row:end_row, start_col:end_col); % 结果为 [4, 5; 7, 8]

%% 基本命令和操作：矩阵的拼接
A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
C = [A, B]; % 将 A 和 B 左右拼接，结果为 [1, 2, 5, 6; 3, 4, 7, 8]
% 左右拼接时行数要相同

A = [1, 2; 3, 4];
B = [5, 6];
C = [A; B]; % 将 A 和 B 上下拼接，结果为 [1, 2; 3, 4; 5, 6]
% 上下拼接时列数要相同

%% 基本命令和操作：矩阵的基本运算
A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
C = A + B; % 结果为 [6, 8; 10, 12]
% 矩阵的加减法运算

A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
C = A * B; % 结果为 [19, 22; 43, 50]
% 矩阵的乘法运算

D = A .* B; % 结果为 [5, 12; 21, 32]
% 矩阵的点乘运算

X = A \ B; % 计算 X，使得 A * X = B
% 矩阵的左除

X = A / B; % 计算 X，使得 X * B = A
% 矩阵的右除

E = A ./ B; % 结果为 [0.2, 0.3333; 0.4286, 0.5]
% 矩阵的点除

A = [1, 2; 3, 4];
A_transpose = A'; % 结果为 [1, 3; 2, 4]
% 矩阵的转置

A = [1, 2; 3, 4];
A_inv = inv(A); % 计算 A 的逆矩阵，结果为 [-2, 1; 1.5, -0.5]
% 矩阵的逆

A = [1, 2; 3, 4];
det_A = det(A); % 结果为 -2
% 矩阵的行列式

%% 基本命令和操作：行向量的特殊输入
v = 1:5; % 使用冒号运算符 创建一个行向量 [1, 2, 3, 4, 5]
v = 1:0.5:3; % 制定步长  创建一个行向量 [1, 1.5, 2, 2.5, 3]
v1 = linspace(0, 10, 5); % 使用linspace函数，创建一个行向量 [0, 2.5, 5, 7.5, 10]
% linspace(a, b, N) 生成从a到b的N个均匀分布点
v = logspace(1, 3, 3); % 使用logspace函数，创建一个行向量结果为 [10, 100, 1000] 
% logspace(a, b, N) 生成从10^a到10^b的N个对数均匀分布点







%% 绘折线图
x = linspace(0,2*pi,30);
y = sin(x);
plot(x, y,'b-');
xlabel('x'); % x 轴标签
ylabel('sin(x)'); % y 轴标签
title('Plot of sin(x)'); % 图标题

%% 绘制多条线
hold on 
z=0*x;
plot(x,z)
hold off
text(2.5,0.7, 'sin x')
grid on

%% 多幅图形
x = linspace(0,2*pi,30);
y(1,:) = sin(x);
y(2,:) = cos(x);
y(3,:) = 2*sin(x).*cos(x);
y(4,:) = x.^2;
figure
for i = 1:4
    subplot(2,2,i)
    plot(x,y(i,:))
end

%% 极坐标图形
t = 0:0.01:0.5;
polar(t,0.5*abs(sin(4*t)))
hold on
plot(t,0.5*abs(sin(4*t)))

%% 三维坐标
x = -7.5:0.5:7.5;
y = x;
[X,Y] = meshgrid(x,y);
R = sqrt(X.^2+Y.^2);
Z = sin(R)./(R+eps);
figure
mesh(X,Y,Z)
% view(90,45)

%%
figure
t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t)

%%
figure
contour(X,Y,Z,10)

%%
function y = myfunc(x)
% myfunc 计算输入的平方
y = x.^2;
end




