%% 教学安排
%%%%%
% 海上缉私例子 ---- ode solver, odeset
% 弱肉强食例子 
% 刚性问题 --- 比较ode23和ode23s计算耗时
% 编写四级四阶龙格库塔并验证其阶
%%%%%

%%% 用@创建函数时，



%% P76--78 海上缉私问题
function dx = jisi(t, x)
    a = 20;  % 参数 a  
    % a = 35;  % 参数 a
    b = 40;  % 参数 b
    c = 15;  % 参数 c
    
    % 计算变量 s
    s = sqrt((c - x(1))^2 + (a * t - x(2))^2);
    
    % 微分方程
    dx = [b * (c - x(1)) / s; b * (a * t - x(2)) / s];  % 以向量形式返回结果
end

% 设置时间范围和步长
ts = 0:0.05:0.5;  
% ts = 0:0.1:1.6 % --- a=35

% 初始条件
x0 = [0, 0];  % 初始位置 x(0) = 0, y(0) = 0

% 调用 ode45 进行微分方程求解
[t, x] = ode45(@jisi, ts, x0);
% % --- a=35
% % 使用 odeset 为 ode45 设置选项
% opt = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);  % Relative tolerance and absolute tolerance
% % 调用 ode45 进行微分方程求解
% [t, x] = ode45(@jisi, ts, x0, opt);

% 绘制 t 对应的 x(t) 和 y(t)
figure;
plot(t, x(:, 1), 'r', t, x(:, 2), 'b'), grid on;
xlabel('Time t');
legend('x(t)', 'y(t)');
set(gca, 'FontSize', 18);  % 将坐标轴字体大小设置为 15


% 绘制 x(t) 和 y(t) 的关系
figure;
plot(x(:, 1), x(:, 2)), grid on;
xlabel('x(t)');
ylabel('y(t)');
set(gca, 'FontSize', 18);


%% P80 弱肉强食
% 定义微分方程的函数
function xdot = shier(t, x)
    r = 1;
    d = 0.5;
    a = 0.1;
    b = 0.02;
    
    % 微分方程，以向量形式表示
    xdot = diag([r - a * x(2), -d + b * x(1)]) * x;
end

% 主程序
% 设置时间范围和步长
ts = 0:0.1:15;  % 时间从 0 到 15，步长为 0.1

% 初始条件
x0 = [25, 2];  % 初始值，x(0) = 25, y(0) = 2

% 调用 ode45 进行微分方程求解
[t, x] = ode45(@shier, ts, x0);

% 绘制 t 对应的 x(t) 和 y(t)
figure;
plot(t, x), grid on;
gtext('\fontsize{12}x(t)'), gtext('\fontsize{12}y(t)');  % 将标签字体放大

% 暂停并绘制 x(t) 对 y(t) 的关系
pause;
plot(x(:,1), x(:,2)), grid on;
xlabel('x'), ylabel('y');



%% 自己编写四级四阶龙格库塔并验证其阶
% 定义 ODE 方程组
function dydt = harmonic_oscillator(t, y)
    dydt = [y(2); -y(1)];  % y1' = y2, y2' = -y1
end

% 解析解
function [y1_exact, y2_exact] = exact_solution(t)
    y1_exact = cos(t);  % y1(t) = cos(t)
    y2_exact = -sin(t);  % y2(t) = -sin(t)
end

% 四阶四级龙格库塔方法实现
function [t_values, y_values] = runge_kutta_4_system(f, t0, y0, h, t_final)
    t_values = t0:h:t_final;  % 创建时间步
    n = length(t_values);     % 时间步数量
    y_values = zeros(2, n);   % 存储 y1 和 y2 的数值解
    y_values(:, 1) = y0;      % 初始条件
    
    % 迭代使用四阶龙格库塔方法
    for i = 1:n-1
        t = t_values(i);
        y = y_values(:, i);
        
        k1 = f(t, y);
        k2 = f(t + h/2, y + h/2 * k1);
        k3 = f(t + h/2, y + h/2 * k2);
        k4 = f(t + h, y + h * k3);
        
        y_values(:, i+1) = y + h/6 * (k1 + 2*k2 + 2*k3 + k4);  % 更新 y 值
    end
end

