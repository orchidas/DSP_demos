%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%

% a demo of the RC circuit

clear all
close all
clc

% circuit parameters
R = 1000; % Ohms
C = 1e-6; % Farads
% transfer function
B = 1;
A = [1,1/(R*C)];


% time and frequency parameters
fs = 48000;
f = 0:fs;

% obtaining the analog filter response
H = freqs(B,A,2*pi*f);

figure(1)
subplot(2,2,1)
semilogx(f,20*log10(abs(H)/max(abs(H))))
hold on
semilogx(f,20*log10(sqrt(1/2)*ones(size(f))))
grid on
axis tight
xlabel('Frequency Hz')
ylabel('dB Magnitude')
title('Analog RC')

% visualize in the s plane
[Z,P] = tf2zp(B,A);
subplot(2,2,3)
plot(real(Z),imag(Z),'oK')
hold on
plot(real(P),imag(P),'xK')
axis([-2000,2000,-2000,2000])
line([0 0], ylim);  %x-axis
line(xlim, [0 0]);  %y-axis
title('s plane')
xlabel('$\sigma$ (radians)','Interpreter','latex')
ylabel('$\omega$ (radians)','Interpreter','latex')

% let's use the bilinear transform to obtain the 
% digital version of the RC circuit
[Bz,Az] = bilinear(B,A,fs);


% obtaining the digital filter response
[H] = freqz(Bz,Az);

f = linspace(0,fs/2,length(H));

figure(1)
subplot(2,2,2)
semilogx(f,20*log10(abs(H)/max(abs(H))))
hold on
semilogx(f,20*log10(sqrt(1/2)*ones(size(f))))
grid on
axis tight
xlabel('Frequency Hz')
ylabel('dB Magnitude')
title('Digital RC')
subplot(2,2,4)
zplane(Bz,Az)
title('z plane')