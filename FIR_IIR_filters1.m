%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320B       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% a demo on FIR and IIR filters

clear all
close all
clc

% IIR: Computation based on previous output. They have FEEDBACK
% Example: y(n) = x(n) - y(n-1)

% FIR: does not depend on output.
% Example: y(n) = x(n) + x(n-1)

% Let's explore a filter example.
% y(n) = x(n) - z*x(n-1)

% this will be the input. Let's say I want to find the impulse response.
% what do I do?
x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
t = 0:length(x)-1;

y = zeros(size(x));

y(1) = x(1);

labels = '';
for z=0.2:0.2:1
    
    for n=2:length(x)
        
        y(n) = x(n) + z*y(n-1);
        
    end
    
    figure(1)
    stem(t,y)
    grid on
    hold on
    title('Impulse response of the system $y(n) = x(n) - zx(n-1)$', 'Interpreter', 'latex')
    xlabel('Time (samples)','Interpreter', 'latex')
    ylabel('Amplitude','Interpreter', 'latex')
    
    % Let's have a look at the frequency response
    NFFT = 2^nextpow2(4*length(y));
    Y = fft(y,NFFT);
    
    freqs = linspace(-pi,pi-2*pi/NFFT,NFFT);
    
    figure(2)
    plot(freqs,fftshift(abs(Y)))
    grid on
    hold on
    axis tight
    title('Frequency response of the system $y(n) = x(n) - zx(n-1)$', 'Interpreter', 'latex')
    xlabel('Frequency ($-\pi ~ to ~ \pi)$','Interpreter', 'latex')
    ylabel('Magnitude','Interpreter', 'latex')
    labels = [labels; sprintf('z = %.2f',z)];
    
end

figure(1)
legend(labels)

figure(2)
legend(labels)
