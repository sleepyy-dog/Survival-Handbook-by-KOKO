%% 程序作业4：数值分析迭代法求解
clear; clc; close all;

%% P1
clc;
% 参数设置
a = 0.5;
n = 100;
h = 1/n;
x = (1:n-1)' * h;  epsilon_values = [1, 0.1, 0.01, 0.0001];  
tol = 1e-4;  
max_iter = 10000; 

exact_solution = @(x, eps) (1-a)/(1-exp(-1/eps))*(1-exp(-x/eps)) + a*x;

for idx = 1:length(epsilon_values)
    eps = epsilon_values(idx);
    fprintf('当 ε = %.4f 时：\n', eps);
    fprintf('-----------------------------------------------\n');
    
    % 差分方程：(ε+h)y_{i+1} - (2ε+h)y_i + εy_{i-1} = ah^2
    main_diag = -(2*eps + h) * ones(n-1, 1);  % 主对角线
    upper_diag = (eps + h) * ones(n-2, 1);    % 上对角线
    lower_diag = eps * ones(n-2, 1);          % 下对角线
    
    A = diag(main_diag) + diag(upper_diag, 1) + diag(lower_diag, -1);
    
    % 右端项（考虑边界条件）
    b = a * h^2 * ones(n-1, 1);
    b(1) = b(1) - eps * 0;           % y_0 = 0
    b(end) = b(end) - (eps + h) * 1; % y_n = 1
    
    % 精确解
    y_exact = exact_solution(x, eps);
    
    % Jacobi迭代法
    [y_jacobi, iter_jacobi] = jacobi_iteration(A, b, tol, max_iter);
    error_jacobi_2 = norm(y_jacobi - y_exact, 2);
    error_jacobi_inf = norm(y_jacobi - y_exact, inf);
    
    % GS迭代法
    [y_gs, iter_gs] = gs_iteration(A, b, tol, max_iter);
    error_gs_2 = norm(y_gs - y_exact, 2);
    error_gs_inf = norm(y_gs - y_exact, inf);
    
    % 输出结果表格
    fprintf('方法         迭代次数    2范数误差       无穷范数误差\n');
    fprintf('Jacobi       %-10d  %.6e    %.6e\n', iter_jacobi, error_jacobi_2, error_jacobi_inf);
    fprintf('GS           %-10d  %.6e    %.6e\n', iter_gs, error_gs_2, error_gs_inf);
    fprintf('\n');
end
figure('Name', sprintf('题1: ε=%.4g, n=%d', eps, n), 'Position', [100, 100, 700, 500]);
plot(x, y_exact, 'k-', 'LineWidth', 2); hold on;
plot(x, y_jacobi, 'r--', 'LineWidth', 1.5);
plot(x, y_gs,     'b-.', 'LineWidth', 1.5);
grid on; box on;
xlabel('x'); ylabel('y');
title(sprintf('题1: 数值解与精确解对比 (ε=%.4g, n=%d)', eps, n));
legend('精确解', 'Jacobi', 'GS', 'Location', 'Best');

%% 题目2：二维Poisson方程的GS迭代求解
clc;
% 参数设置
N_values = [20, 40, 80];  
tol2 = 1e-7;  
max_iter2 = 100000;

% 函数定义
g_func = @(x, y) exp(x.*y);  
f_func = @(x, y) x + y;

% 存储结果
results = zeros(length(N_values), 2);

