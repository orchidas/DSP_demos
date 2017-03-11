%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% A visualization of a complex signal and its spectrum

clear all;close all;clc

fs = 1000;
T = 1/fs;
dur = 1;
time = 0:T:dur;
N = length(time);

% signal parameters
A = 0.9;
tau = 1;
f = 50;
x = A*exp((-1/tau)*time).*exp(1i*2*pi*f*time);

plot3(time,real(x),imag(x))
grid on
xlabel('Time (s)')
ylabel('Real')
zlabel('Imaginary')
title('Complex signal in time domain')

% spectrum and visualizations
NFFT = 2^nextpow2(N*5);
X = fft(x,NFFT);
freqs = linspace(-fs/2,fs/2,NFFT+1);
freqs = freqs(1:end-1);

figure(2)
plot3(freqs,real(fftshift(X)),imag(fftshift(X)))
grid on
xlabel('Frequency (Hz)')
ylabel('Real')
zlabel('Imaginary')
title('Complex spectrum')

figure(3)
plot(freqs,20*log10(abs(fftshift(X))/max(abs(X))))
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('Magnitude spectrum')