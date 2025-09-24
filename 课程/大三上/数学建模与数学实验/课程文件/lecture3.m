%% 教学安排
%%%%%
% 用梯形，辛普森，Gauss-Lobatto 求积公式 ---- 必需掌握内容
% 探索积分误差与步长的关系 ---- 必需掌握内容
% 卫星轨道实例 --- 必需掌握内容
%%%%%




%% P59 例2, 问题1---3
clear all
clc

% 定义被积函数
function y = s(x)
    y = 1 ./ (1 - sin(x));
end

% 精确值
z=sqrt(2);

% 使用 辛普森公式（quad 函数）计算积分
z1 = quad(@s, 0, pi/4);

% 使用 Gauss-Lobatto公式 (quadl) 函数计算积分
z2 = quadl(@s, 0, pi/4);

% 显示结果
disp(['结果 z1 = ', num2str(z1,'%.10f'),'误差为 ', num2str((z1-z),'%.2e')]);
disp(['结果 z2 = ', num2str(z2,'%.10f'),'误差为 ', num2str((z2-z),'%.2e')]);

% 梯形法积分
x = 0:pi/400:pi/4;  % 分成100等分
y = 1 ./ (1 - sin(x));  % 函数值
z3 = trapz(x, y);  % 使用梯形法

% 显示结果
disp(['梯形法结果 z3 = ', num2str(z3,'%.10f'),'误差为 ', num2str((z3-z),'%.2e')]);


%% P59 例2，问题4
clear all
clc

% 设置不同的 n 值
n_values = [ 20, 40, 80];
I_exact = sqrt(2); % 精确值 sqrt(2)

% 初始化结果矩阵
results = zeros(7,length(n_values)); 

for i = 1:length(n_values)
    n = n_values(i); % 当前 n 值
    h = pi / 4 / n; % 步长
    x = 0:h:pi/4; % 划分区间
    y = 1 ./ (1 - sin(x)); % 函数值

    % 梯形法计算
    Tn = trapz(x, y); % 梯形法的积分值
    
    % 计算倍步长时的梯形法积分
    x_half = 0:(2*h):pi/4; % 倍步长的区间
    y_half = 1 ./ (1 - sin(x_half)); % 倍步长对应的函数值
    Tn_half = trapz(x_half, y_half); % 倍步长的梯形法积分

    % 辛普森法计算
    k = length(y); % 节点个数
    y1 = y(2:2:k-1) % 偶数索引处的 y 值
    s1 = sum(y1); % 偶数点求和

    y2 = y(3:2:k-2); % 奇数索引处的 y 值
    s2 = sum(y2); % 奇数点求和

    Sn = (y(1) + y(k) + 4 * s1 + 2 * s2) * h / 3; % 辛普森法积分
    
    % 倍步长时的辛普森法积分
    k_half = length(y_half); % 倍步长节点个数
    y1_half = y_half(2:2:k_half-1); % 倍步长偶数索引处的 y 值
    s1_half = sum(y1_half); % 倍步长偶数点求和

    y2_half = y_half(3:2:k_half-2); % 倍步长奇数索引处的 y 值
    s2_half = sum(y2_half); % 倍步长奇数点求和

    Sn_half = (y_half(1) + y_half(k_half) + 4 * s1_half + 2 * s2_half) * (2*h) / 3; % 倍步长辛普森法积分
    
    % 计算误差
    Tn_error = Tn - I_exact; % 梯形法误差
    Sn_error = Sn - I_exact; % 辛普森法误差
    Tn_half_error = Tn_half - Tn; % 倍步长梯形法误差
    Sn_half_error = Sn_half - Sn; % 倍步长辛普森法误差

    % 保存结果
    results(:,i) = [n, Tn, Tn_half_error, Tn_error, Sn, Sn_half_error, Sn_error];
end


%% 实例1 --- 卫星轨道
clear all
clc
% 定义 weixing 函数
function y = weixing(t)
    a = 7782.5;
    b = 7721.5;
    y = sqrt(a^2 * sin(t).^2 + b^2 * cos(t).^2); % 计算 y 值
end
% 主程序
t = 0:pi/10:pi/2; % 划分区间
y1 = weixing(t); % 计算 weixing(t) 的值

% 使用梯形法计算积分
I1 = 4 * trapz(t, y1);

% 使用 quad 函数计算积分
I2 = 4 * quad(@ weixing, 0, pi/2, 1e-6);


%% 例3
clear all
clc
% 设定截断区间的上限
N = 4; % N 根据给定的截断条件选择

% 使用 quad 函数计算积分
z = quad(@(x) exp(-x.^2), 0, N, 1e-7);

% 显示结果
disp(['数值积分结果 z = ', num2str(z)]);


%% 例4
clear all
clc
% 使用 quad 函数计算积分
z = quad(@(x) -log(x)./(1+x), 0, 1, 1e-7);

% 显示结果
disp(['数值积分结果 z = ', num2str(z)]);


%% 例5
clear all
clc

% 定义被积函数 f(x, y) = log(x + 2 * y)
f = @(x, y) log(x + 2 * y);

% 计算双重积分，积分范围为 x ∈ [1.4, 2.0]，y ∈ [1.0, 1.5]
z = dblquad(f, 1.4, 2.0, 1.0, 1.5);

% 输出结果
disp(['数值积分结果 z = ', num2str(z)]);