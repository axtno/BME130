% Homework 2 Problem 4
clc;
clear;
load ECG_1min.mat;                  % brings file into workspace
fs = 250;                           % sampling freq in Hz
N = length(ecg);                    % get data length
X = fft(ecg);                       % calculate the FFT
f = (1:N)*fs/N;                     % frequency vector for plotting
mag = abs(X)/N;                     % determine magnitude and normalize
phase = unwrap(angle(X));           % determine unwrapped phase 
flim = 20;                          % frequency limit
m_plot = find(f > flim,1);           % find index corresponding to 20 Hz

% plot magnitude and frequency
subplot(2,1,1);                     % create 2x1, designate position 1
plot(f(2:m_plot), mag(2:m_plot));     % plot freq and magnitude without DC
xlim([0 20]);                       % limits freq from 0 to 20
title('Magnitude Spectrum of ECG Signal');      % title
xlabel('Frequency (Hz)');           % label x axis
ylabel('Magnitude');                % label y axis
grid on;                            l% gives graph a grid

% plot unwrapped phase spectrum
subplot(2,1,2);                     % designates position 2
plot(f(2:m_plot),phase(2:m_plot));    % plot freq and unwrapped phase
xlim([0 20]);                       % limits freq from 0 to 20
title('Unwrapped Phase Spectrum of ECG Signal');   % title
xlabel('Frequency (Hz)');           % label x axis
ylabel('Phase (radians)');          % label y axis
grid on;                            % gives graph a grid

% find average heart rate
[peak, m_peak] = max(abs(X(2:m_plot)));   % locate max mag peak
max_freq = f(m_peak);               % freq corresponding to peak
bpm = max_freq * 60;                % Hz to bpm
fprintf('The average heart rate was %.2f BPM.\n',bpm); % display bpm
fprintf('The calculated frequency at the max magnitude peak was %.2f Hz.\n',max_freq);
% displays calculated frequency 