%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prepared by Iran Roman %
%       Music 320B       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
%

clear all; close all; clc;

% A demo on Filters and visualization

% Iterate over coefficient values

for var_coeff = [1.1:0.3:3, -3:0.3:-1.1];
    
    B = [1,var_coeff];
    A = [-var_coeff,1];
    
    figure(1)
    clf
    % this plots poles and zeros in the z plane
    subplot(2,2,[1,3])
    zplane(B,A)
    axis([-3,3,-3,3])
    title('z plane')
    
    % now we can obtain the frequency response
    [H,W] = freqz(B,A);
    subplot(2,2,2)
    semilogx(W,abs(H)/max(abs(H)))
    ylim([-0.1,1])
    xlim([0,pi])
    grid on
    xlabel('Frequency (radians)','Interpreter','latex')
    ylabel('Normalized Magnitude','Interpreter','latex')
    title(sprintf('freqz(B = [1, %.2f], A = [%.2f, 1])', var_coeff, -var_coeff))
    subplot(2,2,4)
    semilogx(W,angle(H))
    axis tight
    grid on
    xlabel('Frequency (radians)','Interpreter','latex')
    ylabel('Angle','Interpreter','latex')
    title('Phase response')
    
    pause(1) % pause x seconds between each filter
    
end
