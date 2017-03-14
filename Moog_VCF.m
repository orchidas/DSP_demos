%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320B       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%

% a demo of Moog VCF

clear all;
close all;
clc;

% cutoff frequency
wc = 1;

% coefficients of a one-order low-pass
B = 1;
A = [1/wc, 1];

% frequency vector
w = logspace(-0.5,1,1000);

% obtain the frequency response
H = freqs(B,A,w);

figure(1)
subplot(2,2,1)
title('Magnitude Response')
semilogx(w,20*log10(abs(H)))
xlabel('Frequency (radians)')
ylabel('Magnitude')
axis tight
grid on
hold on
title('$H(s)=\frac{1}{1+\frac{1}{w_c}}$','Interpreter','latex')
subplot(2,2,3)
title('Phase Response')
semilogx(w,angle(H))
axis tight
xlabel('Frequency (radians)')
ylabel('Phase')
grid on
hold on

% obtain the zeros and poles
[Z,P] = tf2zp(B,A);

subplot(2,2,[2 4])
plot(real(Z),imag(Z),'o')
hold on
plot(real(P),imag(P),'X')
grid on
axis([-1.5 1.5 -1.5 1.5])
line([0 0], ylim);  %x-axis
line(xlim, [0 0]);  %y-axis
title('S plane')

% now find the behavior of the full Moog VCF
% for different values of k

labels = '';

for k = 0:3;
        
    B = 1;
    A = [1/wc^4, 4/wc^3, 6/wc^2, 4/wc, 1+k];
    
    H = freqs(B,A,w);
    
    figure(2)
    subplot(3,2,1)
    title('\textbf{Magnitude Response} $H(s)=\frac{1}{k+(1+\frac{s}{w_c})^4}$','Interpreter','latex')
    semilogx(w,20*log10(abs(H)./(max(abs(H)))))
    xlabel('Frequency (radians)')
    axis tight
    grid on
    hold on
    labels = [labels; sprintf('k = %.2f',k)];   
    legend(labels)    
    subplot(3,2,3)
    title('Phase Response')
    semilogx(w,unwrap(angle(H)))
    xlabel('Frequency (radians)')
    axis tight
    grid on
    hold on
    subplot(3,2,5)
    title('Group Delay')
    semilogx(w,-gradient(unwrap(angle(H))))
    xlabel('Frequency (radians)')
    axis tight
    grid on
    hold on
    
    % obtain the zeros and poles
    [Z,P] = tf2zp(B,A);
    
    subplot(3,2,[2,4,6])
    plot(real(Z),imag(Z),'o')
    hold on
    plot(real(P),imag(P),'X')
    grid on
    axis([-2.5 1.5 -1.5 1.5])
    line([0 0], ylim);  %x-axis
    line(xlim, [0 0]);  %y-axis
    title('S plane')
    
end
