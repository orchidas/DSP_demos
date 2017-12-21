%Cyclic convolution demo - Generating an ADSR envelope with 
%convolution with a one pole filter

close all, clear all, clc;

fs = 100;
T = 1/fs;
dur = 1;
time = 0:T:dur-T;
N = length(time);

%let's create signals
x = [ones(1,50), 0.8*ones(1,50), zeros(1,100*N)];
y = [0.99.^(1:10:1000), zeros(1,100*N)];

%plot the signals
figure;
plot(x);hold on;
plot(y);hold off;

M = length(x);
z = zeros(1,M);

tic;
%convolution
for n = 1:M
    for k = 1:M
        z(n) = z(n) + x(k)*y(mod(n-k,M)+1);
    end
end
t1 = toc;


%convolution with FFT
tic;
M2 = 2^(nextpow2(M));
X = fft(x,M2);
Y = fft(y,M2);
zfft = ifft(X.*Y);
t2 = toc;

figure;
plot(1:M,z);hold on;
plot(1:M2,zfft);hold off;
legend('Not FFT','FFT');
title('Convolved ADSR envelope');

fprintf('Time taken for convolution without FFT %d \n', t1);
fprintf('Time taken for convolution with FFT %d \n', t2);

%ratio of times
t1/t2


