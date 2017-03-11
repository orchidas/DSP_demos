%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all;clc

% general signal parameters
fs = 1000;
T = 1/fs;
dur = 1;
t = 0:T:dur-T;
N = length(t);

% generate DFT matrix
k=0:N-1;
n=0:N-1;
dft_mat = exp(-1i*2*pi*k'*n/N);

% an impulse
x_1 = t==t(1);
% and a sinusoid
f = 250;
x_2 = cos(2*pi*f*t);

% spectrum for both signals
X_1 = dft_mat*x_1';
X_2 = dft_mat*x_2';

% subtracting signal 2 from signal 1
X_filt = X_1/max(X_1)-real(X_2)/max(real(X_2));

% visualizations
subplot(3,1,1)
stem(abs(X_2))
ylabel('Magnitude')
subplot(3,1,2)
stem(abs(X_1))
ylabel('Magnitude')
subplot(3,1,3)
plot(X_1/max(X_1)-abs(X_2)/max(abs(X_2)))
xlabel('Frequency bins')
ylabel('Magnitude')