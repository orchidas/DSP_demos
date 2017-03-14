%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320B       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% a demo of the Cepstrum

clear all;
close all;
clc;

% loading a speech signal
[x,fs] = audioread('w26ah.wav'); % source https://homepages.wmich.edu/~hillenbr/voweldata.html

% listen to the signal
soundsc(x,fs) 

% see the signal in the time domain
time = (0:length(x)-1)/fs;
subplot(2,1,1)
plot(time,x)
xlabel('time (s)','Interpreter','latex')
ylabel('Amplitude','Interpreter','latex')
axis tight
title('Original Speech Signal')

% grab a smaller constant-pitch chunk of the signal
start_t = 0.2;
end_t = 0.25;
x = x(fs*start_t:end_t*fs);

% let's use a window to smooth in the time domain
w_t = hann(length(x));
x = x.*w_t;

subplot(2,1,2)
time = start_t:1/fs:end_t;
plot(time,x)
xlabel('time (s)','Interpreter','latex')
ylabel('Amplitude','Interpreter','latex')
axis tight
title('Fragment')

% let's take the signal into the frequency domain
X = fft(x,2^nextpow2(length(x)*4)); % add zero padding also

f = linspace(0,fs/2,length(X)/2);

figure(2)
plot(f,20*log10(abs(X(1:length(X)/2))/max(abs(X(1:length(X)/2)))))
xlabel('Frequency (Hz)','Interpreter','latex')
ylabel('dB','Interpreter','latex')
axis tight
grid on
title('Spectrum of the speech signal')
ylim([-100 0])

% let's go to the cepstrum domain
Xlog = log10(abs(X));
C = ifft(Xlog,2^nextpow2(length(Xlog)*4));

% look at the real cepstrum
figure(3)
subplot(2,1,1)
plot(abs(C))
axis tight
grid on
xlabel('Quifrency bins')
title('Real Cepstrum for the speech signal')

% window the low-quifrency components to obtain the cepstrum
C = abs(C(1:200));

c = fft(C-mean(C),2^nextpow2(length(C))*4);
subplot(2,1,2)
plot(20*log10((abs(c(1:end/2))/max(abs(c(1:end/2))))));
title('Cepstrum (frequency domain envelope)')
xlabel('Frequency bins')
grid on
axis tight
ylim([-35 0])