% 对每个N值进行计算
for idx = 1:length(N_values)
    N = N_values(idx);
    h = 1/N;
    
    fprintf('N = %d (网格大小 h = %.4f)：\n', N, h);
    fprintf('-----------------------------------------------\n');
    
    n_interior = (N-1)^2;
    
    u = zeros(n_interior, 1);
    
    iter = 0;
    for iter = 1:max_iter2
        u_old = u;
        
        for k = 1:n_interior
            % 将一维索引k转换为二维索引(i,j)
            j = ceil(k / (N-1));  
            i = k - (j-1) * (N-1); 
            
            x_pos = i * h;
            y_pos = j * h;
            
            rhs = h^2 * f_func(x_pos, y_pos);
            
            center_coeff = 4 + h^2 * g_func(x_pos, y_pos);
            
            neighbor_sum = 0;
            
            if i == 1
                neighbor_sum = neighbor_sum + 1; 
            else
                k_left = k - 1;
                neighbor_sum = neighbor_sum + u(k_left);
            end
            
            if i == N-1
                neighbor_sum = neighbor_sum + 1;  
            else
                k_right = k + 1;
                neighbor_sum = neighbor_sum + u(k_right);
            end
            
            if j == 1
                neighbor_sum = neighbor_sum + 1;  
            else
                k_down = k - (N-1);
                neighbor_sum = neighbor_sum + u(k_down);
            end
            
            if j == N-1
                neighbor_sum = neighbor_sum + 1;  
            else
                k_up = k + (N-1);
                neighbor_sum = neighbor_sum + u(k_up);
            end
            
            u(k) = (rhs + neighbor_sum) / center_coeff;
        end
        
        if norm(u - u_old, 2) < tol2
            break;
        end
    end
    
    % 存储结果
    results(idx, 1) = N;
    results(idx, 2) = iter;
    
    fprintf('迭代次数：%d\n', iter);
    fprintf('最终解与精确解(全1)的误差(2范数)：%.6e\n', norm(u - ones(n_interior, 1), 2));
    fprintf('最终解与精确解(全1)的误差(∞范数)：%.6e\n\n', norm(u - ones(n_interior, 1), inf));
end

% 输出汇总表格
fprintf('===============================================\n');
fprintf('汇总结果表格：\n');
fprintf('-----------------------------------------------\n');
fprintf('N          迭代次数\n');
fprintf('-----------------------------------------------\n');
for idx = 1:length(N_values)
    fprintf('%-10d %d\n', results(idx, 1), results(idx, 2));
end
fprintf('===============================================\n\n');

U_in = reshape(u, N-1, N-1);  
Z = ones(N+1, N+1);          
Z(2:N, 2:N) = U_in;          
[xg, yg] = meshgrid(0:h:1, 0:h:1);

figure('Name', sprintf('题2: GS数值解曲面 N=%d', N), 'Position', [150, 150, 720, 560]);
surf(xg, yg, Z); shading interp; colormap(parula); colorbar;
xlabel('x'); ylabel('y'); zlabel('u');
title(sprintf('题2: GS数值解曲面 (N=%d)', N));
view(45, 35); grid on; box on;

%% Jacobi迭代函数
function [x, iter] = jacobi_iteration(A, b, tol, max_iter)
    n = length(b);
    x = zeros(n, 1);  % 初始解
    x_new = zeros(n, 1);
    
    for iter = 1:max_iter
        for i = 1:n
            sum_val = 0;
            for j = 1:n
                if j ~= i
                    sum_val = sum_val + A(i,j) * x(j);
                end
            end
            x_new(i) = (b(i) - sum_val) / A(i,i);
        end
        
        % 检查收敛性（无穷范数）
        if norm(x_new - x, inf) < tol
            x = x_new;
            return;
        end
        x = x_new;
    end
    warning('Jacobi方法达到最大迭代次数未收敛');
end

%% GS迭代函数
function [x, iter] = gs_iteration(A, b, tol, max_iter)
    n = length(b);
    x = zeros(n, 1);  % 初始解
    
    for iter = 1:max_iter
        x_old = x;
        for i = 1:n
            sum_val = 0;
            for j = 1:i-1
                sum_val = sum_val + A(i,j) * x(j);  
            end
            for j = i+1:n
                sum_val = sum_val + A(i,j) * x(j);  
            end
            x(i) = (b(i) - sum_val) / A(i,i);
        end
        
        % 检查收敛性（无穷范数）
        if norm(x - x_old, inf) < tol
            return;
        end
    end
    warning('GS方法达到最大迭代次数未收敛');
end