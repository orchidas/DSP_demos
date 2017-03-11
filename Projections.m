%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%

% In this demo, we will create a DFT matrix, which we will use to take a
% signal into the frequency domain. This is a signal that will be projected
% onto a bunch of orthogonal bases. Thus, we will be able to recover our
% signal from the frequency domain, by using the same matrix.

clear all
close all
clc

load handel

% set up the working environment:
% fs = 5000;
fs = Fs;
T = 1/fs;
dur = 0.5;
time = 0:T:dur;
N = length(time);
n = 0:N-1;
k = 0:N-1;

% generate the dft matrix
dft_mat = exp(-1i*2*pi*n'*k/N);

% create a signal
f = 100;
x = y(2*fs:2.5*fs);

% get its spectrum using the dft matrix
X = dft_mat*x;

% let's bring this to a dB scale
freqs = linspace(-(fs/2),(fs/2 - 1), N);
figure(1)
subplot(2,1,1)
plot(time,x);
title('Signal in the time domain')
subplot(2,1,2)
XdB = 20*log10(fftshift(abs(X)));
plot(freqs,fftshift(abs(X)));
title('Spectrum of the signal')

% we can reconstruct the signal from its spectrum
xr = dft_mat'*X./N;

subplot(2,1,1)
hold on
plot(time,real(xr),'r')
legend('Original','Reconstructed')

soundsc(real(xr),fs)