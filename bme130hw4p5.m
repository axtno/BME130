% Homework 4 Problem 5
clc;
clear;
load signal_noise.mat;                     % brings file into workspace
fs = 125;                                  % sampling freq in Hz
t = (0:length(resp)-1)/fs;                 % create time vector

% define filters
filterfivept = (1/5) * ones(1,5);          % 5 point running avg filter
filterfiftpt = (1/15) * ones(1,15);        % 15 point running avg filter

% apply filters to signal 
filteredfivept = conv(resp,filterfivept,'same')+1;    % applies filter to signal, shift up 1
filteredfiftpt = conv(resp,filterfiftpt,'same')+1;    % applies filter to signal, shift up 1

% calculate magnitude spectrum for each filtered signal
nfftsignal = length(filteredfivept);                         % points for FFT on the signal
fsignal = (0:nfftsignal-1)*(fs/nfftsignal); % Frequency vector for plotting

magorig = abs(fft(resp, nfftsignal)); % mag spectrum of original signal
magfivept = abs(fft(filteredfivept, nfftsignal)); % mag spectrum of 5 pt filtered signal
magfiftpt = abs(fft(filteredfiftpt, nfftsignal)); % mag spectrum of 15 pt filtered signal

% calculate frequency response
[hfiveptfreq, wfivept] = freqz(filterfivept,1,nfftsignal,fs);
[hfiftptfreq, wfiftpt] = freqz(filterfiftpt,1,nfftsignal,fs);

% create plots
% plot 1: original signal
figure;
subplot(2,4,1);                         % create 2x4 subplot, designate position 1
plot(t,resp,'r');                       % plot original signal
title('Original Signal');               % sets title
xlabel('Time (s)');                     % label x axis
ylabel('Signal Amplitude');             % label y axis
grid on;                                % enable grid

% plot 2: 5 pt original and filtered
subplot(2,4,2);                         % designate position 2
hold on;                                % waits to allow two lines
plot(t,resp,'r','DisplayName','Original Signal');       % plots original signal
plot(t,filteredfivept,'k','DisplayName','Filtered 5 Pt');   % plot filtered
title('5 Point Running Average');       % sets title
xlabel('Time (s)');                     % label x axis
ylabel('Signal Amplitude');             % label y axis
legend('show');                         % show plot legend
grid on;                                % enable grid

% plot 3: 15 pt original and filtered
subplot(2,4,3);                         % designate position 3
hold on;                                % waits to allow two lines
plot(t,resp,'r','DisplayName','Original Signal');       % plots original signal
plot(t,filteredfiftpt,'k','DisplayName','Filtered 15 Pt');  % plot filtered
title('15 Point Running Average');      % sets title
xlabel('Time (s)');                     % label x axis
ylabel('Signal Amplitude');             % label y axis
legend('show');                         % show plot legend
grid on;                                % enable grid

% plot 4: original magnitude spectrum
subplot(2,4,4);                         % designate position 4
plot(fsignal,20*log10(magorig));        % plot mag spectrum
title('Original Magnitude Spectrum');      % sets title
xlabel('Frequency (Hz)');               % label x axis
ylabel('Magnitude (dB)');               % label y axis
grid on;                                % enable grid

% plot 5: magnitude spectrum 5 pt
subplot(2,4,5);                         % designate position 5
plot(fsignal, 20*log10(magfivept));    % plot mag spectrum of 5 pt
title('Magnitude Spectrum of 5 Pt Signal');      % sets title
xlabel('Frequency (Hz)');               % label x axis
ylabel('Magnitude (dB)');               % label y axis
grid on;                                % enable grid

% plot 6: magnitude spectrum 15 pt
subplot(2,4,6);                         % designate position 6
plot(fsignal, 20*log10(magfiftpt));    % plot mag spectrum of 15 pt
title('Magnitude Spectrum of 15 Pt Signal');     % sets title
xlabel('Frequency (Hz)');               % label x axis
ylabel('Magnitude (dB)');               % label y axis
grid on;                                % enable grid

% plot 7: frequency spectrum 5 pt
subplot(2,4,7);                         % designate position 7
plot(wfivept*fs/(2*pi),20*log10(abs(hfiveptfreq)));  % plots freq spec of 5 pt
title('Frequency Spectrum of 5 Pt Filtered Signal');     % sets title
xlabel('Frequency (Hz)');               % label x axis
ylabel('Magnitude (dB)');               % label y axis
grid on;                                % enable grid

% plot 8: frequency spectrum 15 pt
subplot(2,4,8);                         % designate position 8
plot(wfiftpt*fs/(2*pi),20*log10(abs(hfiftptfreq))); % plots freq spec of 15 pt
title('Frequency Spectrum of 15 Pt Filtered Signal');     % sets title
xlabel('Frequency (Hz)');               % label x axis
ylabel('Magnitude (dB)');               % label y axis
grid on;                                % enable grid

