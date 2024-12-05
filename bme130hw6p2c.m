% Homework 6 Problem 2C

clc;
clear;
T1 = 8;                     % time in min
u0 = 20;                    % in ug/kg/min
tau = 2;                    % time constant in min (120 s)
k = -3.0;                   % gain in mmHg * kg * min/ug
tfin = 20;                  % final time in min
t = linspace(0,tfin,1000);  % time vector

% input function u(t) = u0*[h(t) - h(t-T1)]
u = u0 * (heaviside(t)-heaviside(t-T1));

% state space
A = -1/tau;                 % A value from space state form
B = k/tau;                  % B value from space state form
C = 1;                      % C value from space state form
D = 0;                      % D value from space state form

% create state space system
sys = ss(A,B,C,D);

% system response simulation
[y, tout] = lsim(sys,u,t);

% plot
figure;
plot(tout, y);              % plot time in min and change in MAP in mmHg
xlabel('Time (min)');       % label x axis
ylabel('Change in MAP (mmHg)'); % label y axis
title('Change in MAP Due to Hypotensive Drug Step-Like Injection'); % title
grid on;