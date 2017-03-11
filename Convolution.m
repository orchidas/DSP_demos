%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320A       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% we implement a visualization of convolution and correlation

close all;clear all;clc;

% activate this to see correlation instead of convolution
corr_not_conv = 0;

% general digital time variables
fs = 100;
T = 1/fs;
dur = 1;
time = 0:T:dur-T;
N = length(time);

% zero pad these signals for visualization purposes
x = [zeros(1,N) ones(1,50) ones(1,50)*0.8 zeros(1,N*3)];
y = flip([zeros(1,3*N) 0.99.^(1:10:1000) zeros(1,N*2)]);
if corr_not_conv
    y = ([zeros(1,3*N) 0.99.^(1:10:1000) zeros(1,N*2)]);
end

figure(1)
plot(x)
hold on
if corr_not_conv
    plot(y)
else
    plot(flip(y))
end
legend('Singal x', 'Signal y')
xlabel('Samples')
ylabel('Amplitude')

% empty vector for the output of these signals
z = zeros(1,N*5);

for n=1:N*4
    for m=1:N*3
        
        z(n) = z(n) + x(m)*y(m+n);
        
    end
    
    figure(2)
    clf
    subplot(2,1,1)
    if corr_not_conv
        plot(flip(z))
    else
        plot(z)
    end
    
    
    title('Convolution Result')
    if corr_not_conv
        title('Correlation Result')
    end
    subplot(2,1,2)
    plot(x)
    hold on
    plot(y(n:end))
    ylabel('Amplitude')
    xlabel('Samples')
    title('Original Signals')
    pause(0.1)
    
end