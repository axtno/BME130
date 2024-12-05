% Homework 1 Problem 5, Part A
clc;                                %clears command window
clear;                              %clears workspace
load eog.mat;                       %brings file into workspace
fs = 1/.0005;			            %sample interval = 0.5 msec
[nu,N] = size(eog);			        %get data matrix size 
if nu > N
	eog = eog';		                %transpose matrix
	t = (1:nu)/fs;		            %generate time vector 
else
	t = (1:N)/fs;		            %time vector if no transpose	
end	
plot(t,eog(1,:)); 			        %plot individual record
title('EOG vs. Time');              %label title
ylabel('EOG [V]');                  %label y axis
xlabel('Time [sec]');               %label x axis

% Part B
avg = mean(eog);                    %calculate mean of eog
fprintf('%5.4f V is the mean value of the EOG signal.\n',avg); 
%print mean in V

% Part C
E = sum(abs(eog).^2);                 %add the abs value of eog squared
P = E/length(t);                      %power = energy/time
fprintf('%5.4f V^2 is the power of the EOG signal.\n',P); %display power