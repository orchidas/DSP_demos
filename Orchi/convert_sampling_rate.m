%non-integer sampling rate conversion from 48kHz to 32kHz
close all, clear all, clc;

[x,fs] = audioread('piano2.wav');
%convert to single channel
x = x(:,1);
soundsc(x,fs);
pause;

%upsampling factor
L = 2;
%downsampling factor 
M = 3;

%upsampling
xup = zeros(L*length(x),1);
xup(1:L:end) = x;

figure;
subplot(211);
stem(x(1:10));
ylabel('Original signal');
subplot(212);
stem(xup(1:20),'r');
ylabel('Upsampled signal');

%low pass filtering
cutoff = 1/M;
gain = L;
%get FIR filter coefficients
b = gain*fir1(256,cutoff);
%frequency response
freqz(b,1,512);
%filtering
xupfilt = filter(b,1,xup);

%downsample
%with filtering
xdown = xupfilt(1:M:end);
soundsc(xdown,fs*(2/3));
pause;
%no filtering
xd_nofilt = xup(1:M:end);
soundsc(xd_nofilt,fs*(2/3));

