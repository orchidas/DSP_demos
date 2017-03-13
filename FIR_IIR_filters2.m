%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% A demo on digital filters

clear all;
close all;
clc;

% the system we will work with is:
% y(n) = x(n) + x(n-1) - y(n-1)

N = 10; % number of samples
x = 1:N == 1;

% initialize the output
y = zeros(size(x));
% we look at the first sample
y(1) = x(1);

% iterate to obtain the output
for n=2:N
    
    y(n) = x(n) + x(n-1) + y(n-1);
    
end

figure(1)
stem(y)
grid on
title('Impulse response of the system $y(n) = x(n) + x(n-1) - y(n-1)$', 'Interpreter', 'latex')
xlabel('Time (samples)','Interpreter','latex')
ylabel('Ampliutude','Interpreter','latex')

% now let's explore this system
% y(n) = \sum_{m=0}^\inf x(n-M)

N = 100;
x = 1:N == 1;

% initialize the output
y = zeros(size(x));
% we look at the first samples
y(1) = x(1);

for n=2:N
    
    y(n) = x(n) + y(n-1);
    
end

figure(2)
stem(y)
grid on
title('Impulse response of the system $y(n) = \sum_{m=0}^{\infty} x(n-M)$', 'Interpreter', 'latex')
xlabel('Time (samples)','Interpreter','latex')
ylabel('Ampliutude','Interpreter','latex')

% now let's explore this system:
% y(n) = x(n) + x(n-1)
N = 500;

x = 1:N == 1;
y = zeros(size(x));

y(1) = x(1);

for n=2:N
    
    y(n) = x(n) + x(n-1);   
    
end

NFFT = 2^nextpow2(length(y));
Y = fftshift(fft(y,NFFT));
freqs = linspace(-pi,pi-2*pi/NFFT,NFFT);

figure(3)
subplot(3,1,1)
stem(y)
grid on
title('Impulse response of the system $y(n) = x(n) + x(n-1)$', 'Interpreter', 'latex')
xlabel('Time (samples)','Interpreter','latex')
ylabel('Ampliutude','Interpreter','latex')
subplot(3,1,2)
plot(freqs,abs(Y))
axis tight
title('Frequency response of the system $y(n) = x(n) + x(n-1)$', 'Interpreter', 'latex')
xlabel('Frequency ($-\pi ~ to ~ \pi$)','Interpreter','latex')
ylabel('Magnitude','Interpreter','latex')
subplot(3,1,3)
plot(freqs,angle(Y))
axis tight
title('Phase response of the system $y(n) = x(n) + x(n-1)$', 'Interpreter', 'latex')
xlabel('Frequency ($-\pi ~ to ~ \pi$)','Interpreter','latex')
ylabel('Angle (radians)','Interpreter','latex')

% this is an example using the filter function
% type: help filter to learn more
% the response of this filter will be the same as the one in figure 3

% an impulse
N = 500;
x = 1:N == 1;

% digital filter coefficients
B = [1, 1];
A = 1;

y = filter(B,A,x);

NFFT = 2^nextpow2(length(y));
Y = fftshift(fft(y,NFFT));
freqs = linspace(-pi,pi-2*pi/NFFT,NFFT);

figure(4)
subplot(3,1,1)
stem(y)
grid on
title('Impulse response of the system $y(n) = x(n) + x(n-1)$', 'Interpreter', 'latex')
xlabel('Time (samples)','Interpreter','latex')
ylabel('Ampliutude','Interpreter','latex')
subplot(3,1,2)
plot(freqs,abs(Y))
axis tight
title('Frequency response of the system $y(n) = x(n) + x(n-1)$', 'Interpreter', 'latex')
xlabel('Frequency ($-\pi ~ to ~ \pi$)','Interpreter','latex')
ylabel('Magnitude','Interpreter','latex')
subplot(3,1,3)
plot(freqs,angle(Y))
axis tight
title('Phase response of the system $y(n) = x(n) + x(n-1)$', 'Interpreter', 'latex')
xlabel('Frequency ($-\pi ~ to ~ \pi$)','Interpreter','latex')
ylabel('Angle (radians)','Interpreter','latex')