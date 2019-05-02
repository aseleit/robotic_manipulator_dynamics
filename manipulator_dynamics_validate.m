clear all; close all; clc;

%% Robot Links definitions
% L(1) = Link([0 169.77 64.2 -1.5707], 'R');
% L(2) = Link([0 0 305 0], 'R');
% L(3) = Link([0 0 0 1.5707], 'R');
% L(4) = Link([0 -222.63 0 -1.5707], 'R');
% L(5) = Link([0 0 0 1.5707], 'R');
% L(6) = Link([0 -36.25 0 0], 'R');
% % create an object called robot from class SerialLink
% Robot = SerialLink(L);
% Robot.name = "AR2";
% 
% cg = CodeGenerator(Robot);
% cg.geninertia(L);

syms a1 a2 a3 a4 a5 a6 g real
syms c1 c2 c3 c4 c5 c6 m1 m2 m3 m4 m5 m6 real

%syms Iyy1 Iyy2 b1 b2 real
Iyy1 = 0
Iyy2 = 0
Iyy3 = 0
Iyy4 = 0
Iyy5 = 0
Iyy6 = 0
b1 = 0
b2 = 0
b3 = 0
b4 = 0
b5 = 0
b6 = 0


twolink = SerialLink([
    Revolute('d', 0, 'a', a1, 'alpha', 0, 'm', m1, 'r', [c1 0 0], 'I', [0 Iyy1 0], 'B', b1, 'G', 1, 'Jm', 0, 'standard')
    Revolute('d', 0, 'a', a2, 'alpha', 0, 'm', m2, 'r', [c2 0 0], 'I', [0 Iyy2 0], 'B', b2, 'G', 1, 'Jm', 0, 'standard')
    Revolute('d', 0, 'a', a3, 'alpha', 0, 'm', m3, 'r', [c3 0 0], 'I', [0 Iyy3 0], 'B', b3, 'G', 1, 'Jm', 0, 'standard')
    Revolute('d', 0, 'a', a4, 'alpha', 0, 'm', m4, 'r', [c4 0 0], 'I', [0 Iyy4 0], 'B', b4, 'G', 1, 'Jm', 0, 'standard')
    Revolute('d', 0, 'a', a5, 'alpha', 0, 'm', m5, 'r', [c5 0 0], 'I', [0 Iyy5 0], 'B', b5, 'G', 1, 'Jm', 0, 'standard')
    Revolute('d', 0, 'a', a6, 'alpha', 0, 'm', m6, 'r', [c6 0 0], 'I', [0 Iyy6 0], 'B', b6, 'G', 1, 'Jm', 0, 'standard')
    ], ...
    'name', 'two link', ...
    'comment', 'from Spong, Hutchinson, Vidyasagar');
twolink = twolink.sym();
twolink.gravity = [0; 0; g];
twolink.base = trotx(sym('pi')/2);

syms q1 q2 q3 q4 q5 q6 q1d q2d q3d q4d q5d q6d q1dd q2dd q3dd q4dd q5dd q6dd real

q = [q1 q2 q3 q4 q5 q6];
qd = [q1d q2d q3d q4d q5d q6d];
qdd = [q1dd q2dd q3dd q4dd q5dd q6dd];

tau = twolink.rne(q,qd,qdd)

fid1 = fopen('tau_1.txt','wt');
fid2 = fopen('tau_2.txt','wt');
fid3 = fopen('tau_3.txt','wt');
fid4 = fopen('tau_4.txt','wt');
fid5 = fopen('tau_5.txt','wt');
fid6 = fopen('tau_6.txt','wt');
fprintf(fid1, '%s \n', string(tau(1)))
fprintf(fid2, '%s \n', char(tau(2)))
fprintf(fid3, '%s \n', char(tau(3)))
fprintf(fid4, '%s \n', char(tau(4)))
fprintf(fid5, '%s \n', char(tau(5)))
fprintf(fid6, '%s \n', char(tau(6)))



% Robot.dyn(1)


% Qi = [0 0 0 0 0 0]; % Initial angles
% t = 0:0.1:2;
% 
% 
% q = jtraj(Qi, Qf, t);
% Robot.plot(q);
% 
% T = Robot.fkine(Qf);
% Orientation = tr2rpy(T,'deg');

