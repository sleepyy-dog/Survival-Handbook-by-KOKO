%% 教学安排
%%%%%
% P121--123 牛顿迭代 ----
% P125 fsolve/P124fzero ----
% P126 路灯照明例子 ----
% P128 均相共沸混合物的组分 -----
% P131--136 分岔与混沌 ----
%%%%%


%% 牛顿法
function [x, k] = newton_general(F, J, x0, max_iter, abs_tol, rel_tol)
    % 输入参数:
    % F       - 非线性方程组或函数句柄
    % J       - 雅可比矩阵或导数句柄
    % x0      - 初始猜测（标量或向量）
    % max_iter - 最大迭代次数
    % abs_tol - 绝对误差的容差
    % rel_tol - 相对误差的容差

    % 初始化变量
    x = x0;
    k = 0;
    relative_error = rel_tol + 1; % 初始化相对误差为大于rel_tol的值以进入循环

    % Newton-Raphson 迭代
    while (norm(feval(F, x)) > abs_tol || relative_error > rel_tol) && k < max_iter % 如果第一个操作数为 false，直接返回 false，不计算第二个操作数
        % 计算函数值和雅可比矩阵或导数
        Fx = feval(F, x);
        Jx = feval(J, x);

        % 更新 x 值
        if length(x) == 1
            % 一元情况：直接除以导数
            x_new = x - Fx / Jx;
        else
            % 多元情况：使用雅可比矩阵求解
            delta_x = -Jx \ Fx;
            x_new = x + delta_x;
        end

        % 计算相对误差
        relative_error = norm(x_new - x) / norm(x_new);

        % 更新 x 和迭代计数
        x = x_new;
        k = k + 1;
    end

    % 检查是否达到最大迭代次数
    if k >= max_iter
        error('未在最大迭代次数内收敛');
    else
        % 输出求解结果
        output_solution(x, k);
    end
end

function output_solution(x, k)
    % 输出求解结果
    if length(x) == 1
        fprintf('收敛于 x = %.6f，迭代次数：%d\n', x, k); % \n表示换行
    else
        fprintf('收敛于 x = [');
        for i = 1:length(x)
            fprintf(' %.6f', x(i));
            if i < length(x)
                fprintf(','); % 变量之间用逗号分隔
            end
        end
        fprintf(' ]，迭代次数：%d\n', k);
    end
end
%% P119 例1：求解一元方程
F1 = @(x) x^2 + x - 14;
J1 = @(x) 2*x + 1;
x0_1 = 3;
[x1, k1] = newton_general(F1, J1, x0_1, 100, 1e-4, 1e-6);

%% P122 例2：求解非线性方程组
F2 = @(x) [x(1)^2 + x(2)^2 - 4; x(1)^2 - x(2)^2 - 1];
J2 = @(x) [2*x(1), 2*x(2); 2*x(1), -2*x(2)];
x0_2 = [1; 1];
[x2, k2] = newton_general(F2, J2, x0_2, 100, 1e-4, 1e-6);

%% P125 fsolve求解例2 ---- fsolve和fzero一般输出离初值比较近的一个零点
% 设置 fsolve 选项以显示迭代过程
options = optimoptions('fsolve', 'Display', 'iter');
% 使用 fsolve 求解非线性方程组
[x2_fsolve, fval, exitflag, output] = fsolve(F2, x0_2, options);
% 输出结果
fprintf('fsolve 解为：x1 = %.6f, x2 = %.6f\n', x2_fsolve(1), x2_fsolve(2));

%% P126 路灯照明例子
clear all
clc
% 定义函数 zhaoming(x)
function y = zhaoming(x)
    y = 2 * 5 * x / (5^2 + x^2)^(5/2) - 3 * 6 * (20 - x) / (6^2 + (20 - x)^2)^(5/2);
end

% 初始值
x0 = [0, 10, 20];

% 初始化结果数组
x = zeros(1, length(x0));
c = zeros(1, length(x0));

% 使用 fzero 逐个求解，并计算 C(x)
for k = 1:length(x0)
    x(k) = fzero(@zhaoming, x0(k));
    c(k) = 2 * 5 / (5^2 + x(k)^2)^(3/2) + 3 * 6 / (6^2 + (20 - x(k))^2)^(3/2);
end

% 输出结果，保留小数点后 8 位
fprintf('零点 x 的值为：\n');
for k = 1:length(x)
    fprintf('x(%d) = %.8f\n', k, x(k));
end

fprintf('对应的亮度 C(x) 为：\n');
for k = 1:length(c)
    fprintf('C(%d) = %.8f\n', k, c(k));
end

