%% Q1
clc;
syms x;
f1_sym = exp((sin(x))^3 + 1) - 2;
f1 = matlabFunction(f1_sym);

figure;
x_range1 = linspace(-pi/2, pi/2, 1000);
plot(x_range1, f1(x_range1));
grid on; hold on;
plot(x_range1, zeros(size(x_range1)), 'r--');
xlabel('x'); ylabel('f(x)');
title('f(x)=e^{(sinx)^3+1}-2');
legend('f(x)', 'y=0');

% estimate -0.8
x0_1 = -0.8;

% answer11
root1_1= newton(f1_sym, x0_1, 1000, 0);
% we need 20 to compare the two answers
fprintf('根11: %.20f', root1_1);

fprintf('\n\n');

% answer12
root1_2 = newton(f1_sym, x0_1, inf, 1e-5);
fprintf('根12: %.20f', root1_2);

%% Q2
clc;
syms x;
f2_sym = sqrt(x^3 - x^2 + 5) - 3;
f2 = matlabFunction(f2_sym);

figure;
x_range2 = linspace(1, 5, 1000);
plot(x_range2, f2(x_range2));
grid on; hold on;
plot(x_range2, zeros(size(x_range2)), 'r--');
xlabel('x'); ylabel('f(x)');
title('f(x)=(x^3-x^2+5)^{1/2}-3');
legend('f(x)', 'y=0');

% estimate as 2
x0_2 = 2;

root2_1 = newton(f2_sym, x0_2, 1000, 0);
fprintf('根21: %f', root2_1);

fprintf('\n');

root2_2 = newton(f2_sym, x0_2, inf, 1e-5);
fprintf('根22: %f',root2_2);

%% newton
function root = newton(f, x0, max_iter, tol)

    syms x;
    f_ = matlabFunction(f);
    f_diff = matlabFunction(diff(f, x));


    x_n = x0;
    iter=1;
    while iter <=max_iter
        x_n1 = x_n - f_(x_n) / f_diff(x_n);
        if abs(x_n1 - x_n) < tol 
            root = x_n1;
            return;
        end
        iter=iter+1;
        x_n = x_n1;
    end
    root = x_n;
end
