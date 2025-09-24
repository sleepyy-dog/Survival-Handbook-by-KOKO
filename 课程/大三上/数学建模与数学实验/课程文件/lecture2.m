%% 教学安排
%%%%%
% 编写Lagrange插值 ---- 必需掌握内容
% 验证Runge现象 ---- 必需掌握内容
% 编写分段线性插值并与Matlab自带interp1进行结果比较 --- 补充内容
% 机床加工实例 --- 必需掌握内容
%%%%%




%% Lagrange插值
function y = lagr(x0, y0, x)
    n = length(x0);  % 节点数
    m = length(x);   % 插值点数
    y = zeros(1, m); % 初始化输出数组
    
    for i = 1:m
        z = x(i); % 当前插值点
        s = 0;    % 初始化插值和
        
        for k = 1:n
            p = 1; % 初始化插值基函数
            
            for j = 1:n
                if j ~= k
                    p = p * (z - x0(j)) / (x0(k) - x0(j));
                end
            end
            
            s = s + p * y0(k); % 更新插值和
        end
        
        y(i) = s; % 赋值插值结果
    end
end



%% Runge 现象
% 生成节点 (x0, y0)
x0 = -5:5;
y0 = 1 ./ (1 + x0.^2);

% 生成插值点 x，间隔 0.1
x = -5:0.1:5;

% 计算 g(x) 用于比较
y = 1 ./ (1 + x.^2);

% 计算拉格朗日插值
y1 = lagr(x0, y0, x);

% 计算分段线性插值
y2 = interp1(x0, y0, x);

% 计算三次样条插值
y3 = spline(x0, y0, x);

% 输出 x>=0 且间隔 0.5 的插值
for k = 1:11
    xx(k) = x(46 + 5 * k); % x=0 对应 第51个位置
    yy(k) = y(46 + 5 * k);
    yy1(k) = y1(46 + 5 * k);
    yy2(k) = y2(46 + 5 * k);
    yy3(k) = y3(46 + 5 * k);
end

% 显示插值结果
disp([xx; yy; yy1; yy2; yy3]')

% 生成横轴 (作图)
z = 0 * x;

% 绘制拉格朗日插值值图
figure;
subplot(3,1,1)
plot(x, z, x, y, 'k--', x, y1, 'r','LineWidth',2);
title('拉格朗日插值');
set(gca,'Fontsize',15)

% 绘制分段线性插值图
subplot(3,1,2)
plot(x, z, x, y, 'k--', x, y2, 'r','LineWidth',2);
title('分段线性插值');
set(gca,'Fontsize',15)

% 绘制三次样条插值图
subplot(3,1,3)
plot(x, z, x, y, 'k--', x, y3, 'r','LineWidth',2);
title('三次样条插值');
set(gca,'Fontsize',15)


%% 自编分段线性插值函数
function y_interp = piecewise_linear_interp(x, y, x_interp)
    % 分段线性插值函数
    % 输入：
    % x - 已知数据点的 x 坐标 (1D 数组)
    % y - 已知数据点的 y 坐标 (1D 数组)
    % x_interp - 要插值的 x 坐标 (1D 数组)
    % 输出：
    % y_interp - 插值后对应的 y 坐标 (1D 数组)

    % 检查输入是否有序 --- 在Lagrange插值编程中非必需
    if any(diff(x) <= 0) 
        error('输入的 x 坐标必须是严格递增的。');
    end

    % 初始化插值结果
    y_interp = zeros(size(x_interp));
    
    % 对每个 x_interp 进行插值
    for i = 1:length(x_interp)
        % 如果 x_interp 超出已知数据范围，则采用边界值
        if x_interp(i) <= x(1)
            y_interp(i) = y(1);
        elseif x_interp(i) >= x(end)
            y_interp(i) = y(end);
        else
            % 查找 x_interp(i) 所在的区间 [x(k), x(k+1)]
            k = find(x <= x_interp(i), 1, 'last'); % 
            
            % 线性插值计算 % 
            t = (x_interp(i) - x(k)) / (x(k+1) - x(k));
            y_interp(i) = (1 - t) * y(k) + t * y(k+1);
        end
    end
end

%% 比较自编分段线性插值函数与Matlab自带函数
% 已知数据点
x = [1, 2, 3, 4, 5];
y = [2, 4, 1, 3, 7];

% 要插值的点
x_interp = [1.5, 2.5, 3.5, 4.5];

% 使用自定义的分段线性插值函数
y_interp_custom = piecewise_linear_interp(x, y, x_interp);

% 使用 MATLAB 自带的 interp1 插值函数
y_interp_builtin = interp1(x, y, x_interp, 'linear');

% 显示结果
disp('自定义插值函数的结果：');
disp(table(x_interp', y_interp_custom', 'VariableNames', {'x_interp', 'y_interp_custom'}));

disp('MATLAB 内置插值函数的结果：');
disp(table(x_interp', y_interp_builtin', 'VariableNames', {'x_interp', 'y_interp_builtin'}));

% 绘制图形进行比较
figure;
plot(x, y, 'o-', 'LineWidth', 2); % 原数据点
hold on;
plot(x_interp, y_interp_custom, 'x', 'MarkerSize', 10, 'LineWidth', 2); % 自定义插值点
plot(x_interp, y_interp_builtin, 's', 'MarkerSize', 10, 'LineWidth', 2); % 内置插值点
xlabel('x');
ylabel('y');
set(gca,'Fontsize',18)
title('自定义插值函数与 MATLAB 内置插值函数的比较');
legend('已知数据点', '自定义插值点', '内置插值点');
grid on;






%% 机床加工实例

% 按照表3.1输入原始数据
x = [0:0.2:5, 4.8:-0.2:0]; 
y = [5.00, 4.71, 4.31, 3.68, 3.05, 2.50, 2.05, ...
     1.69, 1.40, 1.18, 1.00, 0.86, 0.74, 0.64, ...
     0.57, 0.50, 0.44, 0.40, 0.36, 0.32, 0.29, ...
     0.26, 0.24, 0.20, 0.15, 0.00, -1.40, -1.96, ...
     -2.37, -2.71, -3.00, -3.25, -3.47, -3.67, -3.84, ...
     -4.00, -4.14, -4.27, -4.39, -4.49, -4.58, -4.66, ...
     -4.74, -4.80, -4.85, -4.90, -4.94, -4.96, -4.98, ...
     -4.99, -5.00];

% 逆时针方向转90°, 节点(x, y)变为(u, v)
v0 = x; 
u0 = -y; 

% 按 0.05 的间隔在 u 方向产生插值点
u = -5:0.05:5;

% 在 v 方向计算分段线性插值
v1 = interp1(u0, v0, u);

% 在 v 方向计算三次样条插值
v2 = spline(u0, v0, u);

% % 在 v 方向计算lagrange插值
% v3 = lagr(u0, v0, u);

% 在 (x, y) 坐标系输出结果
disp([v1', v2', u']);

% 作图
figure
plot(x, y,'k--','LineWidth',2)
hold on
plot(v1, -u,'LineWidth',1.5)
hold on
plot(v2, -u,'LineWidth',1.5)
legend('原轮廓线','分段线性插值的结果','三次样条插值的结果')
set(gca,'Fontsize',15)


% subplot(1,3,1), plot(x, y), axis([0 5 -5 5]); 
% title('原轮廓线');
% 
% 
% subplot(1,3,2), plot(v1, -u), axis([0 5 -5 5]); 
% title('分段线性插值的结果');
% 
% subplot(1,3,3), plot(v2, -u), axis([0 5 -5 5]); 
% title('三次样条插值的结果');


