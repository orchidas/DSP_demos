%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320B       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%

% a demo on Quality Factor

clear all
close all
clc

% second order resonant filter (analog)

% limiting our analog frequency response to the
% sampling rate in the digital domain
max_f = 100; % limiting our analog freqs to the digital domain

% parameters for Q
w0 = ones(1,5);
alpha = logspace(1,2,5)/100;

labels = '';

for i=1:length(w0);
    
    % this is the current Q factor
    Q = w0(i)/(2*alpha(i));
    
    % generate the numerator and denominator
    B = [0,0,1];
    A = [1,1/Q,1];
    
    % frequency vector
    W = 0:0.1:max_f;
    
    % generate frequency response
    [H,Ws] = freqs(B,A,W);
    
    figure(1)
    subplot(2,2,[1 3])
    semilogx(Ws,20*log10(abs(H)));
    title('$H(s)=\frac{1}{s^2+\frac{1}{Q}s+1}$ with $Q = \frac{\omega_o}{2\alpha}$','Interpreter','latex')
    hold on
    grid on
    axis tight
    labels = [labels; sprintf('Q = %.2f',Q)];   
    legend(labels)
    
    % obtain the zeros and poles
    [Z,P] = tf2zp(B,A);
    
    subplot(2,2,[2 4])
    plot(real(P),imag(P),'x')
    hold on
    line([0 0], ylim);  %x-axis
    line(xlim, [0 0]);  %y-axis
    axis([-1.5 1.5 -1.5 1.5])
    title('S plane')
end
