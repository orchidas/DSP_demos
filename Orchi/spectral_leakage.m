%Spectral leakage for non-DFT bins
clear all,close all, clc;

dur = 1;
Fs = 1000;
t = 0:1/Fs:dur-1/Fs;
f1 = 100:0.2:101;
f2 = 0;
N = length(t);
n = 0:N-1;
k = 0:N-1;
freqs = linspace(-Fs/2,Fs/2-1,N);

%hann window
win = hann(N);

%let's define the DFT matrix
W = exp(-1i*2*pi*n'*k/N);

for i = 1:length(f1)
    x = sin(2*pi*f1(i).*t) + 0.5*sin(2*pi*f2.*t);

    %DFT coefficients
    X = W*x';

    %windowed signal
    xwin = x.*win';
    Xwin = W*xwin';
    
    figure(2);
    subplot(211);plot(x);
    subplot(212);plot(xwin);
    
    %magnitude spectrum
    X = abs(X)/max(abs(X));
    Xwin = abs(Xwin)/max(abs(Xwin));
    
    figure(1);
    subplot(211);
    stem(freqs, fftshift(X));hold on;
    xlabel('Frequency in Hz');ylabel('Magnitude');
    title('Rectangular window');
    
    subplot(212);
    stem(freqs, fftshift(Xwin));hold on;
    xlabel('Frequency in Hz');ylabel('Magnitude');
    title('Hann window');
    
    pause
end

%Add legend to plot
strings = cellstr(num2str(f1'));
legend(strings);


