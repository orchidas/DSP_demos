% Complex number demo
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%

% let's set up the environment
clear all
close all
clc


% plotting real numbers, plotting imaginary numbers, plotting complex
% numbers.

% this is a real number
real_num = 32;
imag_num = -7*1i;

compl_num = real_num + imag_num;

figure(1)
plot(compl_num,'o')
grid on
xlabel('real')
ylabel('imaginary')
title('Complex Plane')

% print features from this number
% magnitude
abs(compl_num)

% phase (angle)
angle(compl_num)

% complex conjugate (Hermitian)
compl_num'

% Euler's idenitity and plotting of complex numbers associated with it
% $e^{i \theta} = cos(\theta) + i sin(\theta)$

% euler's number in matlab
theta = pi/4;
exp(1i*theta)

% magnitude
abs(exp(1i*theta))

% phase (angle)
angle(exp(1i*theta))

% complex conjugate
exp(1i*theta)'

% create a circle for the plot
cir_theta = linspace(0,2*pi,360); % the marriage of both worlds

% let's plot this number and see it in the complex plane
figure(2)
plot(exp(1i*theta),'o')
grid on
hold on
plot(exp(1i*cir_theta),'k')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('real')
ylabel('imaginary')
title('Complex Plane')


% generate complex sinusoids in the time domain

% step 1: time vector
t = linspace(0,2*pi,360);

% generate complex sinusoid
complex_sin = exp(1i*t);

% let's see it
figure(3)
subplot(3,2,1)
plot(complex_sin)
grid on
axis square
title('Complex sinusoid on complex plane')
subplot(3,2,2)
plot(real(complex_sin))
title('Real Part')
grid on
subplot(3,2,3)
plot(imag(complex_sin))
grid on
title('Imaginary Part')
subplot(3,2,4)
plot(angle(complex_sin))
grid on
title('Angle')
subplot(3,2,5)
plot(abs(complex_sin))
grid on
title('Magnitude')

% obtain the real part using trigonometric identities
real_cos = (complex_sin(:) + complex_sin')/2;
real_sin = (complex_sin(:) - complex_sin')/(2*1i);

subplot(3,2,6)
plot(real_cos)
hold on
plot(real_sin,'r')
grid on
title('Sine and Cosine together')