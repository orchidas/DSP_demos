function [freqs, peaks] = qifft(x,fs,N,w,npeaks)
%UNTITLED2 Summary of this function goes here
%x - block of signal
%fs - sampling rate
%N - size of FFT
%w - window used
%npeaks - number of peaks in spectrum

xwin = x.*w;
X  = fftshift(fft(xwin,N));
%take absolute value and normalize
Xmag = abs(X)/max(abs(X));
Xmag = 20*log10(Xmag);
%retain positive frequencies only
Xmag = Xmag(N/2 + 1:end);
fbins = linspace(0, fs/2, N/2+1);
fbins = fbins(1:end-1);

freqs = zeros(1,npeaks);
peaks = zeros(1,npeaks);

for k = 1:npeaks
    
    %find maximum peak
    [val,kmax] = max(Xmag);
    
    %quadratically interpolate peak
    [A_hat, p] = parabolic_interpolation(Xmag(kmax-1), Xmag(kmax), Xmag(kmax+1));
    
    freqs(k) = kmax + p;
    %in Hz
    freqs(k) = freqs(k) *(fs/N);
    %in dB
    peaks(k) = A_hat;
    
    figure;
    plot(fbins, Xmag);hold on;
    plot(freqs(k), peaks(k), 'r*');hold off;
    xlabel('Frequency in Hz');ylabel('Magnitude in dB');
    
    
    %remove largest peak for next iteration
    n1 = find(Xmag(1:kmax-1) < -60, 1, 'last');
    n2 = find(Xmag(kmax+1:end) < -60, 1, 'first');
    Xmag(n1:kmax+n2) = -100;
    

end

    function [peak,p] = parabolic_interpolation(a,b,c)
        p = 0.5*((a-c)/(a - 2*b +c));
        peak = b - 0.25*(a-c)*p;
    end

%end of function
end