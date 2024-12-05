% Homework 3 Problem 5
clc;
clear;
A1 = [-1.5 -2;1 0];              % create A matrix
B1 = [0.5;0];                    % create B matrix
C1 = [0 1];                      % create C matrix
D1 = 0;                          % assign D value

% create SISO state-space model 
sisostate = ss(A1,B1,C1,D1)

A2 = [0 1;-5 -2];                % create A matrix
B2 = [0;3];                      % create B matrix
C2 = [0 1];                      % create C matrix
D2 = 0;                          % assign D value
ts = 0.25;                       % sample time

% create discrete-time state-space model 
dtstate = ss(A2,B2,C2,D2,ts)