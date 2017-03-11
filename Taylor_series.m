% a demonstration of a Taylor Series approximation of cosine
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% This will be a Maclaurin series, thus we will be centered on zero

theta = -10:1/100:10;

nelems = 20;

cos_approx = zeros(size(theta));

for n=0:2:nelems*2;
    
    curr_tayl = (((-1).^(n/2))*theta.^n)./factorial(n);
    cos_approx = cos_approx + curr_tayl;
    
    subplot(3,1,1)
    plot(theta,curr_tayl);
    ylim([-1 1])
    grid on    
    hold on
    ylabel('Amplitude')  
    title('Series Elements')
    
    subplot(3,1,2)
    plot(theta,cos_approx);
    ylim([-1 1])
    hold on
    grid on 
    ylabel('Amplitude')
    title('Elements Progressively Added')
    
    subplot(3,1,3)
    plot(theta,cos_approx);
    ylim([-1 1])
    grid on 
    xlabel('Time (s)')
    ylabel('Amplitude')
    title('Current Grand Sum')
    
    pause
    
end