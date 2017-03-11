% Sinusoid demo
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% let's define general parameters that we will need to generate a sinusoid
fs = 44100; % sampling rate in Hz
A = 0.8; % Amplitude of the sinusoid (limits are -1 and 1)
f = 50; % frequency of our sinusoid in Hz
dur = 6; % duration of the sinusoid in seconds
theta = pi/2; % phase in radians

% so, we know that sine is a function (math), in order to generate our
% sinusoid, we will need a linear space for time.
t = linspace(0,dur,fs*dur);

% let's use the built-in sine function to generate our sinusoid.
% arrays to store the output
y = A*sin(2*pi*f*t + theta);

% let's plot a period to visualize
plot(t(1:fs/f),y(1:fs/f));
title('The first 320A Sinusoid');
xlabel('Time (s)');
ylabel('Amplitude (A.U.)');
grid on;
hold on;
axis([0 1/f -1 1]);
pause
stem(t(1:fs/f),y(1:fs/f),'r');