%% P128 均相共沸混合物的组分
clear all
clc
% 定义 azeofun 函数
function f = azeofun(XT, n, P, a, b, c, Q)
    % 初始化
    x = ones(1, n);
    for i = 1:n-1
        x(i) = XT(i);
    end
    x(n) = 1 - sum(x(1:n-1));
    
    % 提取温度
    T = XT(n);
    
    % 计算 d(i) 和 dd(i)
    d = zeros(n, 1);
    dd = zeros(n, 1);
    p = log(P);
    for i = 1:n
        d(i) = x * (Q(i, 1:n)');  % 计算 d(i)
        dd(i) = x(i) / d(i);  % 计算 dd(i)
    end
    
    % 计算 f(i)
    f = zeros(n, 1);
    for i = 1:n
        f(i) = x(i) * (b(i) / (T + c(i)) + log(x * (Q(i, 1:n)')) + dd' * Q(1:n, i) - a(i) - 1 + p);
    end
end

% 参数设置
n = 3;
P = 760;
a = [16.388, 16.268, 18.607]';
b = [2787.50, 2665.54, 3643.31]';
c = [229.66, 219.73, 239.73]';
Q = [1.0, 0.48, 0.768;
     1.55, 1.0, 0.544;
     0.566, 0.65, 1.0];

% 初始值数组
initial_values = [
    0.333, 0.333, 50;
    0, 0.5, 54;
    0.5, 0, 54;
    0.5, 0.5, 54
];

% 使用 fsolve 对每组初始值求解，并输出结果
for j = 1:size(initial_values, 1)
    XT0 = initial_values(j, :); % 取当前初始值
    [XT, Y] = fsolve(@(XT) azeofun(XT, n, P, a, b, c, Q), XT0, []);
    
    % 输出结果
    fprintf('初始值 XT0 = [%.3f, %.3f, %.1f]\n', XT0(1), XT0(2), XT0(3));
    fprintf('解: x1 = %.4f, x2 = %.4f, x3 = %.4f, T = %.4f\n\n', XT(1), XT(2), 1 - XT(1) - XT(2), XT(3));
end

%% 分岔与混沌 P131
clear all
clc
% 参数设置
r_values = [0.3, 1.8, 2.2, 2.5, 2.7, 2.55];  % 不同的增长率 r
x0 = 0.1;  % 初始种群数量
N = 1;     % 最大容量
n = 40;    % 迭代次数

% 创建图形窗口
figure;

% 对每个 r 值进行模拟
for j = 1:length(r_values)
    R = r_values(j);  % 取当前的 r 值
    x = zeros(1, n+1);  % 初始化 x 数组存储每次迭代的结果
    x(1) = x0;  % 赋初值
    
    % 按照差分方程迭代计算
    for i = 1:n
        x(i+1) = x(i) + R * x(i) * (1 - x(i) / N);  % 差分方程
    end
    
    % 绘制结果
    subplot(3, 2, j);  % 创建 3x2 子图
    plot(0:n, x, 'LineWidth', 1.5);  % 画图，横轴为迭代次数，纵轴为种群数量
    title(sprintf('r = %.2f', R));  % 子图标题
    xlabel('k');  % x 轴标签
    ylabel('x_k');  % y 轴标签
    grid on;  % 网格
end
%
sgtitle('非线性差分方程的种群增长行为');

%% 分岔与混沌 P136
clear all
clc
% chaos 函数，用于分析不同 r 值下的迭代行为
function chaos(iter_fun, x0, r, n)
    kr = 0;
    % 遍历参数 r 的范围
    for rr = r(1):r(3):r(2)
        kr = kr + 1;
        y(kr, 1) = feval(iter_fun, x0, rr);  % 初始化 y 值
        % 执行 n(2) 次迭代
        for i = 2:n(2)
            y(kr, i) = feval(iter_fun, y(kr, i-1), rr);  % 更新迭代值
        end
    end
    figure
        % 绘图：排除前 n(1) 次迭代的值
    plot([r(1):r(3):r(2)], y(:, n(1)+1:n(2)), 'k.', 'MarkerSize', 5); % plot multiple lines, if plot(x,Y), require size(x,1)=size(Y,1)
    xlabel('r'); ylabel('x');   % 记录迭代第n(1)+1:n(2)中每个位置的的r vs. value
    title('Bifurcation Diagram of Logistic Map');
end

% iter01 函数：Logistic 映射迭代函数
function y = iter01(x, r)
    y = r * x * (1 - x);
end

% 调用 chaos 函数以绘制 Logistic 映射的分叉图
% 参数说明:
% r = [2, 4, 0.01] 表示 r 的范围从 2 到 4，步长为 0.01
% 初值 x0 = 0.5
% n = [100, 200] 表示忽略前 100 个迭代值，显示 100--200 间的迭代结果
chaos(@iter01, 0.5, [2, 4, 0.01], [100, 200]);



