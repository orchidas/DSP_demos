%test QIFFT on oboe 
close all;
[x,fs] = audioread('oboe.ff.C4B4.wav');

npeaks = 10;
%signal frame size
M = round(0.1*fs);
%fft size
%5  is the zero-padding factor
N = 2^nextpow2(M*5);
%window
w = blackman(M);
xseg = x(1:M);

[freqs, peaks] = qifft(xseg,fs,N,w,npeaks);
%convert to linear scale from dB
peaks = 10.^(peaks/20);

%resynthesize oboe sound
y = zeros(length(x),1);
dur = length(x)/fs;
t = 0:1/fs:dur-1/fs;

for k = 1:npeaks
    y = y + peaks(k) * cos(2*pi*t'*freqs(k));
end

%scale the output
y = y./max(abs(y));

%original signal
soundsc(x,fs);
pause;

%resynthesized signal
soundsc(y,fs);


