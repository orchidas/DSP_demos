%Taylor series expansion of cosine
clear all, close all, clc;

theta = -10:0.01:10;
nelems = 20;
cos_approx = zeros(1,length(theta));

for n = 0:nelems
    
    curr_taylor = (-1)^n * (theta.^(2*n)/factorial(2*n));
    cos_approx = curr_taylor + cos_approx;
    
    figure(1);
    subplot(311);
    plot(theta, curr_taylor);
    ylim([-1,1]);
    hold on;
    grid on;
    title('Series elements');
    
    subplot(312);
    plot(theta, cos_approx);
    ylim([-1,1]);
    hold on;
    grid on;
    title('Superposition of individual taylor series elements');
    
    subplot(313);
    plot(theta, cos_approx);
    grid on;
    ylim([-1,1]);
    title('Cosine approximation');
    
    pause
end
    