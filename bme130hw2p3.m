% Homework 2 Problem 3
clc;                                        
clear; 
load Resp.mat;                      % brings file into workspace
fs = 125;                           % sampling frequency in Hz
max_freq = 1;                       % max desired plotting frequency in Hz
N = length(Resp);                   % length of respiratory signal
f = (1:N) * fs/N;                   % construct frequency vector
t = (1:N) / fs;                     % construct the time vector
Xf = fft(Resp);                     % take Fourier transform
mag = abs(Xf)/N;                    % determine magnitude and normalize
phase = angle(Xf);                  % determine phase
flim = 2;                           % max frequency
indexlim = find(f > flim,1);        % find index corresponding to 2 Hz
fspec = f(1:indexlim);              % gets freq up to 2 Hz
magspec = mag(1:indexlim);          % magnitude spectrum
phasespec = phase(1:indexlim);      % phase spectrum

% calculate bpm without first peak
fwithout = fspec(2:end);            % index f
magwithout = magspec(2:end);        % gets magnitude without dc
[a,b] = max(magwithout);            % stores max values of magnitude spec
fpeak = fwithout(b);                % peak freq in Hz
bpm = fpeak * 60;                   % Hz to bpm
fprintf('The estimated breaths per minute was %.2f BPM.\n',bpm); 
% displays bpm

% plot magnitude and frequency
subplot(2,1,1);                     % designates position 1
plot(fwithout,magwithout);          % plots freq and magnitude
xlim([0 2]);                        % limits frequency from 0 to 2
title('Magnitude Spectrum (Fundamental to 2 Hz)');  %title 
xlabel('Frequency (Hz)');           % label x axis
ylabel('Magnitude');                % label y axis 
grid on;                            % gives graph a grid

% plot phase and frequency
subplot(2,1,2);                     % designates position 2
plot(fspec,phasespec);              % plots frequency and phase
xlim([0 2]);                        % limits frequency from 0 to 2
title('Phase Spectrum (Fundamental to 2 Hz)');      % title
xlabel('Frequency (Hz)');           % label x axis
ylabel('Phase (radians)');          % label y axis
grid on;                            % gives graph a grid
