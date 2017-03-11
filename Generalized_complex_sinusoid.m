%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%

% In this program, we will explore properties of the generalized complex
% sinusoid. The canonical form of this expression is:
% $$A e^{\sigma t} e^{j(\omega t+\phi)}, where A \in \mathfb{R}$$

% Section 1

clear all
close all
clc

% let's set up general parameters for the complex sinusoid

A = 1;
f = 9.7; % frequency in Hz
w = 2*pi*f; % frequency in radians
phi = pi;
dur = 1;
fs = 44100;
T = 1/fs;
tau = -1; % time constant of decay
sigma = -1/tau;

% we generate a complex sinusoid where sigma is zero
t = 0:T:dur;

com_sin = A*exp(sigma*t).*exp(1i*(w*t+phi));

subplot(3,1,1)
plot3(t,real(com_sin),imag(com_sin))
title('A generalized complex sinusoid in the complex plane')
grid on

subplot(3,1,2)
plot(t,real(com_sin))
title('Real part of the generalized complex sinusoid')
grid on

subplot(3,1,3)
plot(t,imag(com_sin))
title('Imaginary part of the generalized complex sinusoid')
grid on

%%
% Section 2
% Working Prototype for visualization purposes. The resulting signal
% has some issues.


% an attack, sustain, release, in a generalized complex sinusoid
% (there are some edge effects)

clear all
close all
clc

% let's set up general parameters for the complex sinusoid

A = 1;
f = 9.7; % frequency in Hz
w = 2*pi*f; % frequency in radians
phi = pi;
dur = 5;
fs = 1000;
T = 1/fs;
tau = -1; % time constant of decay
sigma = -1/tau;

%%% Attack %%%
% redefine the time vector, so that zero is aligned with the start of
% your loop, and you advance time from there.
t=0:T:dur; 
for k = 1:0.5*fs        
        tau = -0.5;
        sigma = -1/tau;
        com_sin(k) = A*exp(sigma*t(k)).*exp(1i*(w*t(k)+phi));        
end
A = com_sin(k);

%%% Sustain %%%
% redefine the time vector, so that zero is aligned with the start of
% the next loop, and you advance time from there.
t=-0.5:T:dur; 
for k=0.5*fs:1.5*fs
    
    if t(k) > 0 && t(k) <= 1
        tau = inf;
        sigma = -1/tau;
        com_sin(k) = A*exp(sigma*t(k)).*exp(1i*(w*t(k)+phi));
    end

end
A = com_sin(k);

%%% Release %%%
% redefine the time vector, so that zero is aligned with the start of
% your loop, and you advance time from there.
t=-1.5:T:dur;
for k=1.5*fs:dur*fs    
    if t(k) > 0        
        tau = 1;
        sigma = -1/tau;
        com_sin(k) = A*exp(sigma*t(k)).*exp(1i*(w*t(k)+phi));
    end    
end

subplot(3,1,1)
plot3(t(1:dur*fs),real(com_sin),imag(com_sin))
title('A generalized complex sinusoid in the complex plane')
grid on

subplot(3,1,2)
plot(t(1:dur*fs),real(com_sin))
title('Real part of the generalized complex sinusoid')
grid on

subplot(3,1,3)
plot(t(1:dur*fs),imag(com_sin))
title('Imaginary part of the generalized complex sinusoid')
grid on