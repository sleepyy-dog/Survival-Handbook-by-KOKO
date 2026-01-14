% 绘制shit
axis equal equal off; hold on; camlight headlight; lighting gouraud; view(3)
[X, Y, Z] = shitshape();
surf(X + .1, Y, Z + 1.06, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');
surf(X./1.3, Y./1.3, - Z + 1.1, 'FaceColor', [0.4 0.2 0], 'EdgeColor', 'none');

% 甜筒数据构造
N = 500; n = 30;
[X, Y] = meshgrid(linspace(-1, 1, N));
Z = X.*0;
Z(1:n:N, :) = .01; Z(:, 1:n:N) = .01;
Z(2:n:N, :) = .01; Z(:, 2:n:N) = .01;
Z(X.^2 + Y.^2 > 1) = nan;
R_x = @(theta)[1, 0, 0; 
       0, cos(theta), -sin(theta);
       0, sin(theta),  cos(theta)];
R_y = @(theta)[ 
       cos(theta), 0, -sin(theta);
       0, 1, 0;
       sin(theta), 0,  cos(theta)];
nXYZ = [X(:), Y(:), Z(:)]*R_x(-pi/2.9);
nX = nXYZ(:,1); nY = nXYZ(:,2); nZ = nXYZ(:,3);
nZ = nZ - min(nZ); nY = nY - min(nY);
nT = nX ./(nZ/2.5); nR = nY;
nX = cos(nT).*nR; nY = sin(nT).*nR;
SHdl = surf(reshape(nX, N, []), reshape(nY, N, []), reshape(nZ, N, []), ...
    'EdgeColor','none', 'FaceColor',[228,200,142]./255);
material(SHdl, 'dull')

% 绘制饼干
[X, Y, Z] = cylinder(0.04, 100); N = size(X, 1);
nXYZ = [X(:), Y(:), Z(:)]*R_x(pi/5);
nX = nXYZ(:,1); nY = nXYZ(:,2); nZ = nXYZ(:,3);
surf(reshape(nX, N, []), reshape(nY, N, []), reshape(nZ, N, []) + 1.3,...
    'FaceColor', [0.8 0.6 0.4], 'EdgeColor', 'none');
nXYZ = [X(:), Y(:), Z(:)]*R_x(pi/6);
nX = nXYZ(:,1); nY = nXYZ(:,2); nZ = nXYZ(:,3);
nXYZ = [nX(:), nY(:), nZ(:)]*R_y(pi/7);
nX = nXYZ(:,1); nY = nXYZ(:,2); nZ = nXYZ(:,3);
surf(reshape(nX, N, []), reshape(nY, N, []), reshape(nZ, N, []) + 1.2,...
    'FaceColor', [0.8 0.6 0.4], 'EdgeColor', 'none');