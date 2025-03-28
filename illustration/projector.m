% This is an illustration to show a special transformation 
% called orthogonal projection in 3D space. 
% We generate this projection by Q P_{2} Q^{*} 
% where Q is a unitary matrix and P_{2} is a projection matrix [I_{2} 0; 0 0 0].

% We draw the hyperpane generated by q_{1}, q_{2}, the first two columns of Q, 
% assume q_{1} = 1/sqrt(3)[1,1,1], q_{2} = [1/sqrt(2), -1/sqrt(2),  0] , q_{3} = [1/sqrt(6), 1/sqrt(6), -2/sqrt(6)].

% And we draw the projection of a point P = [2, 3, 4] onto the hyperplane.

a = [1, 1, 1]/sqrt(3); % replace 'q1' by 'a' for brevity
b = [1, -1, 0]/sqrt(2); 
c = [1, 1, -2]/sqrt(6);

Q = [a; b; c]';

P2 = diag([1 1 0]);
P = Q*P2*Q';

fprintf("Projection Matrix P:\n");
disp(P);

pt = [1; 2; 6];
proj_pt = P*pt;

%% Prepare data for illurstration

% given (x,y), we use the relation '(x,y,z) dot (a times b)=0' to
% determine z such that (x,y,z) lies in the plane spanned by a and b.
sample = linspace(-1, 6, 10);
nor_vec = cross(a, b);
[X, Y] = meshgrid(sample, sample);
Z = -(nor_vec(1)*X + nor_vec(2)*Y)/nor_vec(3);

figure
surf(X, Y, Z, 'EdgeColor','none',...
    'FaceColor', [112 223 224]/255,...
    'FaceAlpha', 0.5);
hold on

plot3(pt(1), pt(2), pt(3), 'ro', 'MarkerFaceColor', 'r');
plot3(proj_pt(1), proj_pt(2), proj_pt(3), 'bs', 'MarkerFaceColor', 'b');
quiver3(pt(1), pt(2), pt(3), proj_pt(1)-pt(1), proj_pt(2)-pt(2), proj_pt(3)-pt(3));

legend('plane spanned by q_1 and q_2', 'point (1,2,6)', 'projected point', 'projection line');
xlabel('x');
ylabel('y');
title('Orthogonal projection onto the plane')
axis equal




