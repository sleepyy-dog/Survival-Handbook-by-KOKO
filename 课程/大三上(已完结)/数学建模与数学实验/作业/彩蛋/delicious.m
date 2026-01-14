[X, Y, Z] = shitshape();
surf(X, Y, Z, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');
axis equal off; camlight headlight; lighting gouraud;
view(-60, 10);

function [X, Y, Z] = shitshape()
% 路径采样点数
points = 400;            
% 控制收缩曲线（后期快速变细）
z = linspace(0, 1, points);
z(1:50) = z(1:50) + z(50).*linspace(1, 0, 50);
z(201:400) = z(201:400) - .12.*linspace(0, 1, 200);
s = linspace(0, 1, points);
% 螺旋路径的半径变化（路径本身）
path_radius = linspace(.7, 0.02, points).*(cos(linspace(0, pi/2, points))+1.5)/3.5;
% 桶体粗细也收缩（同步缩小）
tube_radius = 0.18 * (1 - s.^2.5)+.001;
tube_radius(1:50) = sin(linspace(0, pi/2, 50)).*tube_radius(50);
% 螺旋角度
theta = linspace(0, 2*pi*4, points);
% 横截面圆点
circle_pts = 40;
circle_theta = linspace(0, 2*pi, circle_pts);
% 初始化
X = zeros(circle_pts, points);
Y = zeros(circle_pts, points);
Z = zeros(circle_pts, points);
for i = 1:(points - 1)
    % 当前螺旋中心位置（路径本身在缩小）
    R = path_radius(i);
    center_x = R * cos(theta(i));
    center_y = R * sin(theta(i));
    center_z = z(i);
    % 切向量（方向）
    dx = path_radius(i+1)*cos(theta(i+1)) - center_x;
    dy = path_radius(i+1)*sin(theta(i+1)) - center_y;
    dz = z(i+1) - center_z;
    tangent = [dx; dy; dz]; tangent = tangent / norm(tangent);
    % 横截面正交平面
    ref = [0; 0; 1];
    if abs(dot(ref, tangent)) > 0.99
        ref = [1; 0; 0];
    end
    normal1 = cross(tangent, ref); normal1 = normal1 / norm(normal1);
    normal2 = cross(tangent, normal1);
    % 横截面圆柱壳
    r_tube = tube_radius(i);
    for j = 1:circle_pts
        offset = r_tube * (cos(circle_theta(j)) * normal1 + sin(circle_theta(j)) * normal2);
        X(j,i) = center_x + offset(1);
        Y(j,i) = center_y + offset(2);
        Z(j,i) = center_z + offset(3);
    end
end
Z(:, end) = Z(:, end - 1);
end