%DFT is a matrix multiplication
clear all,close all, clc;

dur = 0.5;
Fs = 8000;
t = 0:1/Fs:dur;
f1 = 100;
f2 = 1000;

x = sin(2*pi*f1.*t) + 0.5*sin(2*pi*f2.*t);
N = length(t);
n = 0:N-1;
k = 0:N-1;

%let's define the DFT matrix
W = exp(-1i*2*pi*n'*k/N);
%DFT coefficients
X = W*x';

%magnitude spectrum
freqs = linspace(-Fs/2,Fs/2,N);
figure(1);
plot(freqs, fftshift(abs(X)));
xlabel('Frequency in Hz');ylabel('Magnitude');

%IDFT
xrec = 1/N*(W'*X);
%plot the IDFT
figure(2);
plot(x);hold on;
plot(real(xrec));hold off;
legend('original signal','IDFT');




