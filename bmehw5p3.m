% Homework 5 Problem 3

clc;
clear;
N = 5000;               % population total
beta = 1.5;             % given transmission rate
gamma = 0.75;           % given recovery rate
T = 30;                 % total time in days 
dt = 0.01;              % time interval in days 
k = T/dt;               % index for each time step

% initial conditions
S = zeros(1,k);         % susceptible population over time
I = zeros(1,k);         % infected population over time
R = zeros(1,k);         % recovered population over time
S(1) = 4999;            % given initial susceptible population
I(1) = 1;               % given initial infected population
R(1) = 0;               % given initial recovered population 

% simulation
for j = 1:k-1
    S(j+1) = S(j) - dt * (beta*S(j)*I(j)/N);
    I(j+1) = I(j) + dt * (beta*S(j)*I(j)/N - gamma * I(j));
    R(j+1) = R(j) + dt * (gamma * I(j));
end

time = (0:k-1) * dt;    % time vector

% plot
figure;
plot(time,S,'k','DisplayName','Susceptible');  % plot susceptible over time
hold on;
plot(time,I,'r','DisplayName','Infected');     % plot infected over time
plot(time,R,'b','DisplayName','Recovered');    % plot recovered over time
xlabel('Time (days)');                         % label x axis
ylabel('Population');                          % label y axis
title('SIR Model Simulation');                 % label title
legend('show');                                % show plot legend
grid on;                                       % enable grid
hold off;