% 主程序
t0 = 0;          % 初始时间
y0 = [1; 0];     % 初始条件 y1(0) = cos(0) = 1, y2(0) = -sin(0) = 0
t_final = 10;    % 结束时间
h_values = [0.1, 0.05, 0.025, 0.0125];  % 不同步长

% 初始化误差存储
errors = zeros(size(h_values));

% 循环计算不同步长下的数值解与误差
for i = 1:length(h_values)
    h = h_values(i);  % 当前步长
    [t_values, y_values] = runge_kutta_4_system(@harmonic_oscillator, t0, y0, h, t_final);
    
    % 计算解析解（在相同的时间点上）
    [y1_exact, y2_exact] = exact_solution(t_values);
    
    % 计算最大误差（y1 和 y2 的误差）
    errors(i) = max(max(abs(y_values(1, :) - y1_exact), abs(y_values(2, :) - y2_exact)));
     % errors(i) = max(max(abs(y_values(1, end) - y1_exact(end)), abs(y_values(2, end) - y2_exact(end))));
    % 输出步长和误差
    fprintf('步长: %.5f, 最大误差: %.2e\n', h, errors(i));
end

% 绘制误差随步长的变化图
figure;
loglog(h_values, errors, '-o');
xlabel('步长 h');
ylabel('最大误差');
title('四阶四级龙格库塔方法误差分析 (谐振子)');
grid on;

% 计算斜率，验证四阶方法
p = polyfit(log(h_values), log(errors), 1);  % 在对数尺度下线性拟合
fprintf('斜率 (理论上应接近4): %.2f\n', p(1));



%%
clear all
% P84--85 刚性问题

% 定义刚性方程 stiff1 的函数
function dx = stiff1(t, x)
    dx = [x(1) + 2 * x(2); 
          -(10^6 + 1) * x(1) - (10^6 + 2) * x(2)];
end

% 主程序
t = 0:0.1:1;  % 设置时间范围从 0 到 1，步长为 0.1 (生成的是行向量)

% 解析解
x1 = (10^6/4 + 1) * exp(-t) - exp(-10^6 * t);  % 解析解的 x1 部分
x2 = -(10^6/4 + 1) * exp(-t) + (10^6 + 1)/2 * exp(-10^6 * t);  % 解析解的 x2 部分

% 将解析解存储为矩阵 A
A = [x1; x2]; % 每一行是一个分量的解，每一列是一个时间点下的解

% 初始条件
x0 = [10^6/4, 10^6/4 - 1/2];  % 初始值

% 使用 ode23s 求解刚性方程并计算运行时间
tic;  % 开始计时
[t, x] = ode23s(@stiff1, t, x0); % 反馈的x是每一列是一个分量，每一行是一个时间点，t与x的行长度一致
time_ode23s = toc;  % 结束计时并记录时间

% 将数值解存储为矩阵 B
B = [t, x];

% 使用 ode23 求解非刚性方程并计算运行时间
tic;  % 开始计时
[t, y] = ode23(@stiff1, t, x0);
time_ode23 = toc;  % 结束计时并记录时间

% 将数值解存储为矩阵 C
C = [t, y];

% 打印每种方法的运行时间
fprintf('ode23s 运行时间: %.6f 秒\n', time_ode23s);
fprintf('ode23 运行时间: %.6f 秒\n', time_ode23);

%% 绘制解析解与数值解的比较
figure;
subplot(1,2,1)
plot(t, A(1,:), 'r','LineWidth',2);  % 绘制解析解
hold on;
plot(t, x(:,1), 'g','LineWidth',2);  % 绘制 ode23s 解
hold on
plot(t, y(:,1), 'm', 'LineWidth',2);  % 绘制 ode23 解
legend('解析解 x1', 'ode23s 解 x1', 'ode23 解 x1');
xlabel('时间 t');
ylabel('解值');
title('解析解与数值解的比较-x1');
grid on;
subplot(1,2,2)
plot(t, A(2,:), 'b--','LineWidth',2);  % 绘制解析解
hold on;
plot(t, x(:,2), 'k--','LineWidth',2);  % 绘制 ode23s 解
hold on
plot(t, y(:,2), 'c--','LineWidth',2);  % 绘制 ode23 解
legend('解析解 x2', 'ode23s 解 x2', 'ode23 解 x2');
xlabel('时间 t');
ylabel('解值');
title('解析解与数值解的比较-x2');
grid on